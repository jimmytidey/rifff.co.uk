﻿package {	import flash.net.URLRequest;	import flash.net.URLLoader;	import flash.events.*;	import flash.utils.*;	import flash.display.*; 	import jButton;		public class Render extends MovieClip {		var playhead_container:MovieClip = new MovieClip;		var playhead:MovieClip = new MovieClip(); 		var grid_left:int; 				//draw the playhead		public function drawPlayhead(jsonData, container, step_number,  grid_top, grid_left) {						this.grid_left = grid_left;			//incase playhead is already on the screen somehow			while (this.playhead_container.numChildren > 0) {				trace('removing playhead');				playhead_container.removeChildAt(this.playhead_container.numChildren-1);			}									//work out how high the playhead needs to be 			var total_bank_options:int;			for (bank_index=0; bank_index < jsonData['banks'].length; bank_index++) {				total_bank_options += jsonData['banks'][bank_index]['bank_options'].length;			}						var playhead_height:int = (total_bank_options * 26) + (jsonData['banks'].length * 56) - 40; 						//draw that playhea			playhead.graphics.beginFill(0xcccccc, 0.3);			playhead.graphics.drawRect(0, 0, 13, playhead_height);			playhead.graphics.endFill();									playhead.x = grid_left + (17 * step_number); 			playhead.y = grid_top;			 			//add the container to the stage			playhead_container.addChild(playhead);			container.addChild(playhead_container);			container.setChildIndex(playhead_container, 0);		}				public function movePlayhead(step_number) {			playhead.x =  grid_left + (17 * step_number); 		}	}}