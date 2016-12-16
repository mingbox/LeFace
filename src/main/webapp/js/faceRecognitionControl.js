function greeting(ppl){
	var textToShow = "Hi "+ppl+", let me know if you need anything.";
	showDialogue(textToShow);
	bobSpeak(textToShow);
}

function dealNewUser(){
	var textToShow = "Hello";
	showDialogue(textToShow);
	bobSpeak(textToShow);
	textToShow = "I'm Bob";
	setTimeout(function(){
		showDialogue(textToShow);
		bobSpeak(textToShow);
		textToShow = "What's your name?";
		setTimeout(function(){
			showDialogue(textToShow);
			bobSpeak(textToShow);
			setTimeout(function(){//alert("||||||||");
				expectSpeechResponse = 1;
				speechLength = 3500;
				take_voice_sample(true);
				speechLoopInterval = 3800;
				speechLoop = setInterval(function(){
					if(!responsiveVoice.isPlaying() && voiceBusyFlag==0){
						take_voice_sample(true);
					} 
				},speechLoopInterval);
			}, 1100);
		}, 2500);
	}, 2500);
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
	
	if (arrayLength==0){
		reset();
	}
	
	for (var i = 0; i < arrayLength; i++) {
	    var ppl = newppl[i];
	    if (oldppl.indexOf(ppl) == -1 && ppl != "?" && ppl != "") {
	    	if (status == "standBy"){
	    		greeting(ppl);
	    	}
	    	return;
	    } 
	}
	
	if (newppl == '?') {
		if (status == "standBy"){
			faceBusyFlag = 1;
			status = 'newUser';
	    	dealNewUser();
		}
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