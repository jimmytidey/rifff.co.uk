﻿package {	import flash.media.Sound;		public class PlayBackObjects{				public var playBackObjects = new Array(); 				function make(jsonData) { 			var bank_index=0;						for each (var bank:Object in jsonData['banks']) {				var bank_option_index = 0;				playBackObjects[bank_index] = new Array();				for each (var bank_option:Object in bank['bank_options']) {					playBackObjects[bank_index][bank_option_index]= new Sound();					bank_option_index ++;				}				bank_index ++; 							}			return playBackObjects; 		}					}}