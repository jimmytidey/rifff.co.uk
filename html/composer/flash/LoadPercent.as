﻿package {	import flash.MovieClip;	import flash.text.TextField;		import flash.events.*;	public class LoadPercent {		var statusTextField:TextField  = new TextField();		public function LoadPercent(fileMC, top_position) { 			statusTextField.x = 20;			statusTextField.y = top_position;			fileMC.addChild(statusTextField);		}				public function updatePercent(event:ProgressEvent) { 			var loadTime:Number = event.bytesLoaded / event.bytesTotal;			var loadPercent:uint = Math.round(100 * loadTime);			statusTextField.text = loadPercent + "%";		}	}}