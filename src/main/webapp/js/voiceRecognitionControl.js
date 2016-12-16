
function voiceOperation(){
	take_voice_sample(true);
}

function suggestVideo(){
	videoIdToPlay = Math.floor((Math.random() * 7));
	var textToShow = "Want to watch "+ videos[videoIdToPlay] +"?";
	playVideo(videoMap[videoIdToPlay]);
	showDialogue(textToShow);
	bobSpeak(textToShow);
	var noSpeakCheck=setInterval(function(){
		if (!responsiveVoice.isPlaying()){//alert("||||||||");
			clearInterval(noSpeakCheck); 
			expectSpeechResponse = 1;
			speechLoop = setInterval(function(){
				if(voiceBusyFlag==0){
					take_voice_sample(true);
				} 
			},speechLoopInterval);
		}
	}, 100);
}

function evaluateVoiceResult(voiceResult){
	//alert("voice:"+voiceResult);
	if(typeof voiceResult == 'undefined' || voiceResult == '' || voiceBusyFlag == 1) return;
	var textToShow = "";
	if(voiceResult == -1) {
		//error handling 
		if (expectSpeechResponse == 0) return;
		if (status == "suggestion" || status == "newUser"){
			setTimeout(function(){
				textToShow="Sorry, could you please say that again?";
				showDialogue(textToShow);
			}, 2000);
			//responsiveVoice.speak(textToShow);
		}
		return;
	} 
	
	var array = JSON.parse(voiceResult);
	var obj = array[0];
	if (typeof obj == 'undefined' || !('display' in obj)) return;
	
	if (status == "standBy"){
		if (obj.display.toLowerCase().includes("video") ||
			obj.display.toLowerCase().includes("show")){
			voiceBusyFlag = 1;
			status = 'suggestion';
			suggestVideo();
			voiceBusyFlag = 0;
			return;
		}
	}
	
	if (status == "suggestion"){
		if (obj.display.toLowerCase().includes("yes") ||
			obj.display.toLowerCase().includes("yea") ||
			obj.display.toLowerCase().includes("ok") ||
			obj.display.toLowerCase().includes("okay") ||
			obj.display.toLowerCase().includes("sure") ||
			obj.display.toLowerCase().includes("alright") ||
			obj.display.toLowerCase().includes("why not")){
			voiceBusyFlag = 1;
			setPlayerFullScreen();
			$('#dialogBox').hide();
			$('#dialog').html( "" );
			status = 'playing';
			voiceBusyFlag = 0;
		} else if (obj.display.toLowerCase().includes("no") ||
				   obj.display.toLowerCase().includes("null")) {
			voiceBusyFlag = 1;
			stopVideo();
			clearInterval(speechLoop);
			voiceBusyFlag = 0;
			setTimeout(function(){
				suggestVideo();
			}, 2500);
		} else if (obj.display.toLowerCase().includes("dismiss")) {
			reset();
		}
		return;
	}
	
	if (status == "playing"){
		if (obj.display.toLowerCase().includes("no") ||
			obj.display.toLowerCase().includes("stop") ||
			obj.display.toLowerCase().includes("null")){
			voiceBusyFlag = 1;
			status = 'suggestion';
			stopVideo();
			clearInterval(speechLoop);
			cancelPlayerFullScreen();
			voiceBusyFlag = 0;
			setTimeout(function(){
				suggestVideo();
			}, 2500);
		} else if (obj.display.toLowerCase().includes("dismiss")) {
			reset();
		}
		return;
	}
	
	if (status == "newUser"){
		voiceBusyFlag = 1;
		$('#name').val(obj.display);
		showDialogue(obj.display+", can you do me a favor?")
		responsiveVoice.speak(obj.display+", can you do me a favor?", "UK English Male"); 
		var sId1 = setInterval(function(){
			if(!responsiveVoice.isPlaying()){
				takeShotAndRestore(); 
				setTimeout(function(){
					clearInterval(sId1);
					showDialogue("Can you turn to your left?")
					responsiveVoice.speak("Can you turn to your left?", "UK English Male"); 
					var sId2 = setInterval(function(){
						if(!responsiveVoice.isPlaying()){
							takeShotAndRestore(); 
							setTimeout(function(){
								clearInterval(sId2);
								showDialogue("That's great. Thanks. Can you turn to your right?")
								responsiveVoice.speak("That's great. Thanks. Can you turn to your right?", "UK English Male"); 
								
								var sId3 = setInterval(function(){
									if(!responsiveVoice.isPlaying()){
										showDialogue("Processing...")
										takeShotAndRestore(); 
										clearInterval(sId3);
										setTimeout(function(){
											adduser(); 
											setTimeout(function(){
												showDialogue("Perfect. Thank you.")
												responsiveVoice.speak("Perfect. Thank you.", "UK English Male");
												setTimeout(function(){
													reset();
												}, 2000);
											}, 20000);
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
		return;
	} 

}

var client;
var request;

function getMode() {
    return Microsoft.CognitiveServices.SpeechRecognition.SpeechRecognitionMode.shortPhrase;
}

var mode = getMode();
microphoneClient = Microsoft.CognitiveServices.SpeechRecognition.SpeechRecognitionServiceFactory.createMicrophoneClient(
                mode,
                "en-us",
                'e0ee7225240c464ab33a155b8267a703');


function take_voice_sample(useMic) {
	
	if(useMic){
		microphoneClient.startMicAndRecognition();
	    setTimeout(function () {
	    	microphoneClient.endMicAndRecognition();
	    }, speechLength);
	    
	    microphoneClient.onPartialResponseReceived = function (data) {
	        setText(data);
	    }

	    microphoneClient.onFinalResponseReceived = function (data) {
	        setText(JSON.stringify(data));
	    }

	    microphoneClient.onIntentReceived = function (data) {
	        setText(data);
	    };
	    
	    microphoneClient.onError = function (data) {
	        setText(data);
	    };
	} else {
		client = Microsoft.CognitiveServices.SpeechRecognition.SpeechRecognitionServiceFactory.createDataClient(
			      mode,
			      "en-us",
			      'e0ee7225240c464ab33a155b8267a703');
			request = new XMLHttpRequest();
		
	    request.open(
	        'GET',
	        (mode == Microsoft.CognitiveServices.SpeechRecognition.SpeechRecognitionMode.shortPhrase) ? "audioFile?fileName=aa" : "batman.wav",
	        true);
	    request.responseType = 'arraybuffer';
	    request.onload = function () {
	        if (request.status !== 200) {
	            setText("unable to receive audio file");
	        } else {
	            client.sendAudio(request.response, request.response.length);
	        }
	    };

	    request.send();
	    
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
}

function setText(text) {
	evaluateVoiceResult(text);
	$('#speechResult').html( text );
}