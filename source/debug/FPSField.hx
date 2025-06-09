package debug;

import openfl.text.TextFormat;
import openfl.display.Sprite;
import openfl.text.TextField;

import flixel.util.FlxStringUtil;

#if cpp
import cpp.vm.Gc;
#end

class FPSField extends DebugField
{
    var gameData:String = '';

    public function new()
    {
        gameData = CoolUtil.developerMode ? 'Developer Mode' : '';

        super('FPS: 0', 26, 'Memory: [N/A]\n' + gameData, 16);

        text.alpha = 0.75;
    }

    var fps:Float = 0;
    
    var memory:Float = 0;
    var memoryPeak:Float = 0;

	private var times:Array<Float> = [];

    override function __enterFrame(time:#if linux Float #else Int #end)
    {
        super.__enterFrame(time);

        final now:Float = haxe.Timer.stamp() * 1000;

		times.push(now);

		while (times[0] < now - 1000)
            times.shift();

        fps = CoolUtil.fpsLerp(fps, times.length < FlxG.updateFramerate ? times.length : FlxG.updateFramerate, 0.5);
    }

    override function updateField(elapsed:Float)
    {
        title.text = 'FPS: ' + Std.string(Math.round(fps));
        
        #if cpp
        memory = Gc.memInfo64(Gc.MEM_INFO_USAGE);

        if (memoryPeak < memory)
            memoryPeak = memory;

        text.text = 'Memory: ' + FlxStringUtil.formatBytes(memory) + ' / ' + FlxStringUtil.formatBytes(memoryPeak) + '\n' + gameData;
        #end
    }
}