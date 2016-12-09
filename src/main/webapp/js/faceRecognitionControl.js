
function dealNewUser(){
	var textToShow = "Hello";
	showDialogue(textToShow);
	responsiveVoice.speak(textToShow);
	textToShow = "I'm Bob";
	setTimeout(function(){
		showDialogue(textToShow);
		responsiveVoice.speak(textToShow);
		textToShow = "What’s your name?";
		setTimeout(function(){
			showDialogue(textToShow);
			responsiveVoice.speak(textToShow);
			setTimeout(function(){
				status = 'newUser';
				speechLoop = setInterval(function(){
					if(!responsiveVoice.isPlaying() && voiceBusyFlag==0){
						take_voice_sample();
					} 
				},3500);
			}, 2000);
		}, 2000);
	}, 2000);
}

function dealKnownUser(name){
	var textToShow = "Hi "+name;
	videoIdToPlay = Math.floor((Math.random() * 8));
	
	showDialogue(textToShow);
	responsiveVoice.speak(textToShow);
	textToShow = "Want to watch "+ videos[videoIdToPlay] +"?";
	setTimeout(function(){
		showDialogue(textToShow);
		responsiveVoice.speak(textToShow);
		setTimeout(function(){
			status = 'suggestion';
			speechLoop = setInterval(function(){
				if(!responsiveVoice.isPlaying() && voiceBusyFlag==0){
					take_voice_sample();
				} 
			},3500);
		}, 2000);
	}, 2000);
}

function voiceFinishCallBack(){
	faceBusyFlag = 0;
	status = 'standBy';
	$('#dialogBox').hide();
	$('#dialog').html( "" );
	clearInterval(speechLoop);
}

function faceOperation(){
	take_snapshot();
}

function evaluateFaceResult(){
	if(faceBusyFlag == 1) return;//prevent check lag
	//alert("face:"+faceResult);
	var oldppl = oldFaceResult.split(',');
	var newppl = faceResult.split(',');
	var arrayLength = newppl.length;
	for (var i = 0; i < arrayLength; i++) {
	    var ppl = newppl[i];
	    if (oldppl.indexOf(ppl) == -1 && ppl != "?") {
	    	faceBusyFlag = 1;//won't set back until the callback function is executed
	    	//check status first and then do the following
	    	if (status == "standBy"){
		    	//deal with new recognized ppl, if he say no, remove him from array
	    		dealKnownUser(ppl);
		    	//need to think about more than 1 
	    	}
	    	return;
	    } 
	}
	
	if (newppl == '?') {
		if(faceBusyFlag == 1) return;//prevent check lag
    	faceBusyFlag = 1;
    	status = 'newUser';
    	//deal with new commer
    	dealNewUser();
    	return;
	} 
}

function takeShotAndRestore(){
	for (i = 0; i < 8; i++) { 
		Webcam.snap( function(data_uri) {
			$('#img').val($('#img').val()+data_uri+"|");
			//alert($('#img').val());
			setTimeout(function(){}, 125);
		} );
	}
}

function adduser() {
	//$('#adduserform').submit();
	var $form = $('#adduserform'),
        formData = new FormData(),
        params   = $form.serializeArray()
        
    $.each(params, function(i, val) {
        formData.append(val.name, val.value);
    });
	$.ajax({
        url: $form.attr('action'),
        data: formData,
        cache: false,
        contentType: false,
        processData: false,
        type: 'POST',
        success: function(result) {
        	$('#name').val("");
        }
    });
	$('#img').val("");
}


Webcam.set({
	// live preview size
	width: 480,
	height: 360,
	
	// device capture size
	dest_width: 640,
	dest_height: 480,
	
	// final cropped size
	crop_width: 480,
	crop_height: 480,
	
	// format and quality
	image_format: 'jpeg',
	jpeg_quality: 90
});

Webcam.attach( '#my_camera' );

function take_snapshot() {
	Webcam.snap( function(data_uri) {
		var formData = {};  
		formData['img'] = data_uri;
		$.post('http://localhost:8080/leface/identify', formData).done(function (data) {
			if (!data.includes("error")){
				oldFaceResult=faceResult;
				faceResult=data;
			}
			evaluateFaceResult();
	    });
	} );
}