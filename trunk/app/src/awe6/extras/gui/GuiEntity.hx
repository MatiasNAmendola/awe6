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

package awe6.extras.gui;
import awe6.core.Entity;
import awe6.interfaces.IKernel;
import flash.display.Sprite;

class GuiEntity extends Entity
{
	public var x( default, __setX ):Float;
	public var y( default, __setY ):Float;
	public var width( default, null ):Float;
	public var height( default, null ):Float;
	public var isFlippedX( default, __setIsFlippedX ):Bool;
	public var isFlippedY( default, __setIsFlippedY ):Bool;
	
	private var _sprite:Sprite;
	
	public function new( kernel:IKernel, ?width:Float = 100, ?height:Float = 100, ?isMasked:Bool = true )
	{
		this.isFlippedX = false;
		this.isFlippedY = false;
		this.width = width;
		this.height = height;
		_sprite = new Sprite();
		if ( isMasked )
		{
			var l_mask:Sprite = new Sprite();
			l_mask.graphics.beginFill( 0xFF0000 );
			l_mask.graphics.drawRect( 0, 0, width, height );
			_sprite.addChild( l_mask );
			_sprite.mask = l_mask;
		}
		super( kernel, _sprite );
	}
	
	public function setPosition( x:Float, y:Float ):Void { this.x = x; this.y = y; }
	private function __setX( value:Float ):Float { x = value; _sprite.x = x; return x; }
	private function __setY( value:Float ):Float { y = value; _sprite.y = y; return y; }
	
	private function __setIsFlippedX( value:Bool ):Bool
	{
		if ( value == isFlippedX ) return isFlippedX;
		isFlippedX = value;
		_sprite.scaleX *= -1;
		if ( isFlippedX ) x += width;
		else x -= width;
		return isFlippedX;
	}

	private function __setIsFlippedY( value:Bool ):Bool
	{
		if ( value == isFlippedY ) return isFlippedY;
		isFlippedY = value;
		_sprite.scaleY *= -1;
		if ( isFlippedY ) y += height;
		else y -= height;
		return isFlippedY;
	}
}