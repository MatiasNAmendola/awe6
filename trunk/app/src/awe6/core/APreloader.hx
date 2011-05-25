/*
 * Copyright (c) 2010, Robert Fell, awe6.org
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

package awe6.core;
import awe6.interfaces.ETextStyle;
import awe6.interfaces.IKernel;
import awe6.interfaces.IPreloader;
import awe6.interfaces.IView;
import flash.display.Loader;
import flash.display.LoaderInfo;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.IOErrorEvent;
#if flash
import flash.events.ProgressEvent;
import flash.net.URLRequest;
import flash.system.ApplicationDomain;
import flash.system.SecurityDomain;
import flash.system.LoaderContext;
import flash.text.Font;
#end
import flash.text.TextField;

/**
 * The APreloader class provides a minimalist abstract implementation of the IPreloader interface.
 * <p>It is intended as an abstract class to be extended.</p>
 * <p>For API documentation please review the corresponding Interfaces.</p>
 * @author	Robert Fell
 */
class APreloader extends Process, implements IPreloader
{
	private static inline var _FONT_PACKAGE_ID = "assets.fonts";
	public var view( __get_view, null ):IView;
	private var _sprite:Sprite;
	private var _assets:Array<String>;
	private var _isDecached:Bool;
	private var _loader:Loader;
	#if flash 
	private var _context:LoaderContext;
	#end
	private var _currentPerc:Float;
	private var _currentAsset:Int;
	private var _perc:Float;
	private var _textField:TextField;

	public function new( kernel:IKernel, assets:Array<String>, ?isDecached:Bool = false ) 
	{
		_assets = assets;
		_isDecached = isDecached;
		super( kernel );
	}
	
	override private function _init():Void
	{
		super._init();
		_sprite = new Sprite();
		view = new View( _kernel, _sprite );
		view.isVisible = false;
		#if flash
		_context = new LoaderContext();
		_context.applicationDomain = ApplicationDomain.currentDomain;
		if ( !_kernel.isLocal ) _context.securityDomain = SecurityDomain.currentDomain;
		#end
		_currentAsset = 0;
		_perc = 0;
		#if flash
		if ( _assets.length > 0 ) _next();
		#else
		dispose();
		#end
	}
	
	#if flash
	private function _next():Void
	{
		_currentAsset++;
		if ( _currentAsset > _assets.length ) return dispose();
		else _load( _assets[_currentAsset - 1] );
		_currentPerc = 0;
		return;
	}
	
	private function _load( url:String ):Void
	{
		var l_url:String = url;
		if ( _isDecached ) l_url += "?dc=" + Std.random( 99999 );
		// trace( "Loading Asset: " + l_url );
		_loader = new Loader();
		_loader.load( new URLRequest( l_url ), _context );
		_loader.contentLoaderInfo.addEventListener( IOErrorEvent.IO_ERROR, _onError );
		_loader.contentLoaderInfo.addEventListener( ProgressEvent.PROGRESS, _onProgress );
		_loader.contentLoaderInfo.addEventListener( Event.COMPLETE, _onComplete );
	}
	
	override private function _updater( ?deltaTime:Int = 0 ):Void 
	{
		super._updater( deltaTime );
		if ( _assets.length == 0 ) dispose(); // needed to be done this way because preloader must be added and removed from kernel
		view.isVisible = _age > 500;
	}
	#end
	
	override private function _disposer():Void 
	{
		view.dispose();
		#if flash
		_registerFonts();
		if ( _loader != null ) _loader.unloadAndStop();
		#end
		super._disposer();
		_kernel.onPreloaderComplete( this );
		_kernel.overlay.flash();
	}
	
	#if flash
	
	private function _registerFonts():Void
	{
		var l_packageId:String = _kernel.getConfig( "settings.assets.packages.fonts" );
		if ( l_packageId == null ) l_packageId = _kernel.getConfig( "settings.assets.packages.default" );
		if ( l_packageId == null ) l_packageId = _FONT_PACKAGE_ID;		
		for ( i in Type.getEnumConstructs( ETextStyle ) )
		{
			var l_className:String = _tools.toCamelCase( i );
			if ( l_packageId.length > 0 ) l_className = l_packageId + "." + l_className;
			var l_fontClass:Class<Dynamic> = Type.resolveClass( l_className );
			if ( l_fontClass != null )
			{
				try { Font.registerFont( l_fontClass ); }
				catch ( error:Dynamic ) {}
			}
		}
	}
	
	private function _onError( event:IOErrorEvent ):Void
	{
		if ( _textField == null )
		{
			_textField = new TextField();
			_textField.text = "IO Errors Occurred During Asset Preloading:\n\n";
			_textField.multiline = true;
			_textField.wordWrap = true;
			_textField.textColor = 0xFF0000;
			_textField.width = _kernel.factory.width - 100;
			_textField.height = _kernel.factory.height - 100;
			_textField.x = ( _kernel.factory.width - _textField.width ) / 2;
			_textField.y = ( _kernel.factory.height - _textField.height ) / 2;
			_sprite.addChild( _textField );
		}
		_textField.text += event.text + "\n\n";
		view.clear();
	}
	
	private function _onComplete( ?event:Event ):Void
	{
		cast( event.target, LoaderInfo ).removeEventListener( IOErrorEvent.IO_ERROR, _onError );
		cast( event.target, LoaderInfo ).removeEventListener( ProgressEvent.PROGRESS, _onProgress );
		cast( event.target, LoaderInfo ).removeEventListener( Event.COMPLETE, _onComplete );
		cast( event.target, LoaderInfo ).loader.unloadAndStop();
		_next();
	}
	
	private function _onProgress( ?event:ProgressEvent ):Void
	{
		var l_loaderInfo:LoaderInfo = cast( event.target, LoaderInfo );
		_currentPerc = l_loaderInfo.bytesLoaded / l_loaderInfo.bytesTotal;
		_perc = _tools.limit( ( _currentAsset - 1 + _currentPerc ) / _assets.length , 0, 1 );
	}
	
	#end
	
	private function __get_view():IView { return view; }	
}