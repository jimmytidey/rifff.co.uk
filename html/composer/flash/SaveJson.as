﻿package {	import com.adobe.serialization.json.JSON;	import flash.net.URLRequest;	import flash.net.URLLoader;	import flash.net.URLVariables;	import flash.net.URLRequestMethod;	import flash.events.*; 		public class SaveJson {				function save(jsonData, _stage) { 			json_string = escape(JSON.encode(jsonData));			var loadContext:LoadContext= new LoadContext();			_stage.addChild(loadContext);			var project_name; 			if (loadContext.debug() == 'false') { 				project_name = loadContext.projectName();				save_url = 'http://rifff.co.uk/composer/write_json.php';			}						else { 				project_name = escape("Unstable Debug Version"); 				save_url = 'http://rifff.co.uk/composer/write_json.php';			}									trace(save_url);						var myVariables:URLVariables = new URLVariables();			myVariables.json  = json_string;			myVariables.project_name = escape(project_name);									var requester:URLRequest = new URLRequest();			requester.data = myVariables;			requester.method = URLRequestMethod.POST; 				var loader:URLLoader = new URLLoader();				loader.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);			function ioErrorHandler(event:IOErrorEvent):void {				trace("ioErrorHandler: " + event);			}									requester.url=save_url;			loader.load(requester);			loader.addEventListener(Event.COMPLETE, debug);															function debug(event:Event) {								//trace(loader.data);			}						}	}}