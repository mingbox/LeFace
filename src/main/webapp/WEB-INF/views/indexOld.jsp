<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html lang="en">
<head>
	<title>LeFace by LeEco</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<link rel="stylesheet" href="<c:url value='/css/main.css' />" />
	<style type="text/css">
		/* form > input { margin-right: 15px; }
		#results { margin:20px auto; padding:10px; border:1px solid; background:#ccc; width: 500px;}
		#middle { margin:20px auto; width: 30%;} */
		#my_camera { margin:auto; display: none;}
		body {
			position: absolute;
			background-image: url("<c:url value='/images/x8vJ9Zc.jpeg' />"); 
			background-repeat: no-repeat;
			background-size: cover;
			/* width: 100%;
			height: 100%; */
		}
		#player { position: fixed; top: 0;}
		#dialogBox { background: rgba(0, 0, 0, .6); position: fixed; bottom: 0; height: 50px; width: 100%; display: none;}
		#dialog {  margin-top: 10px; margin-left: 20px; font-size: 1.5em; color: white; }
	</style>
</head>
<body id="top">
	<%-- <header id="header">
		<div class="inner">
			<a href="#" class="image avatar"><img src="<c:url value='/images/LeEco.png' />" alt="" /></a>
			<h1><strong>LeEco</strong> face recognition<br />
			by open eco San Jose Team.</h1>
		</div>
	</header> --%>
	<div id="main">
		<section id="one">
			<!-- <header class="major">
				<h2>LeEco TV face recognition interface</h2>
			</header> -->
			<div id="my_camera"></div>
		</section>

		<section id="three">
			<!-- <h2>Set up your profile</h2>
			<p>Please enter your information and click Start button to begin recording your image.</p> -->
			<div class="row">
				<div class="8u 12u$(small)">
					<form name="adduserform" id="adduserform" action="<c:url value="/detect" />" method="post">
						<div class="row uniform 50%">
							<input type="hidden" name="img" id="img" value="" />
							<div class="12u$"><input type="hidden" name="name" id="name" placeholder="Name" /></div>
						</div>
						<br/>
						<!-- <ul class="actions">
							<li><input type=button value="Start" onClick="adduser()"/></li>
						</ul> -->
					</form>		
				</div>
			</div>
		</section>
	</div>
	<div id="player"></div><!-- youtube video block -->
	<div id="dialogBox">
		<p id="dialog"></p>
	</div>
	<!-- <footer id="footer">
		<div class="inner">
			<ul class="icons">
				<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
				<li><a href="#" class="icon fa-github"><span class="label">Github</span></a></li>
				<li><a href="#" class="icon fa-dribbble"><span class="label">Dribbble</span></a></li>
				<li><a href="#" class="icon fa-envelope-o"><span class="label">Email</span></a></li>
			</ul>
			<ul class="copyright">
				<li>&copy; LeEco</li>
			</ul>
		</div>
	</footer> -->

	<script src="<c:url value='/js/jquery.min.js' />"></script>
	<script src="<c:url value='/js/jquery.poptrox.min.js' />"></script>
	<script src="<c:url value='/js/skel.min.js' />"></script>
	<script src="<c:url value='/js/util.js' />"></script>
	<script src="<c:url value='/js/main.js' />"></script>
	
	<script type="text/javascript" src="<c:url value='/js/youtubePlayer.js' />"></script>
	
	<script type="text/javascript" src="<c:url value='/js/webcam.js' />"></script>
	<script type="text/javascript" src="<c:url value='/js/faceRecognitionControl.js' />"></script>
	
	<script src="http://code.responsivevoice.org/responsivevoice.js"></script>	
	<script src="<c:url value='/js/speech.1.0.0.js' />" type="text/javascript"></script>
	<script type="text/javascript" src="<c:url value='/js/voiceRecognitionControl.js' />"></script>
	
	<!-- Code to handle taking the snapshot and displaying it locally -->
	<script language="JavaScript">
		var newUserOps = "";
		var watchRecommend = "";
		var watchingNow= "";
		var busyFlag = "";
		var speechLoop;
		var proposeNew;
		
		/* [{"lexical":"sing more","display":"Sing more.","inverseNormalization":null,"maskedInverseNormalization":null,
			"transcript":"Sing more.","confidence":0.5696079}] */
		/* voice return logic comes to here */
		function setText(text) {
			var array = JSON.parse(text);
			var obj = array[0];
			if (newUserOps == 1){
				if (typeof obj != 'undefined' && 'display' in obj){
					$('#name').val(obj.display);
					responsiveVoice.speak(obj.display+", would you please look to the camera?"); 
					var sId1 = setInterval(function(){
						if(!responsiveVoice.isPlaying()){
							takeShotAndRestore(); 
							setTimeout(function(){
								clearInterval(sId1);
							
								responsiveVoice.speak(obj.display+", would you please turn your head to the left?"); 
								var sId2 = setInterval(function(){
									if(!responsiveVoice.isPlaying()){
										takeShotAndRestore(); 
										setTimeout(function(){
											clearInterval(sId2);
											responsiveVoice.speak(obj.display+", would you please turn your head to the right?"); 
											var sId3 = setInterval(function(){
												if(!responsiveVoice.isPlaying()){
													takeShotAndRestore(); 
													setTimeout(function(){
														clearInterval(sId3);
														adduser(); 
														responsiveVoice.speak("We have set up your face data profile. Thank you!");
														newUserOps ="";
														busyFlag = "";
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
					newUserOps ="";
					busyFlag = "";
				}
			} else if (watchRecommend != ""){
				if (typeof obj != 'undefined' && 'display' in obj){
					if (text.includes("Yes")){
						//alert("Start to play"+ watchRecommend +".");
						playVideo('blMxB09L5q0');
						speechLoop = setInterval(function(){
							if(!responsiveVoice.isPlaying() && busyFlag == "") {
								take_sample();
							}
						}, 5100);	
						proposeNew = "";
					} else {
						proposeNew = 1;
						//alert("Don't play"+ watchRecommend +".");
					}
					watchRecommend = "";
					busyFlag = "";
				} else {
					watchRecommend ="";
					busyFlag = "";
				}
				
			} else if (watchingNow != ""){
				if (typeof obj != 'undefined' && 'display' in obj){
					if (text.includes("Stop")){
						stopVideo();
						$('#player').hide();
						clearInterval(speechLoop);
					} 
				} 
			}
			
		}

        /* function startSpeechLoop() {
			window.setInterval(function(){
				if(!responsiveVoice.isPlaying() && busyFlag == "") {
					take_sample();
				}
			}, 5300);	
		}  */
        //startSpeechLoop();
	
		var showText = function (target, message, index, interval) {   
		  if (index < message.length) {
		    $(target).append(message[index++]);
		    setTimeout(function () { showText(target, message, index, interval); }, interval);
		  }
		}
		function showDialogue(text){
			$('#dialogBox').show();
			$('#dialog').html( "" );
			showText("#dialog", text, 0, 20);   
		}
		
		/* image recognition return logic comes to here */
		function take_snapshot() {
			// take snapshot and get image data
			if(!responsiveVoice.isPlaying() && busyFlag == "") {
				busyFlag = 1;
				Webcam.snap( function(data_uri) {
					var formData = {};  
					formData['img'] = data_uri;
					$.post('http://localhost:8080/leface/identify', formData).done(function (data) {
						if(watchingNow == "" && data != ""){
							
							if (data.includes("new comer")){
								newUserOps = 1;
							}
							if (data.includes("Would you like to watch")){
								watchRecommend = "CNN";
								data+="CNN";
							}
							showDialogue(data);
							responsiveVoice.speak(data);
							
							var timerId = setInterval(function(){
								if(!responsiveVoice.isPlaying()){
									take_sample();
									clearInterval(timerId);
								} 
							},200);
							proposeNew = "";
						} else if(watchingNow == "" && proposeNew != ""){
							data = "Would you like to watch";
							watchRecommend = "CNN";
							data+="CNN";
							showDialogue(data);
							responsiveVoice.speak(data);
							var timerId = setInterval(function(){
								if(!responsiveVoice.isPlaying()){
									take_sample();
									clearInterval(timerId);
								} 
							},200);
						} else {
							proposeNew = "";
							busyFlag = "";
						}
				    });
				} );
			}
		}
		
		function startFaceLoop() {
			window.setInterval(function(){
				take_snapshot();
			}, 4000);	
		}
		startFaceLoop();
	</script>
</body>
</html>
