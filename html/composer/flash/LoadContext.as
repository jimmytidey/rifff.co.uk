﻿package {		import flash.events.*;	import flash.utils.*;	import flash.display.*; 	import flash.text.*; 	import flash.MovieClip; 		public class LoadContext extends MovieClip {				function userName() { 			var user_name:String = root.loaderInfo.parameters.user_name;			if (user_name == null) {				user_name = "tom"; 			}			return user_name; 		}				function projectName() { 					var project_name:String;			if (root.loaderInfo.parameters.project_name) {				project_name = root.loaderInfo.parameters.project_name;			}			else {				project_name = "demo project"; 			}			return project_name; 		}	}}