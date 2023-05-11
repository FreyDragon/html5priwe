package;

import haxe.io.Bytes;
import lime.utils.AssetBundle;
import lime.utils.AssetLibrary;
import lime.utils.AssetManifest;
import lime.utils.Assets;

#if sys
import sys.FileSystem;
#end

#if disable_preloader_assets
@:dox(hide) class ManifestResources {
	public static var preloadLibraries:Array<Dynamic>;
	public static var preloadLibraryNames:Array<String>;
	public static var rootPath:String;

	public static function init (config:Dynamic):Void {
		preloadLibraries = new Array ();
		preloadLibraryNames = new Array ();
	}
}
#else
@:access(lime.utils.Assets)


@:keep @:dox(hide) class ManifestResources {


	public static var preloadLibraries:Array<AssetLibrary>;
	public static var preloadLibraryNames:Array<String>;
	public static var rootPath:String;


	public static function init (config:Dynamic):Void {

		preloadLibraries = new Array ();
		preloadLibraryNames = new Array ();

		rootPath = null;

		if (config != null && Reflect.hasField (config, "rootPath")) {

			rootPath = Reflect.field (config, "rootPath");

			if(!StringTools.endsWith (rootPath, "/")) {

				rootPath += "/";

			}

		}

		if (rootPath == null) {

			#if (ios || tvos || emscripten)
			rootPath = "assets/";
			#elseif android
			rootPath = "";
			#elseif console
			rootPath = lime.system.System.applicationDirectory;
			#else
			rootPath = "./";
			#end

		}

		#if (openfl && !flash && !display)
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_pixel_otf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_vcr_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_monsterrat_ttf);
		
		#end

		var data, manifest, library, bundle;

		#if kha

		null
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("null", library);

		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("null");

		#else

		data = '{"name":null,"assets":"ah","rootPath":null,"version":2,"libraryArgs":[],"libraryType":null}';
		manifest = AssetManifest.parse (data, rootPath);
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("videos", library);
		Assets.libraryPaths["songs"] = rootPath + "manifest/songs.json";
		Assets.libraryPaths["shared"] = rootPath + "manifest/shared.json";
		Assets.libraryPaths["week2"] = rootPath + "manifest/week2.json";
		Assets.libraryPaths["week3"] = rootPath + "manifest/week3.json";
		Assets.libraryPaths["week4"] = rootPath + "manifest/week4.json";
		Assets.libraryPaths["week5"] = rootPath + "manifest/week5.json";
		Assets.libraryPaths["week6"] = rootPath + "manifest/week6.json";
		Assets.libraryPaths["week7"] = rootPath + "manifest/week7.json";
		data = '{"name":null,"assets":"aoy4:pathy21:do%20NOT%20readme.txty4:sizei4326y4:typey4:TEXTy2:idR1y7:preloadtgoR0y34:assets%2Ffonts%2Ffonts-go-here.txtR2zR3R4R5R7R6tgoR2i14656R3y4:FONTy9:classNamey31:__ASSET__assets_fonts_pixel_otfR5y26:assets%2Ffonts%2Fpixel.otfR6tgoR2i75864R3R8R9y29:__ASSET__assets_fonts_vcr_ttfR5y24:assets%2Ffonts%2Fvcr.ttfR6tgoR2i2114R3y5:MUSICR5y26:flixel%2Fsounds%2Fbeep.mp3y9:pathGroupaR15y26:flixel%2Fsounds%2Fbeep.ogghR6tgoR2i39706R3R14R5y28:flixel%2Fsounds%2Fflixel.mp3R16aR18y28:flixel%2Fsounds%2Fflixel.ogghR6tgoR2i5794R3y5:SOUNDR5R17R16aR15R17hgoR2i33629R3R20R5R19R16aR18R19hgoR2i15744R3R8R9y35:__ASSET__flixel_fonts_nokiafc22_ttfR5y30:flixel%2Ffonts%2Fnokiafc22.ttfR6tgoR2i29724R3R8R9y36:__ASSET__flixel_fonts_monsterrat_ttfR5y31:flixel%2Ffonts%2Fmonsterrat.ttfR6tgoR0y33:flixel%2Fimages%2Fui%2Fbutton.pngR2i519R3y5:IMAGER5R25R6tgoR0y36:flixel%2Fimages%2Flogo%2Fdefault.pngR2i3280R3R26R5R27R6tgoR0y34:flixel%2Fflixel-ui%2Fimg%2Fbox.pngR2i912R3R26R5R28R6tgoR0y37:flixel%2Fflixel-ui%2Fimg%2Fbutton.pngR2i433R3R26R5R29R6tgoR0y48:flixel%2Fflixel-ui%2Fimg%2Fbutton_arrow_down.pngR2i446R3R26R5R30R6tgoR0y48:flixel%2Fflixel-ui%2Fimg%2Fbutton_arrow_left.pngR2i459R3R26R5R31R6tgoR0y49:flixel%2Fflixel-ui%2Fimg%2Fbutton_arrow_right.pngR2i511R3R26R5R32R6tgoR0y46:flixel%2Fflixel-ui%2Fimg%2Fbutton_arrow_up.pngR2i493R3R26R5R33R6tgoR0y42:flixel%2Fflixel-ui%2Fimg%2Fbutton_thin.pngR2i247R3R26R5R34R6tgoR0y44:flixel%2Fflixel-ui%2Fimg%2Fbutton_toggle.pngR2i534R3R26R5R35R6tgoR0y40:flixel%2Fflixel-ui%2Fimg%2Fcheck_box.pngR2i922R3R26R5R36R6tgoR0y41:flixel%2Fflixel-ui%2Fimg%2Fcheck_mark.pngR2i946R3R26R5R37R6tgoR0y37:flixel%2Fflixel-ui%2Fimg%2Fchrome.pngR2i253R3R26R5R38R6tgoR0y42:flixel%2Fflixel-ui%2Fimg%2Fchrome_flat.pngR2i212R3R26R5R39R6tgoR0y43:flixel%2Fflixel-ui%2Fimg%2Fchrome_inset.pngR2i192R3R26R5R40R6tgoR0y43:flixel%2Fflixel-ui%2Fimg%2Fchrome_light.pngR2i214R3R26R5R41R6tgoR0y44:flixel%2Fflixel-ui%2Fimg%2Fdropdown_mark.pngR2i156R3R26R5R42R6tgoR0y41:flixel%2Fflixel-ui%2Fimg%2Ffinger_big.pngR2i1724R3R26R5R43R6tgoR0y43:flixel%2Fflixel-ui%2Fimg%2Ffinger_small.pngR2i294R3R26R5R44R6tgoR0y38:flixel%2Fflixel-ui%2Fimg%2Fhilight.pngR2i129R3R26R5R45R6tgoR0y36:flixel%2Fflixel-ui%2Fimg%2Finvis.pngR2i128R3R26R5R46R6tgoR0y41:flixel%2Fflixel-ui%2Fimg%2Fminus_mark.pngR2i136R3R26R5R47R6tgoR0y40:flixel%2Fflixel-ui%2Fimg%2Fplus_mark.pngR2i147R3R26R5R48R6tgoR0y36:flixel%2Fflixel-ui%2Fimg%2Fradio.pngR2i191R3R26R5R49R6tgoR0y40:flixel%2Fflixel-ui%2Fimg%2Fradio_dot.pngR2i153R3R26R5R50R6tgoR0y37:flixel%2Fflixel-ui%2Fimg%2Fswatch.pngR2i185R3R26R5R51R6tgoR0y34:flixel%2Fflixel-ui%2Fimg%2Ftab.pngR2i201R3R26R5R52R6tgoR0y39:flixel%2Fflixel-ui%2Fimg%2Ftab_back.pngR2i210R3R26R5R53R6tgoR0y44:flixel%2Fflixel-ui%2Fimg%2Ftooltip_arrow.pngR2i18509R3R26R5R54R6tgoR0y39:flixel%2Fflixel-ui%2Fxml%2Fdefaults.xmlR2i1263R3R4R5R55R6tgoR0y53:flixel%2Fflixel-ui%2Fxml%2Fdefault_loading_screen.xmlR2i1953R3R4R5R56R6tgoR0y44:flixel%2Fflixel-ui%2Fxml%2Fdefault_popup.xmlR2i1848R3R4R5R57R6tgh","rootPath":null,"version":2,"libraryArgs":[],"libraryType":null}';
		manifest = AssetManifest.parse (data, rootPath);
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("default", library);
		

		library = Assets.getLibrary ("videos");
		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("videos");
		library = Assets.getLibrary ("default");
		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("default");
		

		#end

	}


}


#if kha

null

#else

#if !display
#if flash

@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_blammed_inst_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_blammed_voices_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_bopeebo_inst_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_bopeebo_voices_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_cocoa_inst_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_cocoa_voices_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_dad_battle_inst_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_dad_battle_voices_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_eggnog_inst_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_eggnog_voices_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_fresh_inst_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_fresh_voices_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_furry_frey_busts_a_nut_inst_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_furry_frey_busts_a_nut_voices_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_guns_inst_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_guns_voices_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_harmonic_havoc_inst_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_harmonic_havoc_voices_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_high_inst_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_high_voices_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_hot_dilf_inst_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_hot_dilf_voices_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_milf_inst_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_milf_voices_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_misconception_inst_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_misconception_voices_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_monster_inst_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_monster_voices_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_neon_soul_inst_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_neon_soul_voices_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_oasis_inst_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_oasis_voices_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_philly_nice_inst_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_philly_nice_voices_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_pico_inst_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_pico_voices_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_readme_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_remittance_inst_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_remittance_voices_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_roses_inst_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_roses_voices_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_salem_inst_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_salem_voices_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_satin_panties_inst_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_satin_panties_voices_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_senpai_inst_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_senpai_voices_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_south_inst_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_south_voices_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_spookeez_inst_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_spookeez_voices_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_stress_inst_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_stress_voices_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_temptation_inst_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_temptation_voices_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_test_inst_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_test_voices_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_thorns_inst_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_thorns_voices_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_tutorial_inst_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_ugh_inst_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_ugh_voices_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_vivid_shade_inst_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_vivid_shade_voices_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_volcanic_inst_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_volcanic_voices_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_winter_horrorland_inst_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_songs_winter_horrorland_voices_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_bad_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_bkg_mdp extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_bkg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_bkg_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_bfandgf_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_bfandgf_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_bfcar_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_bfcar_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_bfchristmas_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_bfchristmas_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_bfholdinggf_dead_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_bfholdinggf_dead_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_bfpixel_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_bfpixel_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_bfpixelsdead_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_bfpixelsdead_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_bfreanim_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_bfreanim_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_boyfriend_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_boyfriend_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_boyfriend_dead_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_boyfriend_dead_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_daddy_dearest_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_daddy_dearest_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_frey_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_frey_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_gfcar_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_gfcar_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_gfchristmas_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_gfchristmas_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_gfpixel_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_gfpixel_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_gftankmen_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_gftankmen_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_gf_assets_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_gf_assets_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_invisibru_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_invisibru_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_momcar_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_momcar_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_mom_assets_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_mom_assets_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_mom_dad_christmas_assets_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_mom_dad_christmas_assets_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_monsterchristmas_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_monsterchristmas_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_monster_assets_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_monster_assets_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_olly_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_olly_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_picospeaker_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_picospeaker_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_pico_fnf_assetss_copy_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_pico_fnf_assetss_copy_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_pico_fnf_assetss_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_pico_fnf_assetss_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_por_favor_me_mata_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_readme_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_salem_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_salem_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_senpai_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_senpai_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_spirit_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_spirit_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_spooky_kids_assets_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_spooky_kids_assets_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_tankmancaptain_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_tankmancaptain_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_template1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_template1_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_template10_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_template10_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_template11_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_template11_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_template12_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_template12_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_template2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_template2_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_template3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_template3_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_template4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_template4_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_template5_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_template5_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_template6_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_template6_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_template7_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_template7_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_template8_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_template8_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_victor_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_victor_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_wraithattack_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_wraithattack_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_combo_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_coolnotetemplate_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_dangernote_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_dangernote_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_dialogue_bf_dialogue_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_dialogue_bf_dialogue_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_dialogue_bob_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_dialogue_bob_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_dialogue_bob_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_dialogue_bod_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_dialogue_bod_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_dialogue_bod_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_dialogue_gf_dialogue_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_dialogue_gf_dialogue_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_dialogue_readme_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_dialogue_template1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_dialogue_template1_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_dialogue_template2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_dialogue_template2_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_dialogue_template3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_dialogue_template3_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_dialogue_template4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_dialogue_template4_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_eventarrow_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_fred_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_fred_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_frey_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_frey_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_funnus_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_funnus_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_furrygang_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_furrynote_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_furrynote_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_ghostnote_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_ghostnote_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_go_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_good_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_grafix_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_healthbar_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_heartclinic_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_heartclinic_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_hitbox_hitbox_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_hitbox_hitbox_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_hitbox_hitbox_hint_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_hitbox_hitbox_hint_old_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_hurtnotesplashes_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_hurtnotesplashes_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_hurtnote_assets_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_hurtnote_assets_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_icons_icon_daade_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_icons_icon_furries_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_icons_icon_salem_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_icons_readme_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_images_go_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_lessoldfont_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_market_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_market_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_menubackgrounds_readme_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_menucharacters_menu_frey_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_menucharacters_menu_frey_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_menucharacters_menu_frey_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_menucharacters_menu_olly_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_menucharacters_menu_olly_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_menucharacters_menu_olly_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_menucharacters_readme_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_menudifficulties_classic_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_menudifficulties_expert_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_menudifficulties_master_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_newfont_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_newfont_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_noanimbkg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_notesplashes_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_notesplashes_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_note_assets_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_note_assets_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_oldbkg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_oldfont_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_oldfred_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_oldfred_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_olly_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_olly_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_pausealt_bflol_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_pausealt_bflol_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_pausealt_pausebg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_pausealt_pauseui_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_pausealt_pauseui_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_bad_pixel_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_combo_pixel_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_date_pixel_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_good_pixel_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_hurtnote_assets_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_hurtnote_assetsends_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_note_assets_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_note_assetsends_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_num0_pixel_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_num1_pixel_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_num2_pixel_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_num3_pixel_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_num4_pixel_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_num5_pixel_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_num6_pixel_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_num7_pixel_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_num8_pixel_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_num9_pixel_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_ready_pixel_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_set_pixel_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_shit_pixel_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_sick_pixel_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_ready_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_set_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_shit_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_sick_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_smoke_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_speech_bubble_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_speech_bubble_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_spotlight_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_stageback_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_stagecurtains_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_stagefront_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_stage_light_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_starnote_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_starnote_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_storymenu_readme_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_timebar_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_victor_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_victor_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_weeb_weebschool_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_weeb_weebsky_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_weeb_weebstreet_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_weeb_weebtrees_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_weeb_weebtrees_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_wraithattack_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_images_wraithattack_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_music_breakfast_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_music_gameover_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_music_gameoverend_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_music_tea_time_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_angry_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_angry_text_box_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_attack_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_badnoise1_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_badnoise2_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_badnoise3_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_chartingtick_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_clicktext_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_dialogue_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_dialogueclose_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_fnf_loss_sfx_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_freytalk_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_gf_1_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_gf_2_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_gf_3_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_gf_4_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_hitsound_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_inst_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_intro1_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_intro2_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_intro3_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_introgo_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_metronome_tick_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_missnote1_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_missnote2_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_missnote3_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_ollytalk_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_osu_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_plumtalk_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_readme_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_rosetalk_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_shoot_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_sounds_go_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_soundtest_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_warn_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week2_images_halloween_bg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week2_images_halloween_bg_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week2_images_halloween_bg_low_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week2_sounds_thunder_1_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week2_sounds_thunder_2_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week2_week2_stuff_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week3_images_philly_behindtrain_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week3_images_philly_city_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week3_images_philly_gradient_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week3_images_philly_particle_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week3_images_philly_sky_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week3_images_philly_street_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week3_images_philly_train_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week3_images_philly_win0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week3_images_philly_win1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week3_images_philly_win2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week3_images_philly_win3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week3_images_philly_win4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week3_images_philly_window_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week3_sounds_train_passes_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week3_week3_stuff_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week4_images_gore_coldheartkiller_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week4_images_gore_metalpole_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week4_images_gore_noooooo_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week4_images_gore_noooooo_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week4_images_gore_stupidblood_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week4_images_gore_stupidblood_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week4_images_limo_bglimo_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week4_images_limo_bglimo_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week4_images_limo_dumb_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week4_images_limo_fastcarlol_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week4_images_limo_limodancer_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week4_images_limo_limodancer_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week4_images_limo_limodrive_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week4_images_limo_limodrive_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week4_images_limo_limosunset_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week4_sounds_carpass0_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week4_sounds_carpass1_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week4_sounds_dancerdeath_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week4_week4_stuff_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week5_images_christmas_bgescalator_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week5_images_christmas_bgwalls_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week5_images_christmas_bottombop_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week5_images_christmas_bottombop_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week5_images_christmas_christmastree_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week5_images_christmas_evilbg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week5_images_christmas_evilsnow_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week5_images_christmas_eviltree_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week5_images_christmas_fgsnow_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week5_images_christmas_santa_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week5_images_christmas_santa_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week5_images_christmas_upperbop_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week5_images_christmas_upperbop_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week5_sounds_lights_shut_off_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week5_sounds_lights_turn_on_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week5_week5_stuff_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week6_images_weeb_animatedevilschool_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week6_images_weeb_animatedevilschool_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week6_images_weeb_animatedevilschool_low_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week6_images_weeb_bfportrait_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week6_images_weeb_bfportrait_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week6_images_weeb_bgfreaks_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week6_images_weeb_bgfreaks_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week6_images_weeb_bgghouls_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week6_images_weeb_bgghouls_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week6_images_weeb_evilschoolbg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week6_images_weeb_evilschoolfg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week6_images_weeb_petals_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week6_images_weeb_petals_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week6_images_weeb_pixelui_dialoguebox_evil_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week6_images_weeb_pixelui_dialoguebox_evil_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week6_images_weeb_pixelui_dialoguebox_pixel_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week6_images_weeb_pixelui_dialoguebox_pixel_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week6_images_weeb_pixelui_dialoguebox_senpaimad_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week6_images_weeb_pixelui_dialoguebox_senpaimad_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week6_images_weeb_pixelui_hand_textbox_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week6_images_weeb_senpaicrazy_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week6_images_weeb_senpaicrazy_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week6_images_weeb_senpaiportrait_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week6_images_weeb_senpaiportrait_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week6_images_weeb_spiritfaceforward_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week6_images_weeb_weebtreesback_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week6_music_gameover_pixel_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week6_music_gameoverend_pixel_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week6_music_lunchbox_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week6_music_lunchboxscary_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week6_sounds_fnf_loss_sfx_pixel_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week6_sounds_pixeltext_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week6_sounds_senpai_dies_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week6_week6_stuff_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week7_images_cutscenes_guns_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week7_images_cutscenes_guns_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week7_images_cutscenes_stress_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week7_images_cutscenes_stress_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week7_images_cutscenes_stress2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week7_images_cutscenes_stress2_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week7_images_cutscenes_stressgf_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week7_images_cutscenes_stressgf_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week7_images_cutscenes_stresspico_animation_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week7_images_cutscenes_stresspico_spritemap_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week7_images_cutscenes_stresspico_spritemap_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week7_images_cutscenes_ugh_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week7_images_cutscenes_ugh_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week7_images_smokeleft_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week7_images_smokeleft_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week7_images_smokeright_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week7_images_smokeright_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week7_images_tank0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week7_images_tank0_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week7_images_tank1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week7_images_tank1_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week7_images_tank2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week7_images_tank2_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week7_images_tank3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week7_images_tank3_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week7_images_tank4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week7_images_tank4_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week7_images_tank5_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week7_images_tank5_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week7_images_tankbuildings_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week7_images_tankclouds_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week7_images_tankground_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week7_images_tankmankilled1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week7_images_tankmankilled1_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week7_images_tankmountains_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week7_images_tankrolling_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week7_images_tankrolling_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week7_images_tankruins_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week7_images_tanksky_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week7_images_tankwatchtower_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week7_images_tankwatchtower_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week7_music_distorto_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week7_sounds_bfbeep_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week7_sounds_jeffgameover_jeffgameover_1_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week7_sounds_jeffgameover_jeffgameover_10_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week7_sounds_jeffgameover_jeffgameover_11_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week7_sounds_jeffgameover_jeffgameover_12_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week7_sounds_jeffgameover_jeffgameover_13_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week7_sounds_jeffgameover_jeffgameover_14_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week7_sounds_jeffgameover_jeffgameover_15_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week7_sounds_jeffgameover_jeffgameover_16_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week7_sounds_jeffgameover_jeffgameover_17_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week7_sounds_jeffgameover_jeffgameover_18_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week7_sounds_jeffgameover_jeffgameover_19_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week7_sounds_jeffgameover_jeffgameover_2_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week7_sounds_jeffgameover_jeffgameover_20_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week7_sounds_jeffgameover_jeffgameover_21_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week7_sounds_jeffgameover_jeffgameover_22_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week7_sounds_jeffgameover_jeffgameover_23_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week7_sounds_jeffgameover_jeffgameover_24_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week7_sounds_jeffgameover_jeffgameover_25_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week7_sounds_jeffgameover_jeffgameover_3_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week7_sounds_jeffgameover_jeffgameover_4_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week7_sounds_jeffgameover_jeffgameover_5_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week7_sounds_jeffgameover_jeffgameover_6_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week7_sounds_jeffgameover_jeffgameover_7_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week7_sounds_jeffgameover_jeffgameover_8_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week7_sounds_jeffgameover_jeffgameover_9_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week7_sounds_killyou_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week7_sounds_stresscutscene_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week7_sounds_tanksong2_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_week7_sounds_wellwellwell_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__do_not_readme_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_fonts_go_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_pixel_otf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_vcr_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_box_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_down_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_left_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_right_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_up_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_thin_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_toggle_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_check_box_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_check_mark_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_flat_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_inset_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_light_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_dropdown_mark_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_finger_big_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_finger_small_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_hilight_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_invis_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_minus_mark_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_plus_mark_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_radio_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_radio_dot_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_swatch_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_tab_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_tab_back_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_tooltip_arrow_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_xml_defaults_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_xml_default_loading_screen_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_xml_default_popup_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__manifest_videos_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__manifest_songs_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__manifest_shared_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__manifest_week2_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__manifest_week3_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__manifest_week4_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__manifest_week5_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__manifest_week6_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__manifest_week7_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__manifest_default_json extends null { }


#elseif (desktop || cpp)

@:keep @:file("assets/songs/blammed/Inst.ogg") @:noCompletion #if display private #end class __ASSET__assets_songs_blammed_inst_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/songs/blammed/Voices.ogg") @:noCompletion #if display private #end class __ASSET__assets_songs_blammed_voices_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/songs/bopeebo/Inst.ogg") @:noCompletion #if display private #end class __ASSET__assets_songs_bopeebo_inst_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/songs/bopeebo/Voices.ogg") @:noCompletion #if display private #end class __ASSET__assets_songs_bopeebo_voices_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/songs/cocoa/Inst.ogg") @:noCompletion #if display private #end class __ASSET__assets_songs_cocoa_inst_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/songs/cocoa/Voices.ogg") @:noCompletion #if display private #end class __ASSET__assets_songs_cocoa_voices_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/songs/dad-battle/Inst.ogg") @:noCompletion #if display private #end class __ASSET__assets_songs_dad_battle_inst_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/songs/dad-battle/Voices.ogg") @:noCompletion #if display private #end class __ASSET__assets_songs_dad_battle_voices_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/songs/eggnog/Inst.ogg") @:noCompletion #if display private #end class __ASSET__assets_songs_eggnog_inst_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/songs/eggnog/Voices.ogg") @:noCompletion #if display private #end class __ASSET__assets_songs_eggnog_voices_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/songs/fresh/Inst.ogg") @:noCompletion #if display private #end class __ASSET__assets_songs_fresh_inst_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/songs/fresh/Voices.ogg") @:noCompletion #if display private #end class __ASSET__assets_songs_fresh_voices_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/songs/Furry-frey-Busts-a-Nut/Inst.ogg") @:noCompletion #if display private #end class __ASSET__assets_songs_furry_frey_busts_a_nut_inst_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/songs/Furry-frey-Busts-a-Nut/Voices.ogg") @:noCompletion #if display private #end class __ASSET__assets_songs_furry_frey_busts_a_nut_voices_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/songs/guns/Inst.ogg") @:noCompletion #if display private #end class __ASSET__assets_songs_guns_inst_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/songs/guns/Voices.ogg") @:noCompletion #if display private #end class __ASSET__assets_songs_guns_voices_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/songs/Harmonic-Havoc/Inst.ogg") @:noCompletion #if display private #end class __ASSET__assets_songs_harmonic_havoc_inst_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/songs/Harmonic-Havoc/Voices.ogg") @:noCompletion #if display private #end class __ASSET__assets_songs_harmonic_havoc_voices_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/songs/high/Inst.ogg") @:noCompletion #if display private #end class __ASSET__assets_songs_high_inst_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/songs/high/Voices.ogg") @:noCompletion #if display private #end class __ASSET__assets_songs_high_voices_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/songs/hot-dilf/Inst.ogg") @:noCompletion #if display private #end class __ASSET__assets_songs_hot_dilf_inst_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/songs/hot-dilf/Voices.ogg") @:noCompletion #if display private #end class __ASSET__assets_songs_hot_dilf_voices_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/songs/milf/Inst.ogg") @:noCompletion #if display private #end class __ASSET__assets_songs_milf_inst_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/songs/milf/Voices.ogg") @:noCompletion #if display private #end class __ASSET__assets_songs_milf_voices_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/songs/Misconception/Inst.ogg") @:noCompletion #if display private #end class __ASSET__assets_songs_misconception_inst_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/songs/Misconception/Voices.ogg") @:noCompletion #if display private #end class __ASSET__assets_songs_misconception_voices_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/songs/monster/Inst.ogg") @:noCompletion #if display private #end class __ASSET__assets_songs_monster_inst_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/songs/monster/Voices.ogg") @:noCompletion #if display private #end class __ASSET__assets_songs_monster_voices_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/songs/Neon-Soul/Inst.ogg") @:noCompletion #if display private #end class __ASSET__assets_songs_neon_soul_inst_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/songs/Neon-Soul/Voices.ogg") @:noCompletion #if display private #end class __ASSET__assets_songs_neon_soul_voices_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/songs/Oasis/Inst.ogg") @:noCompletion #if display private #end class __ASSET__assets_songs_oasis_inst_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/songs/Oasis/Voices.ogg") @:noCompletion #if display private #end class __ASSET__assets_songs_oasis_voices_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/songs/philly-nice/Inst.ogg") @:noCompletion #if display private #end class __ASSET__assets_songs_philly_nice_inst_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/songs/philly-nice/Voices.ogg") @:noCompletion #if display private #end class __ASSET__assets_songs_philly_nice_voices_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/songs/pico/Inst.ogg") @:noCompletion #if display private #end class __ASSET__assets_songs_pico_inst_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/songs/pico/Voices.ogg") @:noCompletion #if display private #end class __ASSET__assets_songs_pico_voices_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/songs/readme.txt") @:noCompletion #if display private #end class __ASSET__assets_songs_readme_txt extends haxe.io.Bytes {}
@:keep @:file("assets/songs/Remittance/Inst.ogg") @:noCompletion #if display private #end class __ASSET__assets_songs_remittance_inst_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/songs/Remittance/Voices.ogg") @:noCompletion #if display private #end class __ASSET__assets_songs_remittance_voices_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/songs/roses/Inst.ogg") @:noCompletion #if display private #end class __ASSET__assets_songs_roses_inst_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/songs/roses/Voices.ogg") @:noCompletion #if display private #end class __ASSET__assets_songs_roses_voices_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/songs/Salem/Inst.ogg") @:noCompletion #if display private #end class __ASSET__assets_songs_salem_inst_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/songs/Salem/Voices.ogg") @:noCompletion #if display private #end class __ASSET__assets_songs_salem_voices_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/songs/satin-panties/Inst.ogg") @:noCompletion #if display private #end class __ASSET__assets_songs_satin_panties_inst_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/songs/satin-panties/Voices.ogg") @:noCompletion #if display private #end class __ASSET__assets_songs_satin_panties_voices_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/songs/senpai/Inst.ogg") @:noCompletion #if display private #end class __ASSET__assets_songs_senpai_inst_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/songs/senpai/Voices.ogg") @:noCompletion #if display private #end class __ASSET__assets_songs_senpai_voices_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/songs/south/Inst.ogg") @:noCompletion #if display private #end class __ASSET__assets_songs_south_inst_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/songs/south/Voices.ogg") @:noCompletion #if display private #end class __ASSET__assets_songs_south_voices_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/songs/spookeez/Inst.ogg") @:noCompletion #if display private #end class __ASSET__assets_songs_spookeez_inst_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/songs/spookeez/Voices.ogg") @:noCompletion #if display private #end class __ASSET__assets_songs_spookeez_voices_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/songs/stress/Inst.ogg") @:noCompletion #if display private #end class __ASSET__assets_songs_stress_inst_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/songs/stress/Voices.ogg") @:noCompletion #if display private #end class __ASSET__assets_songs_stress_voices_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/songs/Temptation/Inst.ogg") @:noCompletion #if display private #end class __ASSET__assets_songs_temptation_inst_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/songs/Temptation/Voices.ogg") @:noCompletion #if display private #end class __ASSET__assets_songs_temptation_voices_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/songs/test/Inst.ogg") @:noCompletion #if display private #end class __ASSET__assets_songs_test_inst_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/songs/test/Voices.ogg") @:noCompletion #if display private #end class __ASSET__assets_songs_test_voices_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/songs/thorns/Inst.ogg") @:noCompletion #if display private #end class __ASSET__assets_songs_thorns_inst_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/songs/thorns/Voices.ogg") @:noCompletion #if display private #end class __ASSET__assets_songs_thorns_voices_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/songs/tutorial/Inst.ogg") @:noCompletion #if display private #end class __ASSET__assets_songs_tutorial_inst_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/songs/ugh/Inst.ogg") @:noCompletion #if display private #end class __ASSET__assets_songs_ugh_inst_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/songs/ugh/Voices.ogg") @:noCompletion #if display private #end class __ASSET__assets_songs_ugh_voices_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/songs/Vivid-Shade/Inst.ogg") @:noCompletion #if display private #end class __ASSET__assets_songs_vivid_shade_inst_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/songs/Vivid-Shade/Voices.ogg") @:noCompletion #if display private #end class __ASSET__assets_songs_vivid_shade_voices_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/songs/Volcanic/Inst.ogg") @:noCompletion #if display private #end class __ASSET__assets_songs_volcanic_inst_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/songs/Volcanic/Voices.ogg") @:noCompletion #if display private #end class __ASSET__assets_songs_volcanic_voices_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/songs/winter-horrorland/Inst.ogg") @:noCompletion #if display private #end class __ASSET__assets_songs_winter_horrorland_inst_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/songs/winter-horrorland/Voices.ogg") @:noCompletion #if display private #end class __ASSET__assets_songs_winter_horrorland_voices_ogg extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/bad.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_bad_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/bkg.mdp") @:noCompletion #if display private #end class __ASSET__assets_shared_images_bkg_mdp extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/bkg.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_bkg_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/bkg.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_bkg_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/characters/bfAndGF.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_bfandgf_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/characters/bfAndGF.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_bfandgf_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/characters/bfCar.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_bfcar_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/characters/bfCar.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_bfcar_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/characters/bfChristmas.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_bfchristmas_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/characters/bfChristmas.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_bfchristmas_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/characters/bfHoldingGF-DEAD.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_bfholdinggf_dead_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/characters/bfHoldingGF-DEAD.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_bfholdinggf_dead_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/characters/bfPixel.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_bfpixel_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/characters/bfPixel.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_bfpixel_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/characters/bfPixelsDEAD.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_bfpixelsdead_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/characters/bfPixelsDEAD.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_bfpixelsdead_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/characters/bfreanim.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_bfreanim_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/characters/bfreanim.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_bfreanim_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/characters/BOYFRIEND.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_boyfriend_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/characters/BOYFRIEND.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_boyfriend_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/characters/BOYFRIEND_DEAD.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_boyfriend_dead_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/characters/BOYFRIEND_DEAD.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_boyfriend_dead_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/characters/DADDY_DEAREST.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_daddy_dearest_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/characters/DADDY_DEAREST.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_daddy_dearest_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/characters/Frey.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_frey_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/characters/Frey.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_frey_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/characters/gfCar.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_gfcar_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/characters/gfCar.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_gfcar_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/characters/gfChristmas.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_gfchristmas_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/characters/gfChristmas.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_gfchristmas_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/characters/gfPixel.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_gfpixel_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/characters/gfPixel.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_gfpixel_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/characters/gfTankmen.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_gftankmen_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/characters/gfTankmen.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_gftankmen_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/characters/GF_assets.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_gf_assets_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/characters/GF_assets.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_gf_assets_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/characters/invisibru.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_invisibru_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/characters/invisibru.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_invisibru_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/characters/momCar.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_momcar_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/characters/momCar.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_momcar_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/characters/Mom_Assets.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_mom_assets_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/characters/Mom_Assets.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_mom_assets_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/characters/mom_dad_christmas_assets.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_mom_dad_christmas_assets_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/characters/mom_dad_christmas_assets.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_mom_dad_christmas_assets_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/characters/monsterChristmas.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_monsterchristmas_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/characters/monsterChristmas.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_monsterchristmas_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/characters/Monster_Assets.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_monster_assets_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/characters/Monster_Assets.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_monster_assets_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/characters/Olly.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_olly_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/characters/Olly.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_olly_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/characters/picoSpeaker.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_picospeaker_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/characters/picoSpeaker.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_picospeaker_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/characters/Pico_FNF_assetss copy.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_pico_fnf_assetss_copy_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/characters/Pico_FNF_assetss copy.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_pico_fnf_assetss_copy_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/characters/Pico_FNF_assetss.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_pico_fnf_assetss_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/characters/Pico_FNF_assetss.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_pico_fnf_assetss_xml extends haxe.io.Bytes {}
@:keep @:file("assets/shared/images/characters/por favor me mata.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_por_favor_me_mata_xml extends haxe.io.Bytes {}
@:keep @:file("assets/shared/images/characters/readme.txt") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_readme_txt extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/characters/Salem.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_salem_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/characters/Salem.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_salem_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/characters/senpai.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_senpai_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/characters/senpai.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_senpai_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/characters/spirit.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_spirit_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/characters/spirit.txt") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_spirit_txt extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/characters/spooky_kids_assets.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_spooky_kids_assets_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/characters/spooky_kids_assets.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_spooky_kids_assets_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/characters/tankmanCaptain.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_tankmancaptain_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/characters/tankmanCaptain.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_tankmancaptain_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/characters/template1.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_template1_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/characters/template1.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_template1_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/characters/template10.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_template10_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/characters/template10.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_template10_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/characters/template11.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_template11_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/characters/template11.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_template11_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/characters/template12.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_template12_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/characters/template12.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_template12_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/characters/template2.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_template2_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/characters/template2.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_template2_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/characters/template3.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_template3_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/characters/template3.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_template3_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/characters/template4.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_template4_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/characters/template4.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_template4_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/characters/template5.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_template5_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/characters/template5.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_template5_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/characters/template6.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_template6_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/characters/template6.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_template6_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/characters/template7.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_template7_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/characters/template7.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_template7_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/characters/template8.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_template8_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/characters/template8.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_template8_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/characters/Victor.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_victor_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/characters/Victor.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_victor_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/characters/wraithAttack.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_wraithattack_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/characters/wraithAttack.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_characters_wraithattack_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/combo.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_combo_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/CoolNoteTemplate.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_coolnotetemplate_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/DangerNote.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_dangernote_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/DangerNote.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_dangernote_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/dialogue/BF_Dialogue.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_dialogue_bf_dialogue_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/dialogue/BF_Dialogue.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_dialogue_bf_dialogue_xml extends haxe.io.Bytes {}
@:keep @:file("assets/shared/images/dialogue/bob.json") @:noCompletion #if display private #end class __ASSET__assets_shared_images_dialogue_bob_json extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/dialogue/bob.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_dialogue_bob_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/dialogue/bob.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_dialogue_bob_xml extends haxe.io.Bytes {}
@:keep @:file("assets/shared/images/dialogue/bod.json") @:noCompletion #if display private #end class __ASSET__assets_shared_images_dialogue_bod_json extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/dialogue/bod.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_dialogue_bod_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/dialogue/bod.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_dialogue_bod_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/dialogue/GF_Dialogue.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_dialogue_gf_dialogue_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/dialogue/GF_Dialogue.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_dialogue_gf_dialogue_xml extends haxe.io.Bytes {}
@:keep @:file("assets/shared/images/dialogue/readme.txt") @:noCompletion #if display private #end class __ASSET__assets_shared_images_dialogue_readme_txt extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/dialogue/template1.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_dialogue_template1_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/dialogue/template1.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_dialogue_template1_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/dialogue/template2.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_dialogue_template2_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/dialogue/template2.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_dialogue_template2_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/dialogue/template3.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_dialogue_template3_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/dialogue/template3.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_dialogue_template3_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/dialogue/template4.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_dialogue_template4_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/dialogue/template4.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_dialogue_template4_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/eventArrow.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_eventarrow_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/Fred.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_fred_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/Fred.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_fred_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/Frey.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_frey_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/Frey.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_frey_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/funnus.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_funnus_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/funnus.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_funnus_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/Furrygang.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_furrygang_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/FurryNote.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_furrynote_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/FurryNote.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_furrynote_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/GhostNote.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_ghostnote_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/GhostNote.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_ghostnote_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/go.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_go_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/good.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_good_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/grafix.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_grafix_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/healthBar.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_healthbar_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/HeartClinic.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_heartclinic_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/HeartClinic.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_heartclinic_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/hitbox/hitbox.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_hitbox_hitbox_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/hitbox/hitbox.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_hitbox_hitbox_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/hitbox/hitbox_hint.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_hitbox_hitbox_hint_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/hitbox/hitbox_hint_old.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_hitbox_hitbox_hint_old_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/HURTnoteSplashes.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_hurtnotesplashes_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/HURTnoteSplashes.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_hurtnotesplashes_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/HURTNOTE_assets.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_hurtnote_assets_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/HURTNOTE_assets.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_hurtnote_assets_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/icons/icon-daade.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_icons_icon_daade_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/icons/icon-furries.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_icons_icon_furries_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/icons/icon-salem.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_icons_icon_salem_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/icons/readme.txt") @:noCompletion #if display private #end class __ASSET__assets_shared_images_icons_readme_txt extends haxe.io.Bytes {}
@:keep @:file("assets/shared/images/images-go-here.txt") @:noCompletion #if display private #end class __ASSET__assets_shared_images_images_go_here_txt extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/lessoldfont.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_lessoldfont_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/market.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_market_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/market.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_market_xml extends haxe.io.Bytes {}
@:keep @:file("assets/shared/images/menubackgrounds/readme.txt") @:noCompletion #if display private #end class __ASSET__assets_shared_images_menubackgrounds_readme_txt extends haxe.io.Bytes {}
@:keep @:file("assets/shared/images/menucharacters/menu-frey.json") @:noCompletion #if display private #end class __ASSET__assets_shared_images_menucharacters_menu_frey_json extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/menucharacters/Menu-Frey.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_menucharacters_menu_frey_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/menucharacters/Menu-Frey.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_menucharacters_menu_frey_xml extends haxe.io.Bytes {}
@:keep @:file("assets/shared/images/menucharacters/menu-olly.json") @:noCompletion #if display private #end class __ASSET__assets_shared_images_menucharacters_menu_olly_json extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/menucharacters/Menu-Olly.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_menucharacters_menu_olly_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/menucharacters/Menu-Olly.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_menucharacters_menu_olly_xml extends haxe.io.Bytes {}
@:keep @:file("assets/shared/images/menucharacters/readme.txt") @:noCompletion #if display private #end class __ASSET__assets_shared_images_menucharacters_readme_txt extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/menudifficulties/classic.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_menudifficulties_classic_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/menudifficulties/expert.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_menudifficulties_expert_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/menudifficulties/Master.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_menudifficulties_master_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/newFont.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_newfont_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/newFont.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_newfont_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/noanimbkg.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_noanimbkg_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/noteSplashes.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_notesplashes_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/noteSplashes.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_notesplashes_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/NOTE_assets.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_note_assets_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/NOTE_assets.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_note_assets_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/oldBKG.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_oldbkg_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/oldfont.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_oldfont_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/oldfred.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_oldfred_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/oldfred.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_oldfred_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/olly.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_olly_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/olly.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_olly_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/pauseAlt/bfLol.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_pausealt_bflol_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/pauseAlt/bfLol.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_pausealt_bflol_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/pauseAlt/pauseBG.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_pausealt_pausebg_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/pauseAlt/pauseUI.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_pausealt_pauseui_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/pauseAlt/pauseUI.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_pausealt_pauseui_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/pixelUI/bad-pixel.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_bad_pixel_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/pixelUI/combo-pixel.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_combo_pixel_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/pixelUI/date-pixel.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_date_pixel_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/pixelUI/good-pixel.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_good_pixel_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/pixelUI/HURTNOTE_assets.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_hurtnote_assets_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/pixelUI/HURTNOTE_assetsENDS.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_hurtnote_assetsends_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/pixelUI/NOTE_assets.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_note_assets_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/pixelUI/NOTE_assetsENDS.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_note_assetsends_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/pixelUI/num0-pixel.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_num0_pixel_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/pixelUI/num1-pixel.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_num1_pixel_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/pixelUI/num2-pixel.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_num2_pixel_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/pixelUI/num3-pixel.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_num3_pixel_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/pixelUI/num4-pixel.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_num4_pixel_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/pixelUI/num5-pixel.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_num5_pixel_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/pixelUI/num6-pixel.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_num6_pixel_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/pixelUI/num7-pixel.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_num7_pixel_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/pixelUI/num8-pixel.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_num8_pixel_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/pixelUI/num9-pixel.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_num9_pixel_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/pixelUI/ready-pixel.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_ready_pixel_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/pixelUI/set-pixel.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_set_pixel_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/pixelUI/shit-pixel.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_shit_pixel_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/pixelUI/sick-pixel.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_pixelui_sick_pixel_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/ready.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_ready_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/set.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_set_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/shit.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_shit_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/sick.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_sick_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/smoke.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_smoke_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/speech_bubble.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_speech_bubble_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/speech_bubble.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_speech_bubble_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/spotlight.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_spotlight_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/stageback.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_stageback_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/stagecurtains.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_stagecurtains_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/stagefront.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_stagefront_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/stage_light.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_stage_light_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/StarNote.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_starnote_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/StarNote.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_starnote_xml extends haxe.io.Bytes {}
@:keep @:file("assets/shared/images/storymenu/readme.txt") @:noCompletion #if display private #end class __ASSET__assets_shared_images_storymenu_readme_txt extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/timeBar.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_timebar_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/Victor.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_victor_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/Victor.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_victor_xml extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/weeb/weebSchool.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_weeb_weebschool_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/weeb/weebSky.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_weeb_weebsky_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/weeb/weebStreet.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_weeb_weebstreet_png extends lime.graphics.Image {}
@:keep @:image("assets/shared/images/weeb/weebTrees.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_weeb_weebtrees_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/weeb/weebTrees.txt") @:noCompletion #if display private #end class __ASSET__assets_shared_images_weeb_weebtrees_txt extends haxe.io.Bytes {}
@:keep @:image("assets/shared/images/wraithAttack.png") @:noCompletion #if display private #end class __ASSET__assets_shared_images_wraithattack_png extends lime.graphics.Image {}
@:keep @:file("assets/shared/images/wraithAttack.xml") @:noCompletion #if display private #end class __ASSET__assets_shared_images_wraithattack_xml extends haxe.io.Bytes {}
@:keep @:file("assets/shared/music/breakfast.ogg") @:noCompletion #if display private #end class __ASSET__assets_shared_music_breakfast_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/shared/music/gameOver.ogg") @:noCompletion #if display private #end class __ASSET__assets_shared_music_gameover_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/shared/music/gameOverEnd.ogg") @:noCompletion #if display private #end class __ASSET__assets_shared_music_gameoverend_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/shared/music/tea-time.ogg") @:noCompletion #if display private #end class __ASSET__assets_shared_music_tea_time_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/ANGRY.ogg") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_angry_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/ANGRY_TEXT_BOX.ogg") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_angry_text_box_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/attack.ogg") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_attack_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/badnoise1.ogg") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_badnoise1_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/badnoise2.ogg") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_badnoise2_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/badnoise3.ogg") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_badnoise3_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/ChartingTick.ogg") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_chartingtick_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/clickText.ogg") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_clicktext_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/dialogue.ogg") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_dialogue_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/dialogueClose.ogg") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_dialogueclose_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/fnf_loss_sfx.ogg") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_fnf_loss_sfx_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/freytalk.ogg") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_freytalk_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/GF_1.ogg") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_gf_1_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/GF_2.ogg") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_gf_2_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/GF_3.ogg") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_gf_3_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/GF_4.ogg") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_gf_4_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/hitsound.ogg") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_hitsound_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/Inst.ogg") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_inst_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/intro1.ogg") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_intro1_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/intro2.ogg") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_intro2_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/intro3.ogg") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_intro3_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/introGo.ogg") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_introgo_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/Metronome_Tick.ogg") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_metronome_tick_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/missnote1.ogg") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_missnote1_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/missnote2.ogg") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_missnote2_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/missnote3.ogg") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_missnote3_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/ollytalk.ogg") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_ollytalk_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/osu.ogg") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_osu_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/plumtalk.ogg") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_plumtalk_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/readme.txt") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_readme_txt extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/rosetalk.ogg") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_rosetalk_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/shoot.ogg") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_shoot_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/sounds-go-here.txt") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_sounds_go_here_txt extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/soundTest.ogg") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_soundtest_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/shared/sounds/warn.ogg") @:noCompletion #if display private #end class __ASSET__assets_shared_sounds_warn_ogg extends haxe.io.Bytes {}
@:keep @:image("assets/week2/images/halloween_bg.png") @:noCompletion #if display private #end class __ASSET__assets_week2_images_halloween_bg_png extends lime.graphics.Image {}
@:keep @:file("assets/week2/images/halloween_bg.xml") @:noCompletion #if display private #end class __ASSET__assets_week2_images_halloween_bg_xml extends haxe.io.Bytes {}
@:keep @:image("assets/week2/images/halloween_bg_low.png") @:noCompletion #if display private #end class __ASSET__assets_week2_images_halloween_bg_low_png extends lime.graphics.Image {}
@:keep @:file("assets/week2/sounds/thunder_1.ogg") @:noCompletion #if display private #end class __ASSET__assets_week2_sounds_thunder_1_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/week2/sounds/thunder_2.ogg") @:noCompletion #if display private #end class __ASSET__assets_week2_sounds_thunder_2_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/week2/week2_stuff_here.txt") @:noCompletion #if display private #end class __ASSET__assets_week2_week2_stuff_here_txt extends haxe.io.Bytes {}
@:keep @:image("assets/week3/images/philly/behindTrain.png") @:noCompletion #if display private #end class __ASSET__assets_week3_images_philly_behindtrain_png extends lime.graphics.Image {}
@:keep @:image("assets/week3/images/philly/city.png") @:noCompletion #if display private #end class __ASSET__assets_week3_images_philly_city_png extends lime.graphics.Image {}
@:keep @:image("assets/week3/images/philly/gradient.png") @:noCompletion #if display private #end class __ASSET__assets_week3_images_philly_gradient_png extends lime.graphics.Image {}
@:keep @:image("assets/week3/images/philly/particle.png") @:noCompletion #if display private #end class __ASSET__assets_week3_images_philly_particle_png extends lime.graphics.Image {}
@:keep @:image("assets/week3/images/philly/sky.png") @:noCompletion #if display private #end class __ASSET__assets_week3_images_philly_sky_png extends lime.graphics.Image {}
@:keep @:image("assets/week3/images/philly/street.png") @:noCompletion #if display private #end class __ASSET__assets_week3_images_philly_street_png extends lime.graphics.Image {}
@:keep @:image("assets/week3/images/philly/train.png") @:noCompletion #if display private #end class __ASSET__assets_week3_images_philly_train_png extends lime.graphics.Image {}
@:keep @:image("assets/week3/images/philly/win0.png") @:noCompletion #if display private #end class __ASSET__assets_week3_images_philly_win0_png extends lime.graphics.Image {}
@:keep @:image("assets/week3/images/philly/win1.png") @:noCompletion #if display private #end class __ASSET__assets_week3_images_philly_win1_png extends lime.graphics.Image {}
@:keep @:image("assets/week3/images/philly/win2.png") @:noCompletion #if display private #end class __ASSET__assets_week3_images_philly_win2_png extends lime.graphics.Image {}
@:keep @:image("assets/week3/images/philly/win3.png") @:noCompletion #if display private #end class __ASSET__assets_week3_images_philly_win3_png extends lime.graphics.Image {}
@:keep @:image("assets/week3/images/philly/win4.png") @:noCompletion #if display private #end class __ASSET__assets_week3_images_philly_win4_png extends lime.graphics.Image {}
@:keep @:image("assets/week3/images/philly/window.png") @:noCompletion #if display private #end class __ASSET__assets_week3_images_philly_window_png extends lime.graphics.Image {}
@:keep @:file("assets/week3/sounds/train_passes.ogg") @:noCompletion #if display private #end class __ASSET__assets_week3_sounds_train_passes_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/week3/week3_stuff_here.txt") @:noCompletion #if display private #end class __ASSET__assets_week3_week3_stuff_here_txt extends haxe.io.Bytes {}
@:keep @:image("assets/week4/images/gore/coldHeartKiller.png") @:noCompletion #if display private #end class __ASSET__assets_week4_images_gore_coldheartkiller_png extends lime.graphics.Image {}
@:keep @:image("assets/week4/images/gore/metalPole.png") @:noCompletion #if display private #end class __ASSET__assets_week4_images_gore_metalpole_png extends lime.graphics.Image {}
@:keep @:image("assets/week4/images/gore/noooooo.png") @:noCompletion #if display private #end class __ASSET__assets_week4_images_gore_noooooo_png extends lime.graphics.Image {}
@:keep @:file("assets/week4/images/gore/noooooo.xml") @:noCompletion #if display private #end class __ASSET__assets_week4_images_gore_noooooo_xml extends haxe.io.Bytes {}
@:keep @:image("assets/week4/images/gore/stupidBlood.png") @:noCompletion #if display private #end class __ASSET__assets_week4_images_gore_stupidblood_png extends lime.graphics.Image {}
@:keep @:file("assets/week4/images/gore/stupidBlood.xml") @:noCompletion #if display private #end class __ASSET__assets_week4_images_gore_stupidblood_xml extends haxe.io.Bytes {}
@:keep @:image("assets/week4/images/limo/bgLimo.png") @:noCompletion #if display private #end class __ASSET__assets_week4_images_limo_bglimo_png extends lime.graphics.Image {}
@:keep @:file("assets/week4/images/limo/bgLimo.xml") @:noCompletion #if display private #end class __ASSET__assets_week4_images_limo_bglimo_xml extends haxe.io.Bytes {}
@:keep @:image("assets/week4/images/limo/dumb.png") @:noCompletion #if display private #end class __ASSET__assets_week4_images_limo_dumb_png extends lime.graphics.Image {}
@:keep @:image("assets/week4/images/limo/fastCarLol.png") @:noCompletion #if display private #end class __ASSET__assets_week4_images_limo_fastcarlol_png extends lime.graphics.Image {}
@:keep @:image("assets/week4/images/limo/limoDancer.png") @:noCompletion #if display private #end class __ASSET__assets_week4_images_limo_limodancer_png extends lime.graphics.Image {}
@:keep @:file("assets/week4/images/limo/limoDancer.xml") @:noCompletion #if display private #end class __ASSET__assets_week4_images_limo_limodancer_xml extends haxe.io.Bytes {}
@:keep @:image("assets/week4/images/limo/limoDrive.png") @:noCompletion #if display private #end class __ASSET__assets_week4_images_limo_limodrive_png extends lime.graphics.Image {}
@:keep @:file("assets/week4/images/limo/limoDrive.xml") @:noCompletion #if display private #end class __ASSET__assets_week4_images_limo_limodrive_xml extends haxe.io.Bytes {}
@:keep @:image("assets/week4/images/limo/limoSunset.png") @:noCompletion #if display private #end class __ASSET__assets_week4_images_limo_limosunset_png extends lime.graphics.Image {}
@:keep @:file("assets/week4/sounds/carPass0.ogg") @:noCompletion #if display private #end class __ASSET__assets_week4_sounds_carpass0_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/week4/sounds/carPass1.ogg") @:noCompletion #if display private #end class __ASSET__assets_week4_sounds_carpass1_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/week4/sounds/dancerdeath.ogg") @:noCompletion #if display private #end class __ASSET__assets_week4_sounds_dancerdeath_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/week4/week4_stuff_here.txt") @:noCompletion #if display private #end class __ASSET__assets_week4_week4_stuff_here_txt extends haxe.io.Bytes {}
@:keep @:image("assets/week5/images/christmas/bgEscalator.png") @:noCompletion #if display private #end class __ASSET__assets_week5_images_christmas_bgescalator_png extends lime.graphics.Image {}
@:keep @:image("assets/week5/images/christmas/bgWalls.png") @:noCompletion #if display private #end class __ASSET__assets_week5_images_christmas_bgwalls_png extends lime.graphics.Image {}
@:keep @:image("assets/week5/images/christmas/bottomBop.png") @:noCompletion #if display private #end class __ASSET__assets_week5_images_christmas_bottombop_png extends lime.graphics.Image {}
@:keep @:file("assets/week5/images/christmas/bottomBop.xml") @:noCompletion #if display private #end class __ASSET__assets_week5_images_christmas_bottombop_xml extends haxe.io.Bytes {}
@:keep @:image("assets/week5/images/christmas/christmasTree.png") @:noCompletion #if display private #end class __ASSET__assets_week5_images_christmas_christmastree_png extends lime.graphics.Image {}
@:keep @:image("assets/week5/images/christmas/evilBG.png") @:noCompletion #if display private #end class __ASSET__assets_week5_images_christmas_evilbg_png extends lime.graphics.Image {}
@:keep @:image("assets/week5/images/christmas/evilSnow.png") @:noCompletion #if display private #end class __ASSET__assets_week5_images_christmas_evilsnow_png extends lime.graphics.Image {}
@:keep @:image("assets/week5/images/christmas/evilTree.png") @:noCompletion #if display private #end class __ASSET__assets_week5_images_christmas_eviltree_png extends lime.graphics.Image {}
@:keep @:image("assets/week5/images/christmas/fgSnow.png") @:noCompletion #if display private #end class __ASSET__assets_week5_images_christmas_fgsnow_png extends lime.graphics.Image {}
@:keep @:image("assets/week5/images/christmas/santa.png") @:noCompletion #if display private #end class __ASSET__assets_week5_images_christmas_santa_png extends lime.graphics.Image {}
@:keep @:file("assets/week5/images/christmas/santa.xml") @:noCompletion #if display private #end class __ASSET__assets_week5_images_christmas_santa_xml extends haxe.io.Bytes {}
@:keep @:image("assets/week5/images/christmas/upperBop.png") @:noCompletion #if display private #end class __ASSET__assets_week5_images_christmas_upperbop_png extends lime.graphics.Image {}
@:keep @:file("assets/week5/images/christmas/upperBop.xml") @:noCompletion #if display private #end class __ASSET__assets_week5_images_christmas_upperbop_xml extends haxe.io.Bytes {}
@:keep @:file("assets/week5/sounds/Lights_Shut_off.ogg") @:noCompletion #if display private #end class __ASSET__assets_week5_sounds_lights_shut_off_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/week5/sounds/Lights_Turn_On.ogg") @:noCompletion #if display private #end class __ASSET__assets_week5_sounds_lights_turn_on_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/week5/week5_stuff_here.txt") @:noCompletion #if display private #end class __ASSET__assets_week5_week5_stuff_here_txt extends haxe.io.Bytes {}
@:keep @:image("assets/week6/images/weeb/animatedEvilSchool.png") @:noCompletion #if display private #end class __ASSET__assets_week6_images_weeb_animatedevilschool_png extends lime.graphics.Image {}
@:keep @:file("assets/week6/images/weeb/animatedEvilSchool.xml") @:noCompletion #if display private #end class __ASSET__assets_week6_images_weeb_animatedevilschool_xml extends haxe.io.Bytes {}
@:keep @:image("assets/week6/images/weeb/animatedEvilSchool_low.png") @:noCompletion #if display private #end class __ASSET__assets_week6_images_weeb_animatedevilschool_low_png extends lime.graphics.Image {}
@:keep @:image("assets/week6/images/weeb/bfPortrait.png") @:noCompletion #if display private #end class __ASSET__assets_week6_images_weeb_bfportrait_png extends lime.graphics.Image {}
@:keep @:file("assets/week6/images/weeb/bfPortrait.xml") @:noCompletion #if display private #end class __ASSET__assets_week6_images_weeb_bfportrait_xml extends haxe.io.Bytes {}
@:keep @:image("assets/week6/images/weeb/bgFreaks.png") @:noCompletion #if display private #end class __ASSET__assets_week6_images_weeb_bgfreaks_png extends lime.graphics.Image {}
@:keep @:file("assets/week6/images/weeb/bgFreaks.xml") @:noCompletion #if display private #end class __ASSET__assets_week6_images_weeb_bgfreaks_xml extends haxe.io.Bytes {}
@:keep @:image("assets/week6/images/weeb/bgGhouls.png") @:noCompletion #if display private #end class __ASSET__assets_week6_images_weeb_bgghouls_png extends lime.graphics.Image {}
@:keep @:file("assets/week6/images/weeb/bgGhouls.xml") @:noCompletion #if display private #end class __ASSET__assets_week6_images_weeb_bgghouls_xml extends haxe.io.Bytes {}
@:keep @:image("assets/week6/images/weeb/evilSchoolBG.png") @:noCompletion #if display private #end class __ASSET__assets_week6_images_weeb_evilschoolbg_png extends lime.graphics.Image {}
@:keep @:image("assets/week6/images/weeb/evilSchoolFG.png") @:noCompletion #if display private #end class __ASSET__assets_week6_images_weeb_evilschoolfg_png extends lime.graphics.Image {}
@:keep @:image("assets/week6/images/weeb/petals.png") @:noCompletion #if display private #end class __ASSET__assets_week6_images_weeb_petals_png extends lime.graphics.Image {}
@:keep @:file("assets/week6/images/weeb/petals.xml") @:noCompletion #if display private #end class __ASSET__assets_week6_images_weeb_petals_xml extends haxe.io.Bytes {}
@:keep @:image("assets/week6/images/weeb/pixelUI/dialogueBox-evil.png") @:noCompletion #if display private #end class __ASSET__assets_week6_images_weeb_pixelui_dialoguebox_evil_png extends lime.graphics.Image {}
@:keep @:file("assets/week6/images/weeb/pixelUI/dialogueBox-evil.xml") @:noCompletion #if display private #end class __ASSET__assets_week6_images_weeb_pixelui_dialoguebox_evil_xml extends haxe.io.Bytes {}
@:keep @:image("assets/week6/images/weeb/pixelUI/dialogueBox-pixel.png") @:noCompletion #if display private #end class __ASSET__assets_week6_images_weeb_pixelui_dialoguebox_pixel_png extends lime.graphics.Image {}
@:keep @:file("assets/week6/images/weeb/pixelUI/dialogueBox-pixel.xml") @:noCompletion #if display private #end class __ASSET__assets_week6_images_weeb_pixelui_dialoguebox_pixel_xml extends haxe.io.Bytes {}
@:keep @:image("assets/week6/images/weeb/pixelUI/dialogueBox-senpaiMad.png") @:noCompletion #if display private #end class __ASSET__assets_week6_images_weeb_pixelui_dialoguebox_senpaimad_png extends lime.graphics.Image {}
@:keep @:file("assets/week6/images/weeb/pixelUI/dialogueBox-senpaiMad.xml") @:noCompletion #if display private #end class __ASSET__assets_week6_images_weeb_pixelui_dialoguebox_senpaimad_xml extends haxe.io.Bytes {}
@:keep @:image("assets/week6/images/weeb/pixelUI/hand_textbox.png") @:noCompletion #if display private #end class __ASSET__assets_week6_images_weeb_pixelui_hand_textbox_png extends lime.graphics.Image {}
@:keep @:image("assets/week6/images/weeb/senpaiCrazy.png") @:noCompletion #if display private #end class __ASSET__assets_week6_images_weeb_senpaicrazy_png extends lime.graphics.Image {}
@:keep @:file("assets/week6/images/weeb/senpaiCrazy.xml") @:noCompletion #if display private #end class __ASSET__assets_week6_images_weeb_senpaicrazy_xml extends haxe.io.Bytes {}
@:keep @:image("assets/week6/images/weeb/senpaiPortrait.png") @:noCompletion #if display private #end class __ASSET__assets_week6_images_weeb_senpaiportrait_png extends lime.graphics.Image {}
@:keep @:file("assets/week6/images/weeb/senpaiPortrait.xml") @:noCompletion #if display private #end class __ASSET__assets_week6_images_weeb_senpaiportrait_xml extends haxe.io.Bytes {}
@:keep @:image("assets/week6/images/weeb/spiritFaceForward.png") @:noCompletion #if display private #end class __ASSET__assets_week6_images_weeb_spiritfaceforward_png extends lime.graphics.Image {}
@:keep @:image("assets/week6/images/weeb/weebTreesBack.png") @:noCompletion #if display private #end class __ASSET__assets_week6_images_weeb_weebtreesback_png extends lime.graphics.Image {}
@:keep @:file("assets/week6/music/gameOver-pixel.ogg") @:noCompletion #if display private #end class __ASSET__assets_week6_music_gameover_pixel_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/week6/music/gameOverEnd-pixel.ogg") @:noCompletion #if display private #end class __ASSET__assets_week6_music_gameoverend_pixel_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/week6/music/Lunchbox.ogg") @:noCompletion #if display private #end class __ASSET__assets_week6_music_lunchbox_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/week6/music/LunchboxScary.ogg") @:noCompletion #if display private #end class __ASSET__assets_week6_music_lunchboxscary_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/week6/sounds/fnf_loss_sfx-pixel.ogg") @:noCompletion #if display private #end class __ASSET__assets_week6_sounds_fnf_loss_sfx_pixel_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/week6/sounds/pixelText.ogg") @:noCompletion #if display private #end class __ASSET__assets_week6_sounds_pixeltext_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/week6/sounds/Senpai_Dies.ogg") @:noCompletion #if display private #end class __ASSET__assets_week6_sounds_senpai_dies_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/week6/week6_stuff_here.txt") @:noCompletion #if display private #end class __ASSET__assets_week6_week6_stuff_here_txt extends haxe.io.Bytes {}
@:keep @:image("assets/week7/images/cutscenes/guns.png") @:noCompletion #if display private #end class __ASSET__assets_week7_images_cutscenes_guns_png extends lime.graphics.Image {}
@:keep @:file("assets/week7/images/cutscenes/guns.xml") @:noCompletion #if display private #end class __ASSET__assets_week7_images_cutscenes_guns_xml extends haxe.io.Bytes {}
@:keep @:image("assets/week7/images/cutscenes/stress.png") @:noCompletion #if display private #end class __ASSET__assets_week7_images_cutscenes_stress_png extends lime.graphics.Image {}
@:keep @:file("assets/week7/images/cutscenes/stress.xml") @:noCompletion #if display private #end class __ASSET__assets_week7_images_cutscenes_stress_xml extends haxe.io.Bytes {}
@:keep @:image("assets/week7/images/cutscenes/stress2.png") @:noCompletion #if display private #end class __ASSET__assets_week7_images_cutscenes_stress2_png extends lime.graphics.Image {}
@:keep @:file("assets/week7/images/cutscenes/stress2.xml") @:noCompletion #if display private #end class __ASSET__assets_week7_images_cutscenes_stress2_xml extends haxe.io.Bytes {}
@:keep @:image("assets/week7/images/cutscenes/stressGF.png") @:noCompletion #if display private #end class __ASSET__assets_week7_images_cutscenes_stressgf_png extends lime.graphics.Image {}
@:keep @:file("assets/week7/images/cutscenes/stressGF.xml") @:noCompletion #if display private #end class __ASSET__assets_week7_images_cutscenes_stressgf_xml extends haxe.io.Bytes {}
@:keep @:file("assets/week7/images/cutscenes/stressPico/Animation.json") @:noCompletion #if display private #end class __ASSET__assets_week7_images_cutscenes_stresspico_animation_json extends haxe.io.Bytes {}
@:keep @:file("assets/week7/images/cutscenes/stressPico/spritemap.json") @:noCompletion #if display private #end class __ASSET__assets_week7_images_cutscenes_stresspico_spritemap_json extends haxe.io.Bytes {}
@:keep @:image("assets/week7/images/cutscenes/stressPico/spritemap.png") @:noCompletion #if display private #end class __ASSET__assets_week7_images_cutscenes_stresspico_spritemap_png extends lime.graphics.Image {}
@:keep @:image("assets/week7/images/cutscenes/ugh.png") @:noCompletion #if display private #end class __ASSET__assets_week7_images_cutscenes_ugh_png extends lime.graphics.Image {}
@:keep @:file("assets/week7/images/cutscenes/ugh.xml") @:noCompletion #if display private #end class __ASSET__assets_week7_images_cutscenes_ugh_xml extends haxe.io.Bytes {}
@:keep @:image("assets/week7/images/smokeLeft.png") @:noCompletion #if display private #end class __ASSET__assets_week7_images_smokeleft_png extends lime.graphics.Image {}
@:keep @:file("assets/week7/images/smokeLeft.xml") @:noCompletion #if display private #end class __ASSET__assets_week7_images_smokeleft_xml extends haxe.io.Bytes {}
@:keep @:image("assets/week7/images/smokeRight.png") @:noCompletion #if display private #end class __ASSET__assets_week7_images_smokeright_png extends lime.graphics.Image {}
@:keep @:file("assets/week7/images/smokeRight.xml") @:noCompletion #if display private #end class __ASSET__assets_week7_images_smokeright_xml extends haxe.io.Bytes {}
@:keep @:image("assets/week7/images/tank0.png") @:noCompletion #if display private #end class __ASSET__assets_week7_images_tank0_png extends lime.graphics.Image {}
@:keep @:file("assets/week7/images/tank0.xml") @:noCompletion #if display private #end class __ASSET__assets_week7_images_tank0_xml extends haxe.io.Bytes {}
@:keep @:image("assets/week7/images/tank1.png") @:noCompletion #if display private #end class __ASSET__assets_week7_images_tank1_png extends lime.graphics.Image {}
@:keep @:file("assets/week7/images/tank1.xml") @:noCompletion #if display private #end class __ASSET__assets_week7_images_tank1_xml extends haxe.io.Bytes {}
@:keep @:image("assets/week7/images/tank2.png") @:noCompletion #if display private #end class __ASSET__assets_week7_images_tank2_png extends lime.graphics.Image {}
@:keep @:file("assets/week7/images/tank2.xml") @:noCompletion #if display private #end class __ASSET__assets_week7_images_tank2_xml extends haxe.io.Bytes {}
@:keep @:image("assets/week7/images/tank3.png") @:noCompletion #if display private #end class __ASSET__assets_week7_images_tank3_png extends lime.graphics.Image {}
@:keep @:file("assets/week7/images/tank3.xml") @:noCompletion #if display private #end class __ASSET__assets_week7_images_tank3_xml extends haxe.io.Bytes {}
@:keep @:image("assets/week7/images/tank4.png") @:noCompletion #if display private #end class __ASSET__assets_week7_images_tank4_png extends lime.graphics.Image {}
@:keep @:file("assets/week7/images/tank4.xml") @:noCompletion #if display private #end class __ASSET__assets_week7_images_tank4_xml extends haxe.io.Bytes {}
@:keep @:image("assets/week7/images/tank5.png") @:noCompletion #if display private #end class __ASSET__assets_week7_images_tank5_png extends lime.graphics.Image {}
@:keep @:file("assets/week7/images/tank5.xml") @:noCompletion #if display private #end class __ASSET__assets_week7_images_tank5_xml extends haxe.io.Bytes {}
@:keep @:image("assets/week7/images/tankBuildings.png") @:noCompletion #if display private #end class __ASSET__assets_week7_images_tankbuildings_png extends lime.graphics.Image {}
@:keep @:image("assets/week7/images/tankClouds.png") @:noCompletion #if display private #end class __ASSET__assets_week7_images_tankclouds_png extends lime.graphics.Image {}
@:keep @:image("assets/week7/images/tankGround.png") @:noCompletion #if display private #end class __ASSET__assets_week7_images_tankground_png extends lime.graphics.Image {}
@:keep @:image("assets/week7/images/tankmanKilled1.png") @:noCompletion #if display private #end class __ASSET__assets_week7_images_tankmankilled1_png extends lime.graphics.Image {}
@:keep @:file("assets/week7/images/tankmanKilled1.xml") @:noCompletion #if display private #end class __ASSET__assets_week7_images_tankmankilled1_xml extends haxe.io.Bytes {}
@:keep @:image("assets/week7/images/tankMountains.png") @:noCompletion #if display private #end class __ASSET__assets_week7_images_tankmountains_png extends lime.graphics.Image {}
@:keep @:image("assets/week7/images/tankRolling.png") @:noCompletion #if display private #end class __ASSET__assets_week7_images_tankrolling_png extends lime.graphics.Image {}
@:keep @:file("assets/week7/images/tankRolling.xml") @:noCompletion #if display private #end class __ASSET__assets_week7_images_tankrolling_xml extends haxe.io.Bytes {}
@:keep @:image("assets/week7/images/tankRuins.png") @:noCompletion #if display private #end class __ASSET__assets_week7_images_tankruins_png extends lime.graphics.Image {}
@:keep @:image("assets/week7/images/tankSky.png") @:noCompletion #if display private #end class __ASSET__assets_week7_images_tanksky_png extends lime.graphics.Image {}
@:keep @:image("assets/week7/images/tankWatchtower.png") @:noCompletion #if display private #end class __ASSET__assets_week7_images_tankwatchtower_png extends lime.graphics.Image {}
@:keep @:file("assets/week7/images/tankWatchtower.xml") @:noCompletion #if display private #end class __ASSET__assets_week7_images_tankwatchtower_xml extends haxe.io.Bytes {}
@:keep @:file("assets/week7/music/DISTORTO.ogg") @:noCompletion #if display private #end class __ASSET__assets_week7_music_distorto_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/week7/sounds/bfBeep.ogg") @:noCompletion #if display private #end class __ASSET__assets_week7_sounds_bfbeep_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/week7/sounds/jeffGameover/jeffGameover-1.ogg") @:noCompletion #if display private #end class __ASSET__assets_week7_sounds_jeffgameover_jeffgameover_1_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/week7/sounds/jeffGameover/jeffGameover-10.ogg") @:noCompletion #if display private #end class __ASSET__assets_week7_sounds_jeffgameover_jeffgameover_10_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/week7/sounds/jeffGameover/jeffGameover-11.ogg") @:noCompletion #if display private #end class __ASSET__assets_week7_sounds_jeffgameover_jeffgameover_11_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/week7/sounds/jeffGameover/jeffGameover-12.ogg") @:noCompletion #if display private #end class __ASSET__assets_week7_sounds_jeffgameover_jeffgameover_12_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/week7/sounds/jeffGameover/jeffGameover-13.ogg") @:noCompletion #if display private #end class __ASSET__assets_week7_sounds_jeffgameover_jeffgameover_13_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/week7/sounds/jeffGameover/jeffGameover-14.ogg") @:noCompletion #if display private #end class __ASSET__assets_week7_sounds_jeffgameover_jeffgameover_14_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/week7/sounds/jeffGameover/jeffGameover-15.ogg") @:noCompletion #if display private #end class __ASSET__assets_week7_sounds_jeffgameover_jeffgameover_15_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/week7/sounds/jeffGameover/jeffGameover-16.ogg") @:noCompletion #if display private #end class __ASSET__assets_week7_sounds_jeffgameover_jeffgameover_16_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/week7/sounds/jeffGameover/jeffGameover-17.ogg") @:noCompletion #if display private #end class __ASSET__assets_week7_sounds_jeffgameover_jeffgameover_17_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/week7/sounds/jeffGameover/jeffGameover-18.ogg") @:noCompletion #if display private #end class __ASSET__assets_week7_sounds_jeffgameover_jeffgameover_18_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/week7/sounds/jeffGameover/jeffGameover-19.ogg") @:noCompletion #if display private #end class __ASSET__assets_week7_sounds_jeffgameover_jeffgameover_19_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/week7/sounds/jeffGameover/jeffGameover-2.ogg") @:noCompletion #if display private #end class __ASSET__assets_week7_sounds_jeffgameover_jeffgameover_2_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/week7/sounds/jeffGameover/jeffGameover-20.ogg") @:noCompletion #if display private #end class __ASSET__assets_week7_sounds_jeffgameover_jeffgameover_20_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/week7/sounds/jeffGameover/jeffGameover-21.ogg") @:noCompletion #if display private #end class __ASSET__assets_week7_sounds_jeffgameover_jeffgameover_21_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/week7/sounds/jeffGameover/jeffGameover-22.ogg") @:noCompletion #if display private #end class __ASSET__assets_week7_sounds_jeffgameover_jeffgameover_22_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/week7/sounds/jeffGameover/jeffGameover-23.ogg") @:noCompletion #if display private #end class __ASSET__assets_week7_sounds_jeffgameover_jeffgameover_23_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/week7/sounds/jeffGameover/jeffGameover-24.ogg") @:noCompletion #if display private #end class __ASSET__assets_week7_sounds_jeffgameover_jeffgameover_24_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/week7/sounds/jeffGameover/jeffGameover-25.ogg") @:noCompletion #if display private #end class __ASSET__assets_week7_sounds_jeffgameover_jeffgameover_25_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/week7/sounds/jeffGameover/jeffGameover-3.ogg") @:noCompletion #if display private #end class __ASSET__assets_week7_sounds_jeffgameover_jeffgameover_3_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/week7/sounds/jeffGameover/jeffGameover-4.ogg") @:noCompletion #if display private #end class __ASSET__assets_week7_sounds_jeffgameover_jeffgameover_4_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/week7/sounds/jeffGameover/jeffGameover-5.ogg") @:noCompletion #if display private #end class __ASSET__assets_week7_sounds_jeffgameover_jeffgameover_5_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/week7/sounds/jeffGameover/jeffGameover-6.ogg") @:noCompletion #if display private #end class __ASSET__assets_week7_sounds_jeffgameover_jeffgameover_6_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/week7/sounds/jeffGameover/jeffGameover-7.ogg") @:noCompletion #if display private #end class __ASSET__assets_week7_sounds_jeffgameover_jeffgameover_7_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/week7/sounds/jeffGameover/jeffGameover-8.ogg") @:noCompletion #if display private #end class __ASSET__assets_week7_sounds_jeffgameover_jeffgameover_8_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/week7/sounds/jeffGameover/jeffGameover-9.ogg") @:noCompletion #if display private #end class __ASSET__assets_week7_sounds_jeffgameover_jeffgameover_9_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/week7/sounds/killYou.ogg") @:noCompletion #if display private #end class __ASSET__assets_week7_sounds_killyou_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/week7/sounds/stressCutscene.ogg") @:noCompletion #if display private #end class __ASSET__assets_week7_sounds_stresscutscene_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/week7/sounds/tankSong2.ogg") @:noCompletion #if display private #end class __ASSET__assets_week7_sounds_tanksong2_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/week7/sounds/wellWellWell.ogg") @:noCompletion #if display private #end class __ASSET__assets_week7_sounds_wellwellwell_ogg extends haxe.io.Bytes {}
@:keep @:file("art/readme.txt") @:noCompletion #if display private #end class __ASSET__do_not_readme_txt extends haxe.io.Bytes {}
@:keep @:file("assets/fonts/fonts-go-here.txt") @:noCompletion #if display private #end class __ASSET__assets_fonts_fonts_go_here_txt extends haxe.io.Bytes {}
@:keep @:font("export/release/html5/obj/webfont/pixel.otf") @:noCompletion #if display private #end class __ASSET__assets_fonts_pixel_otf extends lime.text.Font {}
@:keep @:font("export/release/html5/obj/webfont/vcr.ttf") @:noCompletion #if display private #end class __ASSET__assets_fonts_vcr_ttf extends lime.text.Font {}
@:keep @:file("C:/haxelib/flixel/5,2,2/assets/sounds/beep.mp3") @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends haxe.io.Bytes {}
@:keep @:file("C:/haxelib/flixel/5,2,2/assets/sounds/flixel.mp3") @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends haxe.io.Bytes {}
@:keep @:file("C:/haxelib/flixel/5,2,2/assets/sounds/beep.ogg") @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_ogg extends haxe.io.Bytes {}
@:keep @:file("C:/haxelib/flixel/5,2,2/assets/sounds/flixel.ogg") @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends haxe.io.Bytes {}
@:keep @:font("export/release/html5/obj/webfont/nokiafc22.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font {}
@:keep @:font("export/release/html5/obj/webfont/monsterrat.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font {}
@:keep @:image("C:/haxelib/flixel/5,2,2/assets/images/ui/button.png") @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends lime.graphics.Image {}
@:keep @:image("C:/haxelib/flixel/5,2,2/assets/images/logo/default.png") @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends lime.graphics.Image {}
@:keep @:image("C:/haxelib/flixel-ui/2,5,0/assets/images/box.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_box_png extends lime.graphics.Image {}
@:keep @:image("C:/haxelib/flixel-ui/2,5,0/assets/images/button.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_png extends lime.graphics.Image {}
@:keep @:image("C:/haxelib/flixel-ui/2,5,0/assets/images/button_arrow_down.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_down_png extends lime.graphics.Image {}
@:keep @:image("C:/haxelib/flixel-ui/2,5,0/assets/images/button_arrow_left.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_left_png extends lime.graphics.Image {}
@:keep @:image("C:/haxelib/flixel-ui/2,5,0/assets/images/button_arrow_right.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_right_png extends lime.graphics.Image {}
@:keep @:image("C:/haxelib/flixel-ui/2,5,0/assets/images/button_arrow_up.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_up_png extends lime.graphics.Image {}
@:keep @:image("C:/haxelib/flixel-ui/2,5,0/assets/images/button_thin.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_thin_png extends lime.graphics.Image {}
@:keep @:image("C:/haxelib/flixel-ui/2,5,0/assets/images/button_toggle.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_button_toggle_png extends lime.graphics.Image {}
@:keep @:image("C:/haxelib/flixel-ui/2,5,0/assets/images/check_box.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_check_box_png extends lime.graphics.Image {}
@:keep @:image("C:/haxelib/flixel-ui/2,5,0/assets/images/check_mark.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_check_mark_png extends lime.graphics.Image {}
@:keep @:image("C:/haxelib/flixel-ui/2,5,0/assets/images/chrome.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_png extends lime.graphics.Image {}
@:keep @:image("C:/haxelib/flixel-ui/2,5,0/assets/images/chrome_flat.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_flat_png extends lime.graphics.Image {}
@:keep @:image("C:/haxelib/flixel-ui/2,5,0/assets/images/chrome_inset.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_inset_png extends lime.graphics.Image {}
@:keep @:image("C:/haxelib/flixel-ui/2,5,0/assets/images/chrome_light.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_light_png extends lime.graphics.Image {}
@:keep @:image("C:/haxelib/flixel-ui/2,5,0/assets/images/dropdown_mark.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_dropdown_mark_png extends lime.graphics.Image {}
@:keep @:image("C:/haxelib/flixel-ui/2,5,0/assets/images/finger_big.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_finger_big_png extends lime.graphics.Image {}
@:keep @:image("C:/haxelib/flixel-ui/2,5,0/assets/images/finger_small.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_finger_small_png extends lime.graphics.Image {}
@:keep @:image("C:/haxelib/flixel-ui/2,5,0/assets/images/hilight.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_hilight_png extends lime.graphics.Image {}
@:keep @:image("C:/haxelib/flixel-ui/2,5,0/assets/images/invis.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_invis_png extends lime.graphics.Image {}
@:keep @:image("C:/haxelib/flixel-ui/2,5,0/assets/images/minus_mark.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_minus_mark_png extends lime.graphics.Image {}
@:keep @:image("C:/haxelib/flixel-ui/2,5,0/assets/images/plus_mark.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_plus_mark_png extends lime.graphics.Image {}
@:keep @:image("C:/haxelib/flixel-ui/2,5,0/assets/images/radio.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_radio_png extends lime.graphics.Image {}
@:keep @:image("C:/haxelib/flixel-ui/2,5,0/assets/images/radio_dot.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_radio_dot_png extends lime.graphics.Image {}
@:keep @:image("C:/haxelib/flixel-ui/2,5,0/assets/images/swatch.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_swatch_png extends lime.graphics.Image {}
@:keep @:image("C:/haxelib/flixel-ui/2,5,0/assets/images/tab.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_tab_png extends lime.graphics.Image {}
@:keep @:image("C:/haxelib/flixel-ui/2,5,0/assets/images/tab_back.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_tab_back_png extends lime.graphics.Image {}
@:keep @:image("C:/haxelib/flixel-ui/2,5,0/assets/images/tooltip_arrow.png") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_img_tooltip_arrow_png extends lime.graphics.Image {}
@:keep @:file("C:/haxelib/flixel-ui/2,5,0/assets/xml/defaults.xml") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_xml_defaults_xml extends haxe.io.Bytes {}
@:keep @:file("C:/haxelib/flixel-ui/2,5,0/assets/xml/default_loading_screen.xml") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_xml_default_loading_screen_xml extends haxe.io.Bytes {}
@:keep @:file("C:/haxelib/flixel-ui/2,5,0/assets/xml/default_popup.xml") @:noCompletion #if display private #end class __ASSET__flixel_flixel_ui_xml_default_popup_xml extends haxe.io.Bytes {}
@:keep @:file("") @:noCompletion #if display private #end class __ASSET__manifest_videos_json extends haxe.io.Bytes {}
@:keep @:file("") @:noCompletion #if display private #end class __ASSET__manifest_default_json extends haxe.io.Bytes {}



#else

@:keep @:expose('__ASSET__assets_fonts_pixel_otf') @:noCompletion #if display private #end class __ASSET__assets_fonts_pixel_otf extends lime.text.Font { public function new () { #if !html5 __fontPath = "assets/fonts/pixel"; #else ascender = 1125; descender = -250; height = 1375; numGlyphs = 262; underlinePosition = -143; underlineThickness = 20; unitsPerEM = 1000; #end name = "Pixel Arial 11 Bold"; super (); }}
@:keep @:expose('__ASSET__assets_fonts_vcr_ttf') @:noCompletion #if display private #end class __ASSET__assets_fonts_vcr_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "assets/fonts/vcr"; #else ascender = 1900; descender = -500; height = 2400; numGlyphs = 1004; underlinePosition = -200; underlineThickness = 100; unitsPerEM = 2048; #end name = "Roboto Black"; super (); }}
@:keep @:expose('__ASSET__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/nokiafc22"; #else ascender = 2048; descender = -512; height = 2816; numGlyphs = 172; underlinePosition = -640; underlineThickness = 256; unitsPerEM = 2048; #end name = "Nokia Cellphone FC Small"; super (); }}
@:keep @:expose('__ASSET__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/monsterrat"; #else ascender = 968; descender = -251; height = 1219; numGlyphs = 263; underlinePosition = -150; underlineThickness = 50; unitsPerEM = 1000; #end name = "Monsterrat"; super (); }}


#end

#if (openfl && !flash)

#if html5
@:keep @:expose('__ASSET__OPENFL__assets_fonts_pixel_otf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_pixel_otf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_pixel_otf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__assets_fonts_vcr_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_vcr_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_vcr_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_nokiafc22_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_monsterrat_ttf ()); super (); }}

#else
@:keep @:expose('__ASSET__OPENFL__assets_fonts_pixel_otf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_pixel_otf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_pixel_otf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__assets_fonts_vcr_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_vcr_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_vcr_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_nokiafc22_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_monsterrat_ttf ()); super (); }}

#end

#end
#end

#end

#end