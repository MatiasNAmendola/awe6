package demo.assets;
import awe6.interfaces.IKernel;
import flash.display.BitmapData;

/**
 * ...
 * @author Rob Fell
 */

class UnmuteOver extends BitmapData
{
	private static inline var _DATA = "fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffbfbfbffa3a3ddffa3a3dfffa4a4dfffa4a4e0ffa4a4e0ffa4a4e0ffa4a4e0ffa4a4e0ffa4a4e0ffa4a4e0ffa4a4e0ffa4a4e0ffa4a4e0ffa4a4e0ffa4a4e0ffa4a4e0ffa4a4e0ffa4a4e0ffa4a4e0ffa4a4e0ffa4a4e0ffa4a4e0ffa4a4e0ffa4a4e0ffa4a4e0ffa4a4e0ffa4a4e0ffa4a4e0ffa4a4e0ffa4a4e0ffa4a4e0ffa4a4e0ffa4a4e0ffa4a4e0ffa4a4e0ffa5a5e0fffffffffffffffffffffffffff4f4f4ffa4a4daffa5a5ddffa6a6dfffa6a6e0ffa6a6e0ffa6a6e0ffa6a6e0ffa6a6e0ffa6a6e0ffa6a6e0ffa6a6e0ffa6a6e0ffa6a6e0ffa6a6e0ffa6a6e0ffa6a6e0ffa6a6e0ffa6a6e0ffa6a6e0ffa6a6e0ffa6a6e0ffa6a6e0ffa6a6e0ffa6a6e0ffa6a6e0ffa6a6e0ffa6a6e0ffa6a6e0ffa6a6e0ffa6a6e0ffa6a6e0ffa6a6e0ffa6a6e0ffa6a6e0ffa7a7e0ffa8a8e0fffefefeffffffffffffffffffedededffa5a5d6ffa7a7dcffa9a9dfffa9a9e0ffa9a9e0ffa9a9e0ffa9a9e0ffa9a9e0ffa9a9e0ffa9a9e0ffa9a9e0ffa9a9e0ffa9a9e0ffa9a9e0ffa9a9e0ffa9a9e0ffa9a9e0ffa9a9e0ffa9a9e0ffa9a9e0ffa9a9e0ffa9a9e0ffa9a9e0ffa9a9e0ffa9a9e0ffa9a9e0ffa9a9e0ffa9a9e0ffa9a9e0ffa9a9e0ffa9a9e0ffa9a9e0ffa9a9e0ffa9a9e0ffaaaae0ffadade1fffdfdfdffffffffffffffffffe4e4e4ffa6a6d1ffaaaadaffacacdfffadade0ffadade0ffadade0ffadade0ffadade0ffadade0ffadade0ffadade0ffadade0ffadade0ffacacdfffacacdeffababddffaaaadcffa8a8daffa8a8d9ffa8a8d9ffa8a8daffaaaadcffababddffacacdeffacacdfffadade0ffadade0ffadade0ffadade0ffadade0ffadade0ffadade0ffadade0ffadade0ffaeaee0ffb2b2e2fffcfcfcffffffffffffffffffdbdbdbffa6a6cdffacacd8ffafafdeffb0b0e0ffb0b0e0ffb0b0e0ffb0b0e0ffb0b0e0ffb0b0e0ffb0b0e0ffb0b0e0ffafafdfffafafdeffadaddcffababdaffa8a8d6ffa6a6d3ffa4a4d0ffa2a2ceffa1a1ceffa3a3cfffa5a5d1ffa6a6d3ffa9a9d7ffababdaffaeaedcffaeaedeffb0b0e0ffb0b0e0ffb0b0e0ffb0b0e0ffb0b0e0ffb0b0e0ffb0b0e0ffb1b1e0ffb6b6e2fffbfbfbffffffffffffffffffd2d2d2ffa6a6c8ffaeaed6ffb2b2deffb3b3e0ffb3b3e0ffb3b3e0ffb3b3e0ffb3b3e0ffb3b3e0ffb3b3e0ffb2b2dfffb1b1ddffafafdbffababd6ffa7a7d1ffa2a2cbff9e9ec6ff9b9bc2ff9a9ac0ff9999c0ff9a9ac1ff9c9cc3ff9f9fc6ffa2a2caffa6a6d0ffababd6ffadadd9ffb0b0dcffb3b3e0ffb3b3e0ffb3b3e0ffb3b3e0ffb3b3e0ffb3b3e0ffb4b4e0ffbbbbe3fffafafaffffffffffffffffffc8c8c8ffa5a5c3ffafafd4ffb4b4ddffb5b5e0ffb5b5e0ffb5b5e0ffb5b5e0ffb5b5e0ffb5b5e0ffb5b5e0ffb4b4deffb0b0daffacacd5ffa6a6ceff9d9dc2ff9696b9ff9090b3ff8d8dafff8c8caeff8d8daeff8d8dafff8f8fb1ff9292b4ff9797baff9d9dc1ffa3a3cbffababd3ffb0b0d9ffb4b4deffb5b5e0ffb5b5e0ffb5b5e0ffb5b5e0ffb5b5e0ffb7b7e1ffbebee4fff9f9f9ffffffffffffffffffbfbfbfffa4a4beffb0b0d2ffb6b6ddffb8b8e0ffb8b8e0ffb8b8e0ffb8b8e0ffb8b8e0ffb8b8e0ffb7b7dfffb3b3dbffaeaed3ffa5a5c9ff9a9abbff8d8dabff8c8ca7ffaeaebfffd9d9e0ffececefffebebefffdadae1ffb0b0c1ff8c8ca6ff8787a4ff8e8eadff9a9abbffa3a3c7ffaeaed4ffb3b3dbffb7b7dfffb8b8e0ffb8b8e0ffb8b8e0ffb8b8e0ffbabae1ffc3c3e4fff8f8f8ffffffffffffffffffb7b7b7ffa3a3b9ffb1b1d0ffb9b9dcffbbbbe0ffbbbbe0ffbbbbe0ffbbbbe0ffbbbbe0ffbbbbe0ffb9b9ddffb3b3d6ffa8a8caff9a9ab9ff8a8aa5ff9595a8ffd2d2d9ffc1c1caff9494a2ff808093ff838396ff9a9aaaffc2c2ccffdedee2ffc9c9cdff86869dff8c8ca7ff9b9bbaffa9a9caffb4b4d7ffbabadeffbbbbe0ffbbbbe0ffbbbbe0ffbbbbe0ffbdbde1ffc6c6e5fff7f7f7ffffffffffffffffffafafafffa2a2b6ffb2b2ceffbabadcffbdbde0ffbdbde0ffbdbde0ffbdbde0ffbdbde0ffbdbde0ffb9b9daffafafd0ff9f9fbdff8c8ca6ff808095ffd5d5d9fff3f3f4ff71717eff545464ff909096ff646477ff69697dff6d6d80ffa1a1adffe6e6e7ffc3c3c7ff838398ff9191acffa3a3c1ffb2b2d2ffbabadcffbdbde0ffbdbde0ffbdbde0ffbdbde0ffbfbfe1ffc9c9e5fff6f6f6ffffffffffffffffffa9a9a9ffa0a0b2ffb2b2cdffbbbbdcffbebee0ffbebee0ffbebee0ffbebee0ffbebee0ffbebee0ffb6b6d8ffa9a9c8ff9595b0ff7e7e95ff9e9ea9ffb6b6bbffa3a3a9ffd7d7daff99999cffb0b0b0ff565666ff5d5d6eff737380ff6a6a79ffb9b9c1ffd1d1d3ff9b9ba7ff87879fff9c9cb8ffaeaecdffbabadbffbebee0ffbebee0ffbebee0ffbebee0ffc0c0e1ffcacae6fff5f5f5ffffffffffffffffffa4a4a4ff9f9fb0ffb2b2ccffbcbcdcffbfbfe0ffbfbfe0ffbfbfe0ffbfbfe0ffbfbfe0ffbfbfe0ffb5b5d4ffa4a4bfff8d8da5ff717185ffe2e2e4ffaeaeb0ff868688ffbdbdbdffe3e3e3ffc0c0c0ff4a4a56ff525261ffa2a2a6ffa9a9acff898993ffdadadcffb7b7bcff7f7f95ff9797b2ffaaaac8ffb9b9d9ffbfbfe0ffbfbfe0ffbfbfe0ffbfbfe0ffc2c2e1ffcccce6fff5f5f5ffffffffffffffffffa4a4a4ff9f9fb0ffb2b2ccffbdbddcffbfbfe0ffbfbfe0ffbfbfe0ffbfbfe0ffbfbfe0ffbfbfe0ffb3b3d2ffa0a0bcff87879fff6a6a7cfff4f4f4ffbababaffabababffaeaeaeffd2d2d2fff1f1f1ff5f5f6aff4d4d5bff4e4e5bffa4a4a6ff8d8d95ffe7e7e9ffcececeff7b7b90ff9494aeffa9a9c6ffb8b8d8ffbfbfe0ffbfbfe0ffbfbfe0ffbfbfe0ffc2c2e1ffcccce6fff5f5f5ffffffffffffffffffa9a9a9ff8e8eb0ff9696c9ff9a9ad7ff9b9bdbff9b9bdbff9b9bdbff9b9bdbff9b9bdbff9b9bdbff9191cdff8282b7ff6e6e9bff58587cfff5f5f5ffbfbfbfffb3b3b3ffb3b3b3ffb6b6b6ffdcdcdcffd6d6dbff5f5f74ff3d3d55ff929299ff868692ffe4e4e7ffccccccff63638cff7878aaff8989c1ff9696d3ff9b9bdbff9b9bdbff9b9bdbff9b9bdbff9f9fdcffaeaee2fff5f5f5ffffffffffffffffffb0b0b0ff8d8db1ff9393c8ff9696d4ff9797d7ff9797d7ff9797d7ff9797d7ff9797d7ff9797d7ff8f8fcbff8181b8ff7070a0ff5d5d83ffe4e4e6ffb5b5b9ff95959affa1a1a4ffb5b5b5ffb6b6b6ff8c8c9affc2c2c9ff8e8e96ff9f9fa0ff818191ffd3d3d9ffbababeff63638eff7777aaff8787c0ff9292d0ff9797d7ff9797d7ff9797d7ff9797d7ff9b9bd9ffaaaadefff6f6f6ffffffffffffffffffb9b9b9ff8f8fb7ff9595cbff9898d6ff9999d9ff9999d9ff9999d9ff9999d9ff9999d9ff9999d9ff9393d1ff8888c1ff7a7aadff696996ff9696adffaeaebbff45455eff3b3b54ff8d8d95ffb3b3b3ff44445fff9191a1ffe0e0e3ff737383ffb3b3beffbbbbc1ff9d9dabff6a6a97ff7d7db2ff8b8bc6ff9595d3ff9999d9ff9999d9ff9999d9ff9999d9ff9c9cdaffa9a9dffff7f7f7ffffffffffffffffffc3c3c3ff9494beff9a9ad1ff9d9ddbff9e9edeff9e9edeff9e9edeff9e9edeff9e9edeff9e9edeff9a9ad8ff9292ceff8787beff7b7bacff76769effccccd8ff8e8ea4ff565676ff4f4f6eff8e8e99ff4e4e6dff4c4c6affa7a7b5fff3f3f5ffd8d8dcffc1c1c2ff717195ff7777a7ff8787bdff9393d0ff9b9bdaff9e9edeff9e9edeff9e9edeff9e9edeffa0a0dfffababe2fff8f8f8ffffffffffffffffffcdcdcdff9999c5ff9f9fd5ffa2a2ddffa3a3e0ffa3a3e0ffa3a3e0ffa3a3e0ffa3a3e0ffa3a3e0ffa1a1ddff9c9cd6ff9595ccff8c8cc0ff8080afff9191b3ffd0d0ddffbcbcccff8d8da7ff757593ff747491ff8a8aa1ffbcbcc9ffdcdce1ffc1c1c4ff7b7b98ff7474a0ff8585b6ff9292c8ff9c9cd6ffa1a1ddffa3a3e0ffa3a3e0ffa3a3e0ffa3a3e0ffa5a5e0ffaeaee3fff9f9f9ffffffffffffffffffd7d7d7ff9e9ecaffa3a3d7ffa5a5deffa6a6e0ffa6a6e0ffa6a6e0ffa6a6e0ffa6a6e0ffa6a6e0ffa5a5dfffa2a2dcff9e9ed4ff9898cdff9090c3ff8686b5ff8a8ab2ffacacc5ffd6d6e2ffe9e9efffeaeaefffd4d4dfffa2a2b9ff77779aff737399ff7b7ba5ff8787b7ff9292c5ff9c9cd2ffa2a2dbffa5a5dfffa6a6e0ffa6a6e0ffa6a6e0ffa6a6e0ffa8a8e0ffaeaee3fffbfbfbffffffffffffffffffe1e1e1ffa1a1d0ffa6a6d9ffa8a8deffa8a8e0ffa8a8e0ffa8a8e0ffa8a8e0ffa8a8e0ffa8a8e0ffa8a8e0ffa7a7deffa5a5dcffa1a1d7ff9d9dd1ff9797c8ff9191c0ff8b8bb9ff8686b3ff8282aeff8080aaff7e7ea9ff7f7faaff8181acff8686b3ff8e8ebcff9595c7ff9d9dd1ffa2a2d8ffa6a6ddffa8a8e0ffa8a8e0ffa8a8e0ffa8a8e0ffa8a8e0ffaaaae0ffaeaee2fffcfcfcffffffffffffffffffebebebffa5a5d5ffa8a8dbffaaaadfffaaaae0ffaaaae0ffaaaae0ffaaaae0ffaaaae0ffaaaae0ffaaaae0ffa9a9dfffa8a8ddffa7a7dcffa3a3d7ffa0a0d3ff9b9bcdff9797c7ff9494c4ff9292c0ff9191bfff9191c0ff9292c0ff9393c2ff9797c8ff9c9cceffa0a0d3ffa5a5d9ffa7a7dcffa9a9dfffaaaae0ffaaaae0ffaaaae0ffaaaae0ffaaaae0ffababe0ffaeaee1fffdfdfdfffffffffffffffffff3f3f3ffaaaad9ffacacddffadaddfffadade0ffadade0ffadade0ffadade0ffadade0ffadade0ffadade0ffadade0ffacacdfffacacdeffaaaadcffa8a8daffa6a6d6ffa3a3d3ffa1a1d0ff9f9fceff9f9fceffa0a0ceffa0a0cfffa3a3d3ffa5a5d5ffa8a8d9ffababdcffababdeffacacdfffadade0ffadade0ffadade0ffadade0ffadade0ffadade0ffadade0ffafafe1fffefefefffffffffffffffffffafafaffaeaeddffafafdfffafafdfffafafe0ffafafe0ffafafe0ffafafe0ffafafe0ffafafe0ffafafe0ffafafe0ffafafe0ffafafe0ffaeaedfffaeaedeffadadddffacacdcffaaaadaffaaaad9ffaaaad9ffaaaadaffacacdcffadadddffaeaedeffaeaedfffafafe0ffafafe0ffafafe0ffafafe0ffafafe0ffafafe0ffafafe0ffafafe0ffafafe0ffb0b0e0ffb0b0e0ffffffffffffffffffffffffffffffffffb2b2e0ffb2b2e0ffb2b2e0ffb2b2e0ffb2b2e0ffb2b2e0ffb2b2e0ffb2b2e0ffb2b2e0ffb2b2e0ffb2b2e0ffb2b2e0ffb2b2e0ffb2b2e0ffb2b2e0ffb2b2e0ffb2b2e0ffb2b2e0ffb2b2e0ffb2b2e0ffb2b2e0ffb2b2e0ffb2b2e0ffb2b2e0ffb2b2e0ffb2b2e0ffb2b2e0ffb2b2e0ffb2b2e0ffb2b2e0ffb2b2e0ffb2b2e0ffb2b2e0ffb2b2e0ffb2b2e0ffb2b2e0ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff";
	public function new( kernel:IKernel ) 
	{
		super( 40, 28, true, 0x00 );
		setPixels( rect, kernel.tools.hexToBytes( _DATA ) );		
	}	
}
