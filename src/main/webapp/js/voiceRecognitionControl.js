
function voiceOperation(){
	take_voice_sample(true);
}

function searchVideo(){
	var textToShow = "Please say the key word of the video.";
	showDialogue(textToShow);
	bobSpeak(textToShow);
	var noSpeakCheck=setInterval(function(){
		if (!responsiveVoice.isPlaying()){//alert("|||");
			clearInterval(noSpeakCheck); 
			expectSpeechResponse = 1;
			var speechLoopInterval = 3300;
			var speechLength = 3050;
			take_voice_sample(true);
			speechLoop = setInterval(function(){
				if(status == "search" || status == "search playing"){
					take_voice_sample(true);
				} 
			},speechLoopInterval);
		}
	}, 100);
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
			take_voice_sample(true);//set interval will wait, need to execute once immediately, need to deal with one extra outside loop
			speechLoop = setInterval(function(){//alert("||||||||");
				if(status == "suggestion" || status == "playing"){
					take_voice_sample(true);
				} 
			},speechLoopInterval);
		}
	}, 100);
}

function evaluateVoiceResult(voiceResult){
	//alert("voice:"+voiceResult);
	if (typeof voiceResult == 'undefined' || voiceResult == '' || voiceBusyFlag == 1) return;
	var textToShow = "";
	if(voiceResult == -1 && expectSpeechResponse == 1) {
		//error handling 
		if (status == "suggestion" || status == "newUser"){
			textToShow="Sorry, could you please say that again?";
			showDialogue(textToShow);
		} else if (status == "search"){
			textToShow="Please say the key word of the video.";
			showDialogue(textToShow);
		} 
		return;
	} 
	
	var array = JSON.parse(voiceResult);
	var obj = array[0];
	if (typeof obj == 'undefined' || !('display' in obj)) return;
	
	if (status == "standBy"){
		if (obj.display.toLowerCase().includes("make") ||
			obj.display.toLowerCase().includes("suggest") ||
			obj.display.toLowerCase().includes("make suggestion")) {
			//status change already block the new loop, but still modify voicebusyflag in order to prevent duplicate execution
			voiceBusyFlag = 1;
			status = 'suggestion';
			suggestVideo();
			voiceBusyFlag = 0;
			return;
		} else if (obj.display.toLowerCase().includes("play") ||
				   obj.display.toLowerCase().includes("video") ||
				   obj.display.toLowerCase().includes("play video")) {
			voiceBusyFlag = 1;
			status = 'search';
			setTimeout(function(){//this is an open question and that's why we need to wait a bit
				searchVideo();
				voiceBusyFlag = 0;
			}, speechLoopInterval/2);
			return;
		}
	}
	
	if (status == "search" && expectSpeechResponse == 1){
		voiceBusyFlag = 1;
		$('#youtubeSearchQuery').val( obj.display );
		if (obj.display.toLowerCase().includes("dismiss") ||
			obj.display.toLowerCase().includes("stop")) {
			//alert("|||||||");
			reset();
		} else {
			var request = search();
			  request.execute(function(response) {
			    var str = JSON.stringify(response.result);
			    var searchResult = JSON.parse(str);
				var videoId = searchResult.items[0].id.videoId; //alert(videoId);
				if (typeof videoId == 'undefined' || videoId == "") {
					textToShow="Please say the key word of the video.";
					showDialogue(textToShow);
					voiceBusyFlag = 0;
				} else {
					playVideo(videoId);
					setPlayerFullScreen();
					$('#dialogBox').hide();
					$('#dialog').html( "" );
					status = 'search playing';
					setTimeout(function(){//wait a bit to prevent cycles before status change
						voiceBusyFlag = 0;
					}, speechLoopInterval);
				}
			  });
		}
		return;
	}
	
	if (status == "suggestion" && expectSpeechResponse == 1){
		if (obj.display.toLowerCase().includes("yes") ||
			obj.display.toLowerCase().includes("yea") ||
			obj.display.toLowerCase().includes("ok") ||
			obj.display.toLowerCase().includes("okay") ||
			obj.display.toLowerCase().includes("sure") ||
			obj.display.toLowerCase().includes("alright") ||
			obj.display.toLowerCase().includes("play") ||
			obj.display.toLowerCase().includes("why not")){
			voiceBusyFlag = 1;
			setPlayerFullScreen();
			$('#dialogBox').hide();
			$('#dialog').html( "" );
			status = 'playing';
			setTimeout(function(){//wait a bit to prevent cycles before status change
				voiceBusyFlag = 0;
			}, speechLoopInterval/2);
		} else if (obj.display.toLowerCase().includes("no") ||
				   obj.display.toLowerCase().includes("no thanks") ||
				   obj.display.toLowerCase().includes("skip") ||
				   obj.display.toLowerCase().includes("not now") ||
				   obj.display.toLowerCase().includes("null")) {
			voiceBusyFlag = 1;
			stopVideo();
			clearInterval(speechLoop);
			expectSpeechResponse = 0;//prevent previous cycle causing 'say that again'
			setTimeout(function(){//wait a bit to prevent cycles before status change
				voiceBusyFlag = 0;
				suggestVideo();
			}, speechLoopInterval/2);
		} else if (obj.display.toLowerCase().includes("dismiss") ||
				   obj.display.toLowerCase().includes("stop")) {
			reset();
		}
		return;
	}
	
	if (status == "search playing" && expectSpeechResponse == 1){
		if (obj.display.toLowerCase().includes("dismiss") ||
			obj.display.toLowerCase().includes("stop")) {
			//alert("|||||||");
			reset();
		} else if (obj.display.toLowerCase().includes("next") ||
				   obj.display.toLowerCase().includes("skip")) {
			voiceBusyFlag = 1;
			stopVideo();
			clearInterval(speechLoop);
			cancelPlayerFullScreen();
			expectSpeechResponse = 0;//prevent previous cycle causing 'say that again'
			setTimeout(function(){//wait a bit to prevent cycles before status change
				voiceBusyFlag = 0;
				status = 'search';
				searchVideo();
			}, speechLoopInterval/2);
		}
		return;
	}
	
	if (status == "playing" && expectSpeechResponse == 1){
		if (obj.display.toLowerCase().includes("next") ||
			obj.display.toLowerCase().includes("skip") ||
			obj.display.toLowerCase().includes("no") ||
			obj.display.toLowerCase().includes("null")) {
			voiceBusyFlag = 1;
			stopVideo();
			clearInterval(speechLoop);
			cancelPlayerFullScreen();
			expectSpeechResponse = 0;//prevent previous cycle causing 'say that again'
			setTimeout(function(){//wait a bit to prevent cycles before status change
				voiceBusyFlag = 0;
				status = 'suggestion';
				suggestVideo();
			}, speechLoopInterval/2);
		} else if (obj.display.toLowerCase().includes("dismiss") ||
				   obj.display.toLowerCase().includes("stop")) {
			reset();
		}
		return;
	}
	
	if (status == "newUser" && expectSpeechResponse == 1) {
		voiceBusyFlag = 1;
		var userName = obj.display.replace(/\./g,"");
		$('#name').val(userName);
		showDialogue(userName+", can you do me a favor?")
		responsiveVoice.speak(userName+", can you do me a favor?", "UK English Male"); 
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
											}, 22000);
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
	if (text == -1){
		//$('#speechResult').html( text );
	} else {
		var array = JSON.parse(text);
		var obj = array[0];
		//$('#speechResult').html( obj.display );
		
	}
	evaluateVoiceResult(text);
}