﻿package {		import flash.text.TextField;	import flash.display.*;	import flash.events.*;	public class ModifyStructure extends MovieClip {				var modify_container = new MovieClip();				public function make(jsonData, _stage, grid_top, grid_left) {						while (modify_container.numChildren > 0) {				modify_container.removeChildAt(modify_container.numChildren-1);			} 									var bank_index= 0;			cumulatuive_y_offset = grid_top + 30;			var bankOptionButton:ModifyStructureButton = new ModifyStructureButton(); 			bankOptionButton.addEventListener("save_name", saveData);						for each (var bank:Object in jsonData['banks']) {				var bank_option_index= 0;				for each (var bank_option:Object in bank['bank_options']) {										// add bank option button 					if (bank_option_index == bank['bank_options'].length-1) {						bankOptionButton.makeBankOptionButton(modify_container, cumulatuive_y_offset, jsonData, bank_index, bank_option_index); 					}										//bank name and delete buttons					if (bank_option_index == 0) {						bankOptionButton.makeBankName(modify_container, cumulatuive_y_offset - 30, jsonData, bank_index, bank_option_index);						bankOptionButton.makeBankDelete(modify_container, cumulatuive_y_offset - 30, jsonData, bank_index, bank_option_index);					}												//add bank button					if (bank_index ==  jsonData['banks'].length-1 && bank_option_index == bank['bank_options'].length-1) {						bankOptionButton.makeBankButton(modify_container, cumulatuive_y_offset +30, jsonData, bank_index, bank_option_index);					}															bank_option_index ++;					cumulatuive_y_offset += 26;				}				bank_index ++; 				cumulatuive_y_offset += 56;			}						_stage.addChild(modify_container);						function saveData() {				dispatchEvent(new Event("save_name", true));			}					}	}}