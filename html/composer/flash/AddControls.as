﻿package {	import flash.events.*;	import flash.display.*; 	import flash.events.*;	import fl.controls.Slider;	import flash.text.TextField;	import flash.net.URLRequest;	import flash.net.URLLoader;    import flash.display.Bitmap;    import flash.display.BitmapData;			public class AddControls extends MovieClip {				var controls_container = new MovieClip();				public function make(jsonData, _stage, volumeArray, grid_top, grid_left) {						while (controls_container.numChildren > 0) {				controls_container.removeChildAt(controls_container.numChildren-1);			} 						var bank_index= 0;			cumulatuive_y_offset = grid_top + 25;						var controlElements:ControlElements= new ControlElements(); 			controlElements.addEventListener("changed", saveData);			controlElements.addEventListener("volume_changed", volumeChanged);			 			var checkboxLegend:CheckboxLegend = new CheckboxLegend(469, 60);            var legend:Bitmap = new Bitmap(checkboxLegend);				legend.x = 230; 			legend.y = 90;			controls_container.addChild(legend); 												for each (var bank:Object in jsonData['banks']) {				volumeArray[bank_index] = new Array();				var bank_option_index= 0;				for each (var bank_option:Object in bank['bank_options']) {					controlElements.makeVolume(volumeArray, controls_container, cumulatuive_y_offset, jsonData, bank_index, bank_option_index);					controlElements.makeDelete(controls_container, cumulatuive_y_offset, jsonData, bank_index, bank_option_index);					controlElements.makeLoop(controls_container, cumulatuive_y_offset, jsonData, bank_index, bank_option_index);					controlElements.makeOverPlay(controls_container, cumulatuive_y_offset, jsonData, bank_index, bank_option_index);										bank_option_index ++;					cumulatuive_y_offset += 26;				}				bank_index ++; 				cumulatuive_y_offset += 56;			}			_stage.addChild(controls_container);							function saveData() {				dispatchEvent(new Event("changed", true));			}			function volumeChanged() {				dispatchEvent(new Event("volume_changed", true));			}								}	}}