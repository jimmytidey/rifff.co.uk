﻿package {	import com.adobe.serialization.json.JSON;	import flash.net.URLRequest;	import flash.net.URLLoader;	import flash.net.URLVariables;	import flash.events.*;	import flash.display.*; 	import flash.text.*;	import fl.transitions.*;	import fl.transitions.easing.*;	  	public class RandomSeedComposer extends MovieClip {				//variables		var jsonData:Object = new Object();		var filelist:Array = new Array();		var soundContainer:Object = new Object();		var volumeArray:Array = new Array();				//control objects 		var selectSteps:SelectSteps = new SelectSteps();		var calculateGrid:CalculateGrid = new CalculateGrid();		var soundObjects:SoundObjects = new SoundObjects();		var audioDropDown:AudioDropDown = new AudioDropDown(); 		var modifyStructure:ModifyStructure = new ModifyStructure(); 		var addControls:AddControls= new AddControls();		var globalSettings:GlobalSettings = new GlobalSettings();		var transport:Transport = new Transport();		var render:Render = new Render();		var saveJson:SaveJson = new SaveJson();		var score:Score = new Score();				//movie clips		var auditionContainer:MovieClip  = new MovieClip();		var monitorContainer:MovieClip = new MovieClip();		var loadStatus:TextField = new TextField();			//general variabels 		var project_name:String;    		var user_name:String;		var number_of_steps:int;		var step_time:int;		var loaded_sounds:Number = 0;		var current_sound_percent:Number = 0;								var grid_top = 140; //location for the top of all the grid stuff		var grid_left = 320;				public function RandomSeedComposer(project_name, user_name) {			var loader:URLLoader = new URLLoader();			var requester:URLRequest = new URLRequest();				this.project_name = project_name;			this.user_name = user_name;			trace("un" + user_name);			trace("pn" + project_name);			project_info_location = 'http://rifff.co.uk/composer/projects/'+user_name+'/'+project_name+'/list.json';				requester.url=project_info_location;			loader.load(requester);			loader.addEventListener(Event.COMPLETE, decodeJSON);						//add the text field 			var myFormat:TextFormat = new TextFormat();     		myFormat.size=17;			myFormat.color = 0xff0000;   			loadStatus.defaultTextFormat = myFormat;			loadStatus.text = 'Not ready yet'; 			loadStatus.y = grid_top - 30; 			loadStatus.x = grid_left -320; 			loadStatus.width = 200; 			addChild(loadStatus);		}   				function decodeJSON(event:Event) {			jsonData =JSON.decode(event.target.data);			this.jsonData = jsonData;			this.number_of_steps = jsonData['banks'][0]['bank_options'][0]['sequence'].length;			var beats_per_second:Number = jsonData['project_info']['bpm']/60;			var seconds_per_beat:Number = 1/beats_per_second;						this.step_time = (seconds_per_beat * jsonData['project_info']['bpl'])*1000; 						calculateGrid.buildGrid(jsonData, grid_top, grid_left);			soundObjects.addEventListener("loaded", drawInterface);			soundObjects.addEventListener("all_files_loaded", active);			soundObjects.addEventListener("soundFileLoaded", soundFileLoaded);			soundObjects.addEventListener("percentIncrease", percentIncrease);						soundObjects.make(stage, calculateGrid.cumulatuive_y_offset, grid_top, grid_left, auditionContainer, project_name, user_name);			soundObjects.reloadBtn.addEventListener(MouseEvent.CLICK, reload);					}				function active(event) { 			trace('active');			score.generate(jsonData, selectSteps.grid, soundObjects.soundContainer, number_of_steps, step_time);			loadStatus.text = 'Ready';			var imageMcTween = new Tween(loadStatus,'alpha',None.easeNone,1,0,2,true); 		}				function drawInterface(obj) {			calculateGrid.addEventListener("changed", saveData);			globalSettings.addEventListener("changed", saveGlobal);			audioDropDown.addEventListener("changed", saveData);			modifyStructure.addEventListener("save_name", saveName);			modifyStructure.addEventListener("changed", saveData);			addControls.addEventListener("changed", saveData);			addControls.addEventListener("volume_changed", volumeChanged);			transport.addEventListener("randomise", randomise);						selectSteps.renderPlayingSteps(jsonData, calculateGrid.grid, stage, grid_top, grid_left);						transport.make(jsonData, volumeArray, score.score, selectSteps.grid, soundObjects.soundContainer, stage, monitorContainer, grid_top, grid_left, step_time);			audioDropDown.make(jsonData, stage, grid_top, grid_left, soundObjects.filelist);			modifyStructure.make(jsonData, stage, grid_top, grid_left);			addControls.make(jsonData, stage, volumeArray, grid_top, grid_left);			globalSettings.make(stage, jsonData);						stage.addChild(calculateGrid.grid_container);			stage.addChild(selectSteps.options_container);			stage.addChild(transport.scrubberContainer);			stage.addChild(monitorContainer);			stage.setChildIndex(transport.scrubberContainer, 0);			stage.setChildIndex(calculateGrid.grid_container, 1);			stage.setChildIndex(selectSteps.options_container, 2); 	  		}				function saveData(obj) {			this.number_of_steps = jsonData['banks'][0]['bank_options'][0]['sequence'].length;			var beats_per_second:Number = jsonData['project_info']['bpm']/60;			var seconds_per_beat:Number = 1/beats_per_second;						this.step_time = (seconds_per_beat * jsonData['project_info']['bpl'])*1000;						saveJson.save(jsonData, project_name, user_name);			score.generate(jsonData, selectSteps.grid, soundObjects.soundContainer, number_of_steps, step_time);			//transport.make(jsonData, volumeArray, score.score, selectSteps.grid, soundObjects.soundContainer, stage, monitorContainer, grid_top, grid_left, step_time);			calculateGrid.buildGrid(jsonData, grid_top, grid_left);			audioDropDown.make(jsonData, stage, grid_top, grid_left, soundObjects.filelist);			modifyStructure.make(jsonData, stage, grid_top, grid_left);			addControls.make(jsonData, stage, volumeArray, grid_top, grid_left);			globalSettings.make(stage, jsonData);			soundObjects.changeHeight(calculateGrid.cumulatuive_y_offset, grid_top, grid_left)		}				function saveGlobal(obj) {			saveJson.save(jsonData, project_name, user_name);			transport.current_step_no = 0;			transport.makePlayback(jsonData, volumeArray, score.score, transport.scrubberContainer, monitorContainer, soundObjects.soundContainer, grid_top, grid_left, step_time)					}				function randomise(obj) {			calculateGrid.buildGrid(jsonData, grid_top, grid_left);			processed_grid =selectSteps.renderPlayingSteps(jsonData, calculateGrid.grid, stage, grid_top, grid_left);     			score.generate(jsonData, selectSteps.grid, soundObjects.soundContainer, number_of_steps, step_time);		}				function reload(obj) {			soundObjects.make(stage, calculateGrid.cumulatuive_y_offset, grid_top, grid_left, auditionContainer, project_name, user_name);		}				function reloadDropDowns (event, parameters) { 		  	audioDropDown.make(jsonData, soundObjects.soundContainer, stage, grid_top, grid_left, soundObjects.filelist);		}				function saveName (event) {			saveJson.save(jsonData, project_name, user_name);		}				function volumeChanged(obj) {			var bank_index= 0;			for each (var bank:Object in jsonData['banks']) {			var bank_option_index= 0;			for each (var bank_option:Object in bank['bank_options']) {					if (jsonData['banks'][bank_index]['bank_options'][bank_option_index]['sound']) {						jsonData['banks'][bank_index]['bank_options'][bank_option_index]['sound'].soundTransform = volumeArray[bank_index][bank_option_index];					}					bank_option_index++;				}				bank_index++; 			}			saveJson.save(jsonData, project_name, user_name);		}    		function soundFileLoaded(event) {			loaded_sounds++;		}				function percentIncrease(event) {			this.current_sound_percent = soundObjects.current_sound_percent; 			var percent_fully_loaded = (100 / soundObjects.total_bank_options * loaded_sounds);			var percent_partially_loaded = (this.current_sound_percent/soundObjects.total_bank_options)  			var total = percent_fully_loaded + percent_partially_loaded;			total = total.toFixed(0);			loadStatus.text = 'Not ready yet... ' + total +"%";					}					}}