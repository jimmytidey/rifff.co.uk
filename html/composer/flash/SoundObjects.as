﻿ package {	import flash.net.URLRequest;	import flash.net.URLLoader;	import flash.events.*;	import flash.display.*;	import flash.text.TextField;	import com.adobe.serialization.json.JSON;	import flash.media.Sound;	import fl.controls.Button;	import flash.media.SoundLoaderContext;	public class SoundObjects extends MovieClip {		public var fileObject:Object = new Object();		public var fileArray:Array = new Array();		public var soundContainer:Object = new Object();		public var reloadBtn:Button = new Button();		public var filelist:Array = new Array();		public var fileMC:MovieClip = new MovieClip;		public var total_bank_options:int = 0;		public var current_sound_percent:int = 0;				public var user_name;			public function changeHeight(height, grid_top, grid_left) {			var offset:int=int(height)+200;			trace("hight" + height);			fileMC.y=offset;		}		public function make(_stage, height, grid_top, grid_left, fileMC, project_name, user_name) {						while (fileMC.numChildren > 0) {				fileMC.removeChildAt(fileMC.numChildren-1);			} 						var list_url:String ="http://www.rifff.co.uk/composer/file_list.php?project_name="+project_name;			var requester:URLRequest = new URLRequest();			var loader:URLLoader = new URLLoader();			this.fileMC = fileMC; 						requester.url=list_url;			loader.load(requester);			loader.addEventListener(Event.COMPLETE, decodeJSON);			//read list			function decodeJSON(event:Event) {				fileObject=JSON.decode(loader.data);				if (fileObject['files']) {					fileArray = fileObject['files'];				} else {					fileObject['files']='No samples uploaded';				}								filelist = fileArray; 				total_bank_options = fileObject['files'].length;				makeObjects(fileObject['files']);				dispatchEvent(new Event("loaded", true));			}						function makeObjects(files:Object) {				var top_position=0;				var left_position=grid_left;				var transportMCs:Array = new Array();				var transportStatus:Array = new Array();				var index=0;				fileMC.x=0;				fileMC.y=height+200;				_stage.addChild(fileMC);								file_offset = 0;								function soundLoop(files) {					Mp3 = new Sound();										var loadPercent:LoadPercent=new LoadPercent(fileMC,top_position);					soundURL='http://www.rifff.co.uk/composer/projects/'+user_name+'/'+project_name+'/'+files[file_offset];					var context:SoundLoaderContext = new SoundLoaderContext(3000, false);					Mp3.load(new URLRequest(soundURL), context);					Mp3.addEventListener(ProgressEvent.PROGRESS, loadPercent.updatePercent);					Mp3.addEventListener(ProgressEvent.PROGRESS, percentIncrease);					Mp3.addEventListener(IOErrorEvent.IO_ERROR, errorHandler);					Mp3.addEventListener(Event.COMPLETE, nextIteration);										//MC to contain all info about this 					//preview button					var previewBtn:PreviewBtn = new PreviewBtn();					previewBtn.newBtn(fileMC, Mp3, files[file_offset], top_position, project_name);					top_position+=30;					var file_name=files[file_offset].split(".");					var clean_file_name=file_name[0];					soundContainer[clean_file_name]=Mp3;					function nextIteration(event) {						if (file_offset < files.length - 1){  							file_offset++;							dispatchEvent(new Event("soundFileLoaded", true));							soundLoop(files);						}						else {							dispatchEvent(new Event("all_files_loaded", true));						}					}				}				soundLoop(files);								//do reload buton  				reloadBtn.label="Reload samples";				reloadBtn.x=400;				reloadBtn.y=0;				fileMC.addChild(reloadBtn);			}			function errorHandler(errorEvent:IOErrorEvent):void {				trace("The sound could not be loaded: " + errorEvent.text);			}		}				public function percentIncrease (event:ProgressEvent) { 			var loadTime:Number = event.bytesLoaded / event.bytesTotal;			var loadPercent:uint = Math.round(100 * loadTime);			this.current_sound_percent = loadPercent;			dispatchEvent(new Event("percentIncrease", true));				}			}}