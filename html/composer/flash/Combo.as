﻿package {	import fl.controls.ComboBox;	import fl.data.DataProvider;	import flash.events.*;	import flash.display.*;		public class Combo extends MovieClip{ 		function make(jsonData, dp, selected_index, bank_index, bank_option_index, cumulatuive_y_offset, dropdown_container) { 			var cb:ComboBox = new ComboBox();			cb.dataProvider = dp;			cb.y = cumulatuive_y_offset;			cb.height = 20;			cb.width = 180;			cb.selectedIndex = selected_index;  			cb.dataProvider.sortOn("label");						cb.addEventListener(Event.CHANGE, change);						function change() { 				jsonData['banks'][bank_index]['bank_options'][bank_option_index]['file_location'] = cb.selectedLabel;				dispatchEvent(new Event("changed", true));			}						dropdown_container.addChild(cb);		}	}		}