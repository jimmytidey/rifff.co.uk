﻿package {	import flash.events.*;	import fl.controls.Button;	import fl.controls.TextInput; 	import fl.controls.TextField;	import flash.text.TextField;	import flash.display.*;		import com.adobe.serialization.json.JSON;		public class ModifyStructureButton extends MovieClip {		function makeBankOptionButton(modify_container, y, jsonData, bank_index, bank_option_index) { 			var addBankOptionBtn:Button = new Button(); 			addBankOptionBtn.label = "Add bank option";			addBankOptionBtn.x = 0			addBankOptionBtn.y =y;			addBankOptionBtn.addEventListener(MouseEvent.CLICK, addBankOption);						function addBankOption() {				json_string = '{"file_location":"a.mp3","sequence":["0"],"bank_option_name":"new bank option","overplay":"false","volume":50,"loop":"false"}';				json_array = JSON.decode(json_string);								while (json_array['sequence'].length < jsonData['project_info']['steps']) {					json_array['sequence'].push("0");				}				jsonData['banks'][bank_index]['bank_options'].push(json_array);				dispatchEvent(new Event("changed", true));			}			modify_container.addChild(addBankOptionBtn);		}				function makeBankButton(modify_container, y, jsonData, bank_index, bank_option_index) { 						var addBankBtn:Button = new Button(); 			addBankBtn.label = "Add bank";			addBankBtn.x = 0			addBankBtn.y =y;			addBankBtn.addEventListener(MouseEvent.CLICK, addBank);						function addBank() {				json_string = '{"bank_options":[{"bank_option_name":"1option","overplay":"false","loop":"false","file_location":"a.mp3","sequence":["0"],"volume":50},{"bank_option_name":"3option","overplay":"false","loop":"false","file_location":"a.mp3","sequence":["0"],"volume":49},{"bank_option_name":"2option","overplay":"false","loop":"false","file_location":"a.mp3","sequence":["0"],"volume":50},{"bank_option_name":"4option","overplay":"false","loop":"false","file_location":"a.mp3","sequence":["0"],"volume":49},{"bank_option_name":"1option","overplay":"false","loop":"false","file_location":"a.mp3","sequence":["0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0"],"volume":50}],"bank_name":"new bank"}';				json_array = JSON.decode(json_string);								for each (var bank in json_array['bank_options']) { 					while (bank['sequence'].length < jsonData['project_info']['steps']) {						bank['sequence'].push("0");					}				}								jsonData['banks'].push(json_array);   							dispatchEvent(new Event("changed", true));			}			modify_container.addChild(addBankBtn);		}				function makeBankName(modify_container, y, jsonData, bank_index, bank_option_index) { 			var bankName:TextInput = new TextInput (); 			if (jsonData['banks'][bank_index]['bank_name']) { 				bankName.text = jsonData['banks'][bank_index]['bank_name'];			}			else { 				bankName.text = "untitled";			}			bankName.x = 330;			bankName.y =y-22;			bankName.height = 20;			bankName.addEventListener(FocusEvent.FOCUS_OUT, saveName);						var bankLabel:TextField = new TextField();			bankLabel.text="Bank name:";			bankLabel.height = 20;			bankLabel.x = 267;			bankLabel.y =y-20;						function saveName(obj) {				jsonData['banks'][bank_index]['bank_name'] = obj.target.text;				dispatchEvent(new Event("changed", true));			}						modify_container.addChild(bankName);			modify_container.addChild(bankLabel);		}				function makeBankDelete(modify_container, y, jsonData, bank_index, bank_option_index) {			var deleteBankBtn:Button = new Button(); 			deleteBankBtn.label = "Delete bank";			deleteBankBtn.x = 435;			deleteBankBtn.height = 20;			deleteBankBtn.width = 80;			deleteBankBtn.y =y -25;			deleteBankBtn.addEventListener(MouseEvent.CLICK, deleteBank);						function deleteBank(event) {				if (event.target.label == "You sure?") { 					jsonData['banks'].splice(bank_index, 1);					dispatchEvent(new Event("changed", true));				}				else {  					event.target.label = "You sure?";					event.target.emphasized = true;					var cancelBtn:Button = new Button();					cancelBtn.label = "cancel";					cancelBtn.width = 100;					cancelBtn.x = 550;					cancelBtn.height = 20; 					cancelBtn.y =y -25;					cancelBtn.addEventListener(MouseEvent.CLICK, cancel);					function cancel(event)  { 						_stage.removeChild(cancelBtn);						deleteBankBtn.emphasized = false;						deleteBankBtn.label = "Delete bank";					}					modify_container.addChild(cancelBtn);				}			}			modify_container.addChild(deleteBankBtn);					}	}}