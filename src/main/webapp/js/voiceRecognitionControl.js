var client;
var request;
var voiceResult="";

function voiceOperation(){
	take_voice_sample();
}

function evaluateVoiceResult(){
	//alert("voice:"+voiceResult);
	if(typeof voiceResult == 'undefined' || voiceResult == '' || voiceBusyFlag==1) return;
	var textToShow = "";
	if(voiceResult == -1) {
		voiceBusyFlag = 1;
		//error handling 
		if (status == "suggestion" || status == "newUser"){
			textToShow="Sorry, could you please say again?";
			showDialogue(textToShow);
			//responsiveVoice.speak(textToShow);
		}
		voiceBusyFlag = 0;
		return;
	} 
	
	var array = JSON.parse(voiceResult);
	var obj = array[0];
	if (status == "suggestion"){
		voiceBusyFlag = 1;
		if (typeof obj != 'undefined' && 'display' in obj){
			if (obj.display.toLowerCase().includes("yes") ||
				obj.display.toLowerCase().includes("yea") ||
				obj.display.toLowerCase().includes("ok") ||
				obj.display.toLowerCase().includes("sure") ||
				obj.display.toLowerCase().includes("alright") ||
				obj.display.toLowerCase().includes("why not")){
				$('#player').show();
				playVideo(videoMap[videoIdToPlay]);
				status = 'playing';
				//voiceFinishCallBack();
			} else if (obj.display.toLowerCase().includes("no")) {
				//alert(obj.display+"|||")
				faceResult="";
				voiceFinishCallBack();
			}
		} else {
			textToShow="Sorry, could you please say again?";
			showDialogue(textToShow);
			//responsiveVoice.speak(textToShow);
		}
		voiceBusyFlag = 0;
		return;
	}
	
	if (status == "playing"){
		voiceBusyFlag = 1;
		if (typeof obj != 'undefined' && 'display' in obj){
			if (obj.display.toLowerCase().includes("no") ||
				obj.display.toLowerCase().includes("stop") ){
				faceResult="";
				voiceFinishCallBack();
				stopVideo();
				//$('#player').hide();
			} 
		}
		voiceBusyFlag = 0;
		return;
	}
	
	if (status == "newUser"){
		voiceBusyFlag = 1;
		if (typeof obj != 'undefined' && 'display' in obj){
			$('#name').val(obj.display);
			showDialogue(obj.display+", would you please look to the camera?")
			responsiveVoice.speak(obj.display+", would you please look to the camera?"); 
			var sId1 = setInterval(function(){
				if(!responsiveVoice.isPlaying()){
					takeShotAndRestore(); 
					setTimeout(function(){
						clearInterval(sId1);
						showDialogue(obj.display+", would you please turn your head to the left?")
						responsiveVoice.speak(obj.display+", would you please turn your head to the left?"); 
						var sId2 = setInterval(function(){
							if(!responsiveVoice.isPlaying()){
								takeShotAndRestore(); 
								setTimeout(function(){
									clearInterval(sId2);
									showDialogue(obj.display+", would you please turn your head to the right?")
									responsiveVoice.speak(obj.display+", would you please turn your head to the right?"); 
									var sId3 = setInterval(function(){
										if(!responsiveVoice.isPlaying()){
											takeShotAndRestore(); 
											setTimeout(function(){
												clearInterval(sId3);
												adduser(); 
												showDialogue("We have set up your face data profile. Thank you!")
												responsiveVoice.speak("We have set up your face data profile. Thank you!");
												setTimeout(function(){
													voiceBusyFlag = 0;
													voiceFinishCallBack();
												}, 4000);
											}, 1050);
										} 
									},1200);
								}, 1050);
							} 
						},1200); 
						
					}, 1050);
				} 
			},1200);
			/* responsiveVoice.speak(obj.display+", would you please turn your head to the left?"); 
			var sId2 = setInterval(function(){
				if(!responsiveVoice.isPlaying()){
					takeShotAndRestore(); 
					setTimeout(function(){
						clearInterval(sId2);
					}, 1050);
				} 
			},1200);
			responsiveVoice.speak(obj.display+", would you please turn your head to the right?"); 
			var sId3 = setInterval(function(){
				if(!responsiveVoice.isPlaying()){
					takeShotAndRestore(); 
					setTimeout(function(){
						clearInterval(sId3);
					}, 1050);
				} 
			},1200); */
		} else {
			voiceBusyFlag = 0;
			voiceFinishCallBack();
		}
		return;
	} 

}

function getMode() {
    return Microsoft.CognitiveServices.SpeechRecognition.SpeechRecognitionMode.shortPhrase;
}

var mode = getMode();
client = Microsoft.CognitiveServices.SpeechRecognition.SpeechRecognitionServiceFactory.createMicrophoneClient(
                mode,
                "en-us",
                'e0ee7225240c464ab33a155b8267a703');

function take_voice_sample() {
	 
    client.startMicAndRecognition();
    setTimeout(function () {
        client.endMicAndRecognition();
    }, 3000);

    client.onPartialResponseReceived = function (data) {
        setText(data);
    }

    client.onFinalResponseReceived = function (data) {
        setText(JSON.stringify(data));
    }

    client.onIntentReceived = function (data) {
        setText(data);
    };
    
    client.onError = function (data) {
        setText(data);
    };

}

function setText(text) {
	voiceResult=text;
	evaluateVoiceResult();
}