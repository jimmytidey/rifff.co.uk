﻿package {	import flash.net.URLRequest;	import flash.net.URLLoader;	import flash.events.*;	import flash.utils.*;	import flash.display.*; 	import flash.graphics.*; 	import jButton;		public class pbRender extends MovieClip {		var playhead_container:MovieClip = new MovieClip;		var pattern_container:MovieClip = new MovieClip;		var playHead:Shape = new Shape();		var grid_left:int; 		var no_of_steps:int;		var angle_per_step:Number; 		var radius:Number; 					//draw the playhead		public function drawPlayhead(jsonData, container, step_number,  grid_top, grid_left) {			trace("rendered");			playHead.graphics.lineStyle(1, 0xcccccc, .75);			no_of_steps = jsonData['project_info']['steps'];			angle_per_step = 360/no_of_steps;  			radius = 55;			playHead.graphics.lineTo(0,200);			playHead.x = 250; 			playHead.y = 300;			container.addChild(playHead); 			container.addChild(playhead_container);			container.setChildIndex(playhead_container, 0);		}				public function movePlayhead(step_number) {			playHead.rotation = angle_per_step * step_number; 		}	}}