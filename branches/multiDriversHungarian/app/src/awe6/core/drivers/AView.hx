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

package awe6.core.drivers;
import awe6.core.Context;
import awe6.core.Process;
import awe6.interfaces.IKernel;
import awe6.interfaces.IView;

/**
 * The View class provides a minimalist implementation of the IView interface.
 * <p>It is intended as an abstract class to be extended by target specific drivers.</p>
 * <p>For API documentation please review the corresponding Interfaces.</p>
 * @author	Robert Fell
 */
class AView extends Process, implements IView
{
	public var context( default, null ):Context;
	public var priority( __get_priority, __set_priority ):Int;
	public var owner( default, null ):Dynamic;
	public var parent( __get_parent, null ):IView;
	public var isVisible( default, __set_isVisible ):Bool;	
	public var isInViewStack( __get_isInViewStack, null ):Bool;
	public var x( default, __set_x ):Float;
	public var y( default, __set_y ):Float;
	public var globalX( default, null ):Float;
	public var globalY( default, null ):Float;
	
	private var _isDirty:Bool;
	private var _children:Array<AView>;
	
	public function new( kernel:IKernel, ?context:Context, ?priority:Int = 0, ?owner:Dynamic ) 
	{
		this.context = context;
		this.priority = priority;
		this.owner = owner;
		super( kernel );
	}
	
	override private function _init():Void 
	{
		super._init();
		isVisible = true;
		_isDirty = true;
		_children = new Array<AView>();
		x = y = globalX = globalY = 0;
	}
	
	public function addChild( child:IView, ?priority:Int = 0 ):Void
	{
		if ( isDisposed || ( child == null ) )
		{
			return;
		}
		var l_child:AView = cast child;
		if ( l_child.parent != this )
		{
			child.remove();
			_children.push( l_child );
			l_child._setParent( this );
		}
		if ( priority != 0 )
		{
			child.priority = priority;
		}
		_isDirty = true;
	}
	
	public function removeChild( child:IView ):Void
	{
		if ( isDisposed || ( child == null ) )
		{
			return;
		}
		var l_child:AView = cast child;
		if ( l_child.parent != this )
		{
			return;
		}
		_children.remove( l_child );
		l_child._setParent( null );
		_isDirty = true;
	}
	
	public function remove():Void
	{
		if ( parent != null )
		{
			parent.removeChild( this );
		}
	}
	
	public function clear():Void
	{
		for ( i in _children )
		{
			removeChild( i );
		}
	}
		
	override private function _updater( ?deltaTime:Int = 0 ):Void 
	{
		super._updater( deltaTime );
		for ( i in _children )
		{
			i.update( deltaTime );
		}
		if ( _isDirty )
		{
			_draw();
		}
	}
	
	override private function _disposer():Void 
	{
		remove();
		_nativeDisposer();
		clear();
		super._disposer();	
	}
	
	private function _nativeDisposer():Void
	{
		//override me
	}
	
	private function _draw():Void
	{
		if ( isDisposed )
		{
			return;
		}
		_children.sort( _tools.sortByPriority );
		_nativeDraw();
		_isDirty = false;
	}
	
	private function _nativeDraw():Void
	{
		//override me
	}
	
	private function _setParent( parent:IView ):Void
	{
		this.parent = parent;
	}
	
	private function __get_priority():Int
	{
		return priority;
	}
	
	private function __set_priority( value:Int ):Int
	{
		if ( value == priority )
		{
			return priority;
		}
		priority = value;
		var l_parent:AView = cast parent;
		if ( l_parent != null )
		{
			l_parent._isDirty = true;
		}
		return priority;
	}
	
	private function __set_isVisible( value:Bool ):Bool
	{
		if ( value == isVisible )
		{
			return isVisible;
		}
		isVisible = value;
		var l_parent:AView = cast parent;
		if ( l_parent != null )
		{
			l_parent._draw();
		}
		return isVisible;
	}
	
	private function __get_parent():IView
	{
		return parent;
	}
	
	private function __get_isInViewStack():Bool
	{
		if ( !isVisible )
		{
			return false;
		}
		if ( owner == _kernel )
		{
			return true;
		}
		if ( parent == null )
		{
			return false;
		}
		return parent.isInViewStack;
	}
	
	private function __set_x( value:Float ):Float
	{
		x = value;
		globalX = x + ( ( parent != null ) ? parent.globalX : 0 );
		return x;
	}
	
	private function __set_y( value:Float ):Float
	{
		y = value;
		globalY = y + ( ( parent != null ) ? parent.globalY : 0 );
		return y;
	}
	
	public function setPosition( x:Float, y:Float ):Void
	{
		this.x = x;
		this.y = y;
	}
	
}
