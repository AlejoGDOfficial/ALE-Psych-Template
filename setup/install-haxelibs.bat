@echo off
cd ..
@echo on
echo Installing dependencies.

@if not exist ".haxelib\" mkdir .haxelib

haxelib install lime 8.2.2
haxelib install openfl 9.4.1
haxelib install flixel 5.6.1
haxelib install flixel-addons 3.2.3
haxelib install flixel-ui 2.6.1
haxelib install flixel-tools 1.5.1
haxelib install tjson 1.4.0
haxelib install hxcpp 4.3.2
haxelib install hxdiscord_rpc 1.2.4 --skip-dependencies
haxelib git flxanimate https://github.com/ShadowMario/flxanimate dev
haxelib git linc_luajit https://github.com/superpowers04/linc_luajit 633fcc051399afed6781dd60cbf30ed8c3fe2c5a
haxelib install hxvlc 2.2.1

echo Finished!
pause
