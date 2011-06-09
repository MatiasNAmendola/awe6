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

package awe6.core;
import awe6.interfaces.EOverlayButton;
import awe6.interfaces.EScene;
import awe6.interfaces.IKernel;
import awe6.interfaces.IScene;
import awe6.interfaces.ISceneManager;
import awe6.interfaces.ISceneTransition;
import awe6.interfaces.IView;
import flash.display.Sprite;
import flash.Lib;

/**
 * The SceneManager class provides a minimalist implementation of the ISceneManager interface.
 * <p>For API documentation please review the corresponding Interfaces.</p>
 * @author	Robert Fell
 */
class SceneManager extends Process, implements ISceneManager
{
	public var scene( __get_scene, null ):IScene;
	public var view( default, null ):IView;
	
	private var _sceneTransition:ISceneTransition;

	public function new( kernel:IKernel ) 
	{
		super( kernel );
	}
	
	override private function _init():Void 
	{
		super._init();
		var l_sprite:Sprite = new Sprite();
		l_sprite.graphics.beginFill( _kernel.factory.bgColor );
		l_sprite.graphics.drawRect( 0, 0, _kernel.factory.width, _kernel.factory.height );
		l_sprite.graphics.endFill();
		view = new View( _kernel, l_sprite );
	}
	
	override private function _updater( ?deltaTime:Int = 0 ):Void 
	{
		super._updater( deltaTime );
		if ( scene != null ) scene.update( deltaTime );
		if ( _sceneTransition != null ) _sceneTransition.update( deltaTime );
	}
	
	override private function _disposer():Void 
	{
		if ( scene != null ) scene.dispose();
		if ( _sceneTransition != null ) _sceneTransition.dispose();
		view.dispose();
		super._disposer();
	}
	
	public function setScene( type:EScene ):Void
	{
		var l_previousType:EScene = null;
		if ( scene != null )
		{
			l_previousType = scene.type;
			var l_newSceneTransition:ISceneTransition = _kernel.factory.createSceneTransition( type, l_previousType );
			if ( _sceneTransition != null ) _sceneTransition.dispose();
			_sceneTransition = l_newSceneTransition;
			_kernel.inputs.reset();
			if ( scene.isDisposable ) scene.dispose();
			scene = null; // prevents access to previous scene from freshly created scene
		}
		_kernel.overlay.hideButtons();
		Lib.current.stage.focus = Lib.current.stage;
		scene = _kernel.factory.createScene( type );
		_kernel.overlay.showButton( EOverlayButton.BACK, _kernel.factory.getBackSceneType( scene.type ) != null );
		_kernel.overlay.showButton( EOverlayButton.MUTE, scene.isMuteable && !_kernel.audio.isMute );
		_kernel.overlay.showButton( EOverlayButton.UNMUTE, scene.isMuteable && _kernel.audio.isMute );
		_kernel.overlay.showButton( EOverlayButton.PAUSE, scene.isPauseable && _kernel.isActive );
		_kernel.overlay.showButton( EOverlayButton.UNPAUSE, scene.isPauseable && !_kernel.isActive );
		
		view.addChild( scene.view );
		if ( _sceneTransition != null ) scene.view.addChild( _sceneTransition.view, _tools.BIG_NUMBER + 1 );
		view.update();
	}
	
	public function back():Void
	{
		setScene( _kernel.factory.getBackSceneType( scene.type ) );
	}
	
	public function next():Void
	{
		if ( scene.isSessionSavedOnNext && ( _kernel.session != null ) ) _kernel.session.save();
		setScene( _kernel.factory.getNextSceneType( scene.type ) );
	}
	
	public function restart():Void
	{
		if ( scene == null ) setScene( _kernel.factory.startingSceneType );
		setScene( scene.type );
	}
	
	private function __get_scene():IScene { return scene; }
}

