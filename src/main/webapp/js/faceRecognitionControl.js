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