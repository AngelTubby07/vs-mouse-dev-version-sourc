package options;

#if desktop
import Discord.DiscordClient;
#end
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import lime.utils.Assets;
import flixel.FlxSubState;
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxSave;
import haxe.Json;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;
import flixel.input.keyboard.FlxKey;
import flixel.graphics.FlxGraphic;
import Controls;

using StringTools;

class GameplaySettingsSubState extends BaseOptionsMenu
{
	public function new()
	{
		title = 'Gameplay Settings';
		rpcTitle = 'Gameplay Settings Menu'; //for Discord Rich Presence
		
		var option:Option = new Option('Controller Mode',
			'Check this if you want to play with\na controller instead of using your Keyboard.',
			'controllerMode',
			'bool',
			false);
		addOption(option);

		//I'd suggest using "Downscroll" as an example for making your own option since it is the simplest here
		var option:Option = new Option('Downscroll', //Name
			'If checked, notes go Down instead of Up, simple enough.', //Description
			'downScroll', //Save data variable name
			'bool', //Variable type
			false); //Default value
		addOption(option);

		var option:Option = new Option('Middlescroll',
			'If checked, your notes get centered.',
			'middleScroll',
			'bool',
			false);
		addOption(option);

		var option:Option = new Option('Ghost Tapping',
			"If checked, you won't get misses from pressing keys\nwhile there are no notes able to be hit.",
			'ghostTapping',
			'bool',
			true);
		addOption(option);

		var option:Option = new Option('Hitsounds Volume',
		    'Volume of the Hitsounds.',
		    'hitsoundVolume',
		    'percent',
		    0);
	    addOption(option);
	    option.scrollSpeed = 1.6;
	    option.minValue = 0.0;
	    option.maxValue = 1;
	    option.changeValue = 0.1;
	    option.decimals = 1;
		
		var option:Option = new Option('Judgement Counter',
			'If checked, shows your Sicks, Goods, Bads and Shits in a part of screen.',
			'judgementCounter',
			'bool',
			true);
		addOption(option);		

		var option:Option = new Option('No Antimash (Antispam)',
		    'If checked, disables Antimash.',
		    'noAntimash',
		    'bool',
		    true);
	    addOption(option);

		var option:Option = new Option('Health Counter',
		    'If unchecked, hides the health counter.',
		    'healthCounter',
		    'bool',
	        true);
        addOption(option);

		var option:Option = new Option('Lane Underlay',
			'If checked, show a Underlay behind the notes.',
			'laneunderlay',
			'bool',
			false);
		addOption(option);	
		
		var option:Option = new Option('Lane Underlay Transparency',
			'Lane Underlay transparency. (Lane Underlay must be enabled)',
			'laneTransparency',
			'float',
			0);
		option.displayFormat = '%v';
		option.scrollSpeed = 20;
		option.minValue = 0;
		option.maxValue = 1;
		option.changeValue = 0.1;
		addOption(option);

		super();

		//var option:Option = new Option('Note Size',
		//    'The size of the notes (0.70 is the default)',
		//    'notesize',
		//    'float',
		//    0.7);
        //option.displayFormat = '%vx';
	    //option.scrollSpeed = 20;
	    //option.minValue = 0.5;
	    //option.maxValue = 0.7;
	    //option.changeValue = 20;
	    //addOption(option);

	    super();

		var option:Option = new Option('Disable Reset Button',
			"If checked, pressing Reset won't do anything.",
			'noReset',
			'bool',
			false);
		addOption(option);

	    var option:Option = new Option('Note Delay',
			'Changes how late a note is spawned.\nUseful for preventing audio lag from wireless earphones.',
			'noteOffset',
			'int',
			0);
		option.displayFormat = '%vms';
		option.scrollSpeed = 100;
		option.minValue = 0;
		option.maxValue = 500;
		addOption(option);

		var option:Option = new Option('Rating Offset',
			'Changes how late/early you have to hit for a "Sick!"\nHigher values mean you have to hit later.',
			'ratingOffset',
			'int',
			0);
		option.displayFormat = '%vms';
		option.scrollSpeed = 20;
		option.minValue = -30;
		option.maxValue = 30;
		addOption(option);

		var option:Option = new Option('Sick! Hit Window',
			'Changes the amount of time you have\nfor hitting a "Sick!" in milliseconds.',
			'sickWindow',
			'int',
			45);
		option.displayFormat = '%vms';
		option.scrollSpeed = 15;
		option.minValue = 15;
		option.maxValue = 45;
		addOption(option);

		var option:Option = new Option('Good Hit Window',
			'Changes the amount of time you have\nfor hitting a "Good" in milliseconds.',
			'goodWindow',
			'int',
			90);
		option.displayFormat = '%vms';
		option.scrollSpeed = 30;
		option.minValue = 15;
		option.maxValue = 90;
		addOption(option);

		var option:Option = new Option('Bad Hit Window',
			'Changes the amount of time you have\nfor hitting a "Bad" in milliseconds.',
			'badWindow',
			'int',
			135);
		option.displayFormat = '%vms';
		option.scrollSpeed = 60;
		option.minValue = 15;
		option.maxValue = 135;
		addOption(option);

		var option:Option = new Option('Safe Frames',
			'Changes how many frames you have for\nhitting a note earlier or late.',
			'safeFrames',
			'float',
			10);
		option.scrollSpeed = 5;
		option.minValue = 2;
		option.maxValue = 10;
		option.changeValue = 0.1;
		addOption(option);

		super();
	}
}