﻿ package {	import flash.net.URLRequest;	import flash.net.URLLoader;	import flash.events.*;	import flash.display.*;	import flash.text.TextField;	import com.adobe.serialization.json.JSON;	import flash.media.Sound;	import fl.controls.Button;	public class SoundObjects extends MovieClip {		public var fileObject:Object = new Object();		public var fileArray:Array = new Array();		public var soundContainer:Object = new Object();		public var reloadBtn:Button = new Button();		public var filelist:Array = new Array();			public function changeHeight(height, fileMC, grid_top, grid_left) {			var offset:int=int(height)+200;			fileMC.y=offset;		}		public function make(_stage, height, grid_top, grid_left, fileMC) {						while (fileMC.numChildren > 0) {				fileMC.removeChildAt(fileMC.numChildren-1);			}			//get context			var loadContext:LoadContext= new LoadContext();			_stage.addChild(loadContext);			var user_name=loadContext.userName();			var project_name=loadContext.projectName();			var debug_state=loadContext.debug();			var list_url:String;			//get list of all sounds present			if (debug_state=='false') {				list_url="file_list.php?project_name="+project_name;			} else {				list_url="http://rifff.co.uk/composer/file_list.php?project_name=Example";			}			var requester:URLRequest = new URLRequest();			var loader:URLLoader = new URLLoader();			requester.url=list_url;			loader.load(requester);			loader.addEventListener(Event.COMPLETE, decodeJSON);			//read list			function decodeJSON(event:Event) {				fileObject=JSON.decode(loader.data);				if (fileObject['files']) {					fileArray = fileObject['files'];				} else {					fileObject['files']='No samples uploaded';				}								filelist = fileArray; 								makeObjects(fileObject['files']);				dispatchEvent(new Event("loaded", true));			}						function makeObjects(files:Object) {				var top_position=0;				var left_position=grid_left;				var transportMCs:Array = new Array();				var transportStatus:Array = new Array();				var index=0;				fileMC.x=0;				fileMC.y=height+200;				_stage.addChild(fileMC);								file_offset = 0;								function soundLoop(files) {					Mp3 = new Sound();										var loadPercent:LoadPercent=new LoadPercent(fileMC,top_position);					if (debug_state=='false') {						soundURL='projects/'+user_name+'/'+project_name+'/'+files[file_offset];					} else {						soundURL="http://rifff.co.uk/composer/projects/tom/Example/"+files[file_offset];					}										Mp3.load(new URLRequest(soundURL));					Mp3.addEventListener(ProgressEvent.PROGRESS, loadPercent.updatePercent);					Mp3.addEventListener(IOErrorEvent.IO_ERROR, errorHandler);					Mp3.addEventListener(Event.COMPLETE, nextIteration);										//MC to contain all info about this MP					//preview button					var previewBtn:PreviewBtn = new PreviewBtn();					previewBtn.newBtn(fileMC, Mp3, files[file_offset], top_position, project_name);					top_position+=30;					var file_name=files[file_offset].split(".");					var clean_file_name=file_name[0];					soundContainer[clean_file_name]=Mp3;					function nextIteration(event) {						if (file_offset < files.length - 1){  							file_offset++;							soundLoop(files);						}					}				}				soundLoop(files);								//do reload buton  				reloadBtn.label="Reload samples";				reloadBtn.x=400;				reloadBtn.y=0;				fileMC.addChild(reloadBtn);			}			function errorHandler(errorEvent:IOErrorEvent):void {				trace("The sound could not be loaded: " + errorEvent.text);			}		}	}}