/*
 *                        _____ 
 *     _____      _____  / ___/
 *    /__   | /| /   _ \/ __ \ 
 *   / _  / |/ |/ /  __  /_/ / 
 *   \___/|__/|__/\___/\____/  
 *    awe6 is game, inverted
 * 
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

package demo.scenes;
import awe6.core.Scene;
import awe6.extras.gui.Text;
import awe6.interfaces.EAudioChannel;
import awe6.interfaces.EScene;
import awe6.interfaces.ETextStyle;
import awe6.interfaces.IKernel;
import demo.AssetManager;
import demo.Session;

class AScene extends Scene
{
	private var _session:Session;
	private var _assetManager:AssetManager;
	private var _title:String;
	private var _titleText:Text;
	private var _isMusic:Bool;
	
	public function new( p_kernel:IKernel, p_type:EScene, ?p_isPauseable:Bool = false, ?p_isMutable:Bool = true, ?p_isSessionSavedOnNext:Bool = false ) 
	{
		_session = cast p_kernel.session;
		_assetManager = cast p_kernel.assets;
		_title = "?";
		super( p_kernel, p_type, p_isPauseable, p_isMutable, p_isSessionSavedOnNext );
	}
	
	override private function _init():Void 
	{
		super._init();
		view.addChild( _assetManager.background, 0 );
		
		var l_sceneType:String = _tools.toCamelCase( Std.string( type ) );
		_title = Std.string( _kernel.getConfig( "gui.scenes." + l_sceneType + ".title" ) );
		_titleText = new Text( _kernel, _kernel.factory.width, 50, _title, _kernel.factory.createTextStyle( ETextStyle.HEADLINE ) );
		_titleText.y = 40;
		addEntity( _titleText, true, 100 );
		
		_kernel.audio.start( "MusicMenu", EAudioChannel.MUSIC, -1, 0, .125, 0, true );
	}
	
}