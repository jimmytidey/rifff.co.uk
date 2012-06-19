﻿package {	import fl.controls.TextInput;	import flash.events.*;	import flash.display.*;	import flash.text.TextField;	import fl.controls.Button;	import flash.media.SoundMixer;	import flash.media.SoundChannel;	public class Score extends MovieClip{		public var score:Array = new Array();				public function generate(jsonData, grid, soundContainer, number_of_steps, step_time) {								//declare the arrays 			for (var bank_index:int =0; bank_index < jsonData['banks'].length; bank_index++) {				score[bank_index] = new Array() 							for (var bank_option_index:int =0; bank_option_index < jsonData['banks'][bank_index]['bank_options'].length; bank_option_index++) {					score[bank_index][bank_option_index] = new Array();					for (var step_number:int =0; step_number < number_of_steps; step_number++) {						score[bank_index][bank_option_index][step_number] = new Array();						score[bank_index][bank_option_index][step_number]['action'] = 'stop';						score[bank_index][bank_option_index][step_number]['offset'] = '0';							if (grid[bank_index][step_number][bank_option_index] == 100) { 							grid[bank_index][step_number]['certain_play'] = bank_option_index;						}					}				}			}						//now set when the arrays should play 			for (bank_index=0; bank_index < jsonData['banks'].length; bank_index++) {				for (step_number=0; step_number < number_of_steps; step_number++) {														//if there is one step that is going to play, play it and stop everything else 					if(grid[bank_index][step_number]['certain_play'] != undefined) {												var certain_number = grid[bank_index][step_number]['certain_play'];						if (jsonData['banks'][bank_index]['bank_options'][certain_number]['loop'] == "true") {							score[bank_index][certain_number][step_number]['action'] = "loop";						}						else { 							score[bank_index][certain_number][step_number]['action'] = "play";						}												//look forward to see when voice stealing will occur						for (var test_step = step_number+1; test_step < number_of_steps; test_step ++) {  							if (grid[bank_index][test_step]['certain_play'] != undefined) {								trace("should be zero" + grid[bank_index][test_step]['certain_play'] );								break;    							}						}												var voice_steal_time = (step_time)  * (test_step - step_number); 												var playback_time:Number = 0;						var duration:Number;												//get the clean file location 						if (jsonData['banks'][bank_index]['bank_options'][certain_number]['file_location'] != undefined) { 							var file_location = jsonData['banks'][bank_index]['bank_options'][certain_number]['file_location'];							var file_location_array:Array = file_location.split(".");							var clean_file_location = file_location_array[0];								//how long is this mp3 sample? 							trace("CFL"+clean_file_location);							if (clean_file_location != undefined && clean_file_location !='') { 								if (soundContainer[clean_file_location].length != undefined) {  									playback_time = (soundContainer[clean_file_location].length);								}							}													}												//vanila playback 						if (jsonData['banks'][bank_index]['bank_options'][certain_number]['loop'] != 'true' && jsonData['banks'][bank_index]['bank_options'][certain_number]['overplay'] != 'true') { 							//case where mp3 is truncated by a step 							if (playback_time > step_time) { 								playback_time = step_time; 							}													}												//case where the sample is truncated by a step  						if (jsonData['banks'][bank_index]['bank_options'][certain_number]['loop'] == 'true') { 							playback_time = step_time; 						}												// case where it just plays until (voice) stolen 						if (jsonData['banks'][bank_index]['bank_options'][certain_number]['loop'] == 'true' && jsonData['banks'][bank_index]['bank_options'][certain_number]['overplay'] == 'true') { 							playback_time = 1000000; 						}												if (playback_time < voice_steal_time)  {duration = playback_time;}						else {duration = voice_steal_time;}						score[bank_index][certain_number][step_number]['time'] = duration;						trace(voice_steal_time);						trace("Action bank index:" + bank_index + "  bank option:" + certain_number + " check_step: " + step_number + " val:" +score[bank_index][certain_number][step_number]['time']);											}				}			}						//this to set retrigger points ie. if there are any samples that last more than 			for (bank_index=0; bank_index < jsonData['banks'].length; bank_index++) {				for (bank_option_index=0; bank_option_index < jsonData['banks'][bank_index]['bank_options'].length; bank_option_index++) {					for (step_number=0; step_number < number_of_steps; step_number++) {						if (score[bank_index][bank_option_index][step_number]['action'] == "play" || score[bank_index][bank_option_index][step_number]['action'] == "loop") { 							for (var check_step = step_number+1; check_step < number_of_steps; check_step++) {									var time_forward = int((check_step - step_number) * step_time);								var sample_length = int(score[bank_index][bank_option_index][step_number]['time']);															if (sample_length > time_forward) {									trace("sample_length" + sample_length); 									trace("time_forward" + time_forward);									//only modify if the step in question doesn't already have a value 									if(score[bank_index][bank_option_index][check_step]['action'] != 'play' && score[bank_index][bank_option_index][check_step]['action'] != 'loop') { 																	var action = score[bank_index][bank_option_index][step_number]['action'];										score[bank_index][bank_option_index][check_step]['offset'] = time_forward;																			if (action == 'play') {  											score[bank_index][bank_option_index][check_step]['action'] = 'play_retrigger';										}										if (action == 'loop') { 											score[bank_index][bank_option_index][check_step]['action'] = 'loop_retrigger';										}										trace("Action bank index:" + bank_index + "  bank option:" + bank_option_index + " check_step: " + check_step + " val:" +score[bank_index][bank_option_index][check_step]['action']);									}								}							}						}					}				}			}				}	}}