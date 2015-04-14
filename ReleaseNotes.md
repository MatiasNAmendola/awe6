# RC 2,4,678 #

Minor release.  Includes:

  * CreateJS driver enhancements
  * Templates overhaul for webfonts and removing table tags
  * Fixed OpenFL html5 audio mute


# RC 2,3,642 #

Minor release.  Includes:

  * Added CreateJS driver & templates
  * Minor fixes on collections (Entities & Messages)
  * Minor fixes to OpenFL-html5 driver
  * Various workarounds for odd gotchas (constructor passthrus, dce etc)


# RC 2,2,605 #

Minor release.  Includes:

  * Masks removed from GuiEntity for js target
  * Various OpenFL-native / cpp related errors fixed
  * Minor enhancements to BasicButton and Text
  * Introduced EJoypadTouch, and automated touch controls on the Joypad (enable via Factory.`_`configurer)


# RC 2,1,585 #

Minor release.  Includes:

  * Minor API fixes and consistencies (e.g. durations to ms:Int)
  * Wrapped untyped driver methods in try catch to ease additional OpenFL HTML5 backends (e.g. bitfive)
  * Minor FlashDevelop template fixes for OpenFL build compatibility
  * View and Entity collections add methods return added item (to allow decoration)
  * Compiles to Neko (via OpenFL native)


# RC 2,0,572 #

Major release, some breaking changes.  Includes:

  * Haxe 3 compatible (refactor to new syntax and conventions)
  * NME drivers replaced with OpenFL drivers
  * Optional paramaters refactored (Floats, Ints, Bools made non-nullable)
  * Run script NME references replaced with OpenFL references
  * FlashDevelop templates updated for above
  * API docs not yet revised, due to chxdoc compatibility


# RC 1,4,550 #

Minor fixes release.  Includes:

  * Linux run scripts & NME template fixes
  * Default init and dispose messages removed from Process (for performance)


# RC 1,3,522 #

Haxe 2.10, NME 3.5.5 (optional) compatible release.  Includes:

  * Linux run scripts to include NME template
  * Flash Fullscreen Context Menu conditional of Player Version
  * IMessageManager expects IEntity as sender type
  * nme and jeash drivers refactored to NME 3.5.x package names


# RC 1,2,492 #

Haxe 2.10 compatible release.  Several issue fixes, new NME FlashDevelop templates and Linux creation scripts.  No breaking changes.


# RC 1,1,445 #

Haxe 2.09 compatible release.  Many improvements, optimizations and consistency reviews.  Some breaking changes:

  * AFactory `_configurer` has `p_isPreconfig` parameter to allow two stage configuration
  * Driver AudioManagers do not assume file extension by target - specify accordingly in project specific AssetManager.


# RC 1,0,391 #

Major update.  Now compatible with all targets - directly or indirectly.  Can be consumed by NME (e.g. include as a lib in your NME project), or can consume NME / Jeash / etc as preferred.

Please note this release required minor public API changes:

  * overriding AFactory `_init` to set properties is now done by overriding AFactory `_configurer`.
  * Overlay is constructed by injecting IView instead of BitmapData.
  * Overlay includes a buttonSize as part of its constructor.
  * All getters and setters have changed to from `__get_%`, `__set_%` to `_get_%`, `_set_%`.
  * Private members originally called `_sprite` and now called `_context`.