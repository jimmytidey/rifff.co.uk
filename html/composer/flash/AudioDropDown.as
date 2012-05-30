﻿package {	import fl.controls.ComboBox;	import fl.data.DataProvider;	import flash.display.*;	import flash.events.*;			public class AudioDropDown extends Sprite {				var dropdown_container = new MovieClip();				public function make(jsonData, soundObjects, samples, _stage, grid_top, grid_left) {			var cumulatuive_y_offset:int = grid_top;						while (this.dropdown_container.numChildren > 0) {				this.dropdown_container.removeChildAt(this.dropdown_container.numChildren-1);			} 						var dp:DataProvider = new DataProvider();			for (file in soundObjects) { 				dp.addItem({label:file});			}						var bank_index= 0;			for each (var bank:Object in jsonData['banks']) {				var bank_option_index= 0;				for each (var bank_option:Object in bank['bank_options']) {										var file_location:String = jsonData['banks'][bank_index]['bank_options'][bank_option_index]['file_location'];					var combo:Combo = new Combo();					var test_index = 0; 					var selected_index = 0; 										for (file in soundObjects) { 						if(file_location) { 							var file_location_array:Array = file_location.split(".");							var clean_file_location = file_location_array[0];										if (file == clean_file_location) {								selected_index = test_index;								samples[bank_index][bank_option_index] = file;							}						}						test_index++;					}															combo.addEventListener("changed", saveData);					combo.make(jsonData, dp, selected_index, bank_index, bank_option_index, cumulatuive_y_offset, dropdown_container);							bank_option_index ++;					cumulatuive_y_offset += 26;										function saveData() { 						dispatchEvent(new Event("changed", true));					}				}				bank_index ++; 				cumulatuive_y_offset += 56;			}						_stage.addChild(dropdown_container);			return samples;		}	}}