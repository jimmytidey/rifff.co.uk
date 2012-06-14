﻿package {  import com.adobe.serialization.json.JSON;  import flash.net.URLRequest;  import flash.net.URLLoader;  import flash.net.URLVariables;  import flash.net.URLRequestMethod;  import flash.events.*;  import flash.display.*;   import flash.text.*;       //this object as a container for everything. Has to extend movieclip to inherit the stage obejct  public class RandomSeedPlayer extends MovieClip {  	      var _stage:Stage; // have to define this to pass the stage object around, how fucking stupid is that?        //holding all the date from reading the json    var jsonData:Object; //holds all the json data    var sounds:Array; // array for sound objects for each bank option     var filelist:Array;     public var volumeArray:Array = new Array();    var samples;    var allSounds;    var loader:URLLoader = new URLLoader();    var requester:URLRequest = new URLRequest();        //control objects     var selectSteps:SelectSteps = new SelectSteps();    var calculateGrid:CalculateGrid = new CalculateGrid();    var soundObjects:SoundObjects = new SoundObjects();    var audioDropDown:AudioDropDown = new AudioDropDown();     var modifyStructure:ModifyStructure = new ModifyStructure();     var addControls:AddControls= new AddControls();    var globalSettings:GlobalSettings = new GlobalSettings();    var playBackObjects:PlayBackObjects = new PlayBackObjects();	var drawPattern:DrawPattern = new DrawPattern();    var transport:pbTransport = new pbTransport();    var render:Render = new Render();    var saveJson:SaveJson = new SaveJson();    var fileMC:MovieClip  = new MovieClip();	var fake:MovieClip  = new MovieClip();    var options_container:MovieClip = new MovieClip;    var parameters:Array = new Array();    var debug_state:String; 	var project_name:String;	var user_name:String;	var main_percent:Number = 1;	var statusTextField:TextField  = new TextField();        var grid_top = 140; //location for the top of all the grid stuff    var grid_left = 320;    public var soundContainer:Object = new Object();    public function RandomSeedPlayer(stage:Stage):void {      _stage = stage;    }        public function init() {      while (_stage.numChildren > 0) {_stage.removeChildAt(_stage.numChildren-1);} //clear the stage       loadJSON();    }    function loadJSON() {      var loadContext:LoadContext= new LoadContext();      addChild(loadContext);       project_info_location = 'http://rifff.co.uk/composer/projects/'+loadContext.userName()+'/'+loadContext.projectName()+'/list.json';	  debug_state = loadContext.debug(); 	  project_name = loadContext.projectName();	  user_name = loadContext.userName();      requester.url=project_info_location;      loader.load(requester);      loader.addEventListener(Event.COMPLETE, decodeJSON);      }           function decodeJSON(event:Event) {      jsonData =JSON.decode(loader.data);      this.jsonData = jsonData;      calculateGrid.addEventListener("done", makeSoundObjects);      calculateGrid.buildGrid(jsonData, grid_top, grid_left);    }        function makeSoundObjects(obj) {		parameters['sounds'] = soundObjects.soundContainer;		soundObjects.addEventListener("loaded", addArguments(drawInterface, [parameters]));		soundObjects.make(fake, calculateGrid.cumulatuive_y_offset, grid_top, grid_left, fileMC, debug_state, project_name, user_name);		soundObjects.addEventListener("file_loaded", percentUpdate);		var myFormat:TextFormat = new TextFormat();		myFormat.size=20;		statusTextField.defaultTextFormat = myFormat;		statusTextField.x = 240; 		statusTextField.y = 290	    _stage.addChild(statusTextField);	}    		function percentUpdate(event) { 		main_percent += 1; 		var percent_loaded = (100 / soundObjects.filelist.length * main_percent);		percent_loaded = percent_loaded.toFixed(0);		statusTextField.text = percent_loaded +"%";		if (percent_loaded == 100) { 			trace("finished" + transport.playBack);			drawPattern.render(jsonData, calculateGrid.grid, soundContainer, transport.playBack.step_time);			_stage.addChild(drawPattern.patternContainer);		}	}        function drawInterface(event, parameters) {      transport.addEventListener("randomise", randomise);      processed_grid = selectSteps.renderPlayingSteps(jsonData, calculateGrid.grid, fake, grid_top, grid_left);      transport.makeTransport(jsonData, volumeArray, processed_grid, parameters['sounds'],  _stage, fake, grid_top, 0);      samples = playBackObjects.make(jsonData);        addControls.make(jsonData, fake, volumeArray, grid_top, grid_left);      allSounds = parameters['sounds'];	  _stage.addChild(transport.scrubberContainer);      _stage.setChildIndex(transport.scrubberContainer, 0); 	      }    function randomise(obj) {      	trace('randomise'); 		while (monitorContainer.numChildren > 0) {			monitorContainer.removeChildAt(monitorContainer.numChildren-1);		}       	calculateGrid.removeEventListener("done", makeSoundObjects);      	calculateGrid.buildGrid(jsonData, grid_top, grid_left);      	processed_grid =selectSteps.renderPlayingSteps(jsonData, calculateGrid.grid, fake, grid_top, grid_left);           	transport.makeTransport(jsonData, volumeArray, processed_grid, parameters['sounds'], _stage, monitorContainer,  grid_top, grid_left);              }                //some weird utility function     function addArguments(method:Function, additionalArguments:Array):Function {      return function(event:Event):void {method.apply(null, [event].concat(additionalArguments));}          }          }}