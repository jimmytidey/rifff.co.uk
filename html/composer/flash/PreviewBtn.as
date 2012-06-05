﻿package {	import flash.display.*; 	import flash.events.*;	import flash.MovieClip;	import flash.net.URLRequest;	import flash.net.URLLoader;		import flash.media.SoundChannel;	import flash.media.Sound;	import flash.text.TextField;		public class PreviewBtn extends MovieClip {		var channel:SoundChannel = new SoundChannel();				public function newBtn(fileMC, Mp3, name, top_position, project_name) { 						//name of the audio clip 			var nameTextField:TextField  = new TextField();			nameTextField.text = name;			nameTextField.width = 300;			nameTextField.x = 65;			nameTextField.y = top_position;						fileMC.addChild(nameTextField);							var deleteBtn:Loader = new Loader();						//add delete sample button			deleteBtn.load(new URLRequest("http://rifff.co.uk/composer/images/cross.png"));						deleteBtn.y = top_position;			deleteBtn.x = 48;  			deleteBtn.doubleClickEnabled = true;			deleteBtn.addEventListener(MouseEvent.DOUBLE_CLICK, deleteSample);						function deleteSample() {				var removeSample:Loader = new Loader();								var clean_project_name = escape(project_name);				var clean_name = escape(name);												removeSample.load(new URLRequest("http://rifff.co.uk/composer/delete_file.php?project_name="+ clean_project_name + "&file="+clean_name));					trace("http://rifff.co.uk/composer/delete_file.php?project_name="+ clean_project_name + "&file="+clean_name);				dispatchEvent(new Event("changed", true));			}									fileMC.addChild(deleteBtn);									//preview button			var playBtn:Loader = new Loader();			playBtn.load(new URLRequest("http://rifff.co.uk/composer/images/control_play.png"));						var stopBtn:Loader = new Loader();			stopBtn.load(new URLRequest("http://rifff.co.uk/composer/images/control_stop.png"));									var transportMC:MovieClip  = new MovieClip();			transportStatus = "playing";			transportMC.y = top_position;			transportMC.addChild(playBtn);			transportMC.addEventListener(MouseEvent.CLICK, changeState);						function changeState() {				if (transportStatus == "playing"){ 					while(transportMC.numChildren){						transportMC.removeChildAt(0);					}					transportMC.addChild(stopBtn);					transportStatus = "stopped";					channel = Mp3.play();					channel.addEventListener(Event.SOUND_COMPLETE, soundCompleteHandler);				}				else { 					while(transportMC.numChildren){						transportMC.removeChildAt(0);					}					transportMC.addChild(playBtn);					transportStatus = "playing";					channel.stop();									}			}						function soundCompleteHandler(event) { 				changeState(); 			} 						fileMC.addChild(transportMC); 		}				public function refreshBtn(fileMC,Mp3,soundURL) {			var refreshBtn:Loader = new Loader();			refreshBtn.load(new URLRequest("http://riff.jimmytidey.co.uk/mk2/images/arrow_refresh.png"));			refreshBtn.x = 45;			refreshBtn.addEventListener(MouseEvent.CLICK, refreshSound);						function refreshSound(obj:Object) {				Mp3.close();				Mp3 = new Sound();				Mp3.load(new URLRequest(soundURL));			}						fileMC.addChild(refreshBtn);		}	}}