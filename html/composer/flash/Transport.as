﻿package {	import fl.controls.TextInput;	import flash.events.*;	import flash.display.*;	import flash.text.TextField;	import fl.controls.Button;	public class Transport extends MovieClip{				public var playBack; 		var buttons:MovieClip = new MovieClip;		var scrubberContainer:MovieClip = new MovieClip;				public function makeTransport(jsonData, volumeArray, grid, soundContainer, _stage, grid_top, grid_left) {						while (this.scrubberContainer.numChildren > 0) {				this.scrubberContainer.removeChildAt(this.scrubberContainer.numChildren-1);			} 						_stage.addChild(scrubberContainer);												while (this.buttons.numChildren > 0) {				this.buttons.removeChildAt(this.buttons.numChildren-1);			} 								trace('making playback');			var playBack:PlayBack = new PlayBack(jsonData, volumeArray, scrubberContainer, soundContainer, grid_top, grid_left);						var stopPlayContainer:MovieClip = new MovieClip;			buttons.addChild(stopPlayContainer);					//play btn 			var playBtn = new Button();			playBtn.x = 0;			playBtn.width = 80; 			playBtn.label = '▸';			stopPlayContainer.addChild(playBtn);			playBtn.addEventListener(MouseEvent.CLICK, playListener);			function playListener() {				while (stopPlayContainer.numChildren > 0) {stopPlayContainer.removeChildAt(stopPlayContainer.numChildren-1);}								stopPlayContainer.addChild(stopBtn);				playBack.go(jsonData,volumeArray, grid, soundContainer);			}						//stop btn 			var stopBtn = new Button();			stopBtn.x = 0; 			stopBtn.width = 80; 			stopBtn.label = "❙❙";			stopBtn.addEventListener(MouseEvent.CLICK, stopListener);			function stopListener() {				while (stopPlayContainer.numChildren > 0) {stopPlayContainer.removeChildAt(stopPlayContainer.numChildren-1);}								stopPlayContainer.addChild(playBtn);				playBack.my_stop();			}						//randomise			var randomiseBtn = new Button();			randomiseBtn.x = 100; 			randomiseBtn.width = 80; 			randomiseBtn.label = "Randomise"; 			buttons.addChild(randomiseBtn);			randomiseBtn.addEventListener(MouseEvent.CLICK, randomise);						function randomise() { 				dispatchEvent(new Event("randomise", true));			}						//rewind			var rewindBtn = new Button();			rewindBtn.x = 200;			rewindBtn.width = 80;			rewindBtn.label = "Rewind"			buttons.addChild(rewindBtn);			rewindBtn.addEventListener(MouseEvent.CLICK, rewind);			function rewind() {				playBack.my_stop();				playBack.movePlayHead(0);			}						//step backward 			var backwardBtn = new Button();			backwardBtn.x = 300;			backwardBtn.width = 80;			backwardBtn.label = "«";			buttons.addChild(backwardBtn);			backwardBtn.addEventListener(MouseEvent.CLICK, backward);						function backward() { 				if (playBack.step_number > 0) { 					playBack.my_stop(); 					playBack.movePlayHead(playBack.step_number-1);				}			}							//step forward			var forwardBtn = new Button();			forwardBtn.x = 400;			forwardBtn.width = 80; 			forwardBtn.label = "»";			buttons.addChild(forwardBtn);			forwardBtn.addEventListener(MouseEvent.CLICK, forward);						function forward() {				playBack.my_stop(); 				playBack.movePlayHead(playBack.step_number+1);			}			buttons.x = 0;			buttons.y = 60;			_stage.addChild(buttons);		}			function volumeChanged(obj) { 			this.playBack.volumeChanged();		}			}}