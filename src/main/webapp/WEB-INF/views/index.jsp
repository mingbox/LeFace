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
	<div id="my_camera"></div>
	<form name="adduserform" id="adduserform" action="<c:url value="/detect" />" method="post">
		<div class="row uniform 50%">
			<input type="hidden" name="img" id="img" value="" />
			<div class="12u$"><input type="hidden" name="name" id="name" placeholder="Name" /></div>
		</div>
	</form>		

	<div id="player"></div><!-- youtube video block -->
	<div id="dialogBox">
		<p id="dialog"></p>
	</div>

	<script src="<c:url value='/js/jquery.min.js' />"></script>
	<script src="<c:url value='/js/jquery.poptrox.min.js' />"></script>
	<script src="<c:url value='/js/skel.min.js' />"></script>
	<script src="<c:url value='/js/util.js' />"></script>
	<script src="<c:url value='/js/main.js' />"></script>
	
	<script type="text/javascript" src="<c:url value='/js/youtubePlayer.js' />"></script>
	<script type="text/javascript" src="http://code.responsivevoice.org/responsivevoice.js"></script>	
	<script type="text/javascript" src="<c:url value='/js/screenPrint.js' />"></script>	
	
	<script type="text/javascript" src="<c:url value='/js/webcam.js' />"></script>
	<script type="text/javascript" src="<c:url value='/js/faceRecognitionControl.js' />"></script>
	
	<script type="text/javascript" src="<c:url value='/js/speech.1.0.0.js' />" ></script>
	<script type="text/javascript" src="<c:url value='/js/voiceRecognitionControl.js' />"></script>
	
	<script language="JavaScript">
		var faceBusyFlag = 0;
		var voiceBusyFlag = 0;
		var status = "standBy";//newUser; suggestion; playing;
		var oldFaceResult="";
		var faceResult="";
		var videoIdToPlay=0;
		
		var videos = ["OK Go – The One Moment", 
			"Plane with 48 aboard crashes in Pakistan",
			"Come Together – directed by Wes Anderson starring Adrien Brody",
			"Madonna Carpool Karaoke",
			"Ronda Rousey & Vin Diesel Are 'World Of Warcraft' Buds",
			"Transformers: The Last Knight - Teaser Trailer",
			"President Obama on Bipartisan Politics for 'A House Divided'", 
			"Lin-Manuel Miranda, Opetaia Foa'i - We Know The Way (From 'Moana')"];
		var videoMap = ["QvW61K2s0tA", 
				"a7dCcsgsMes",
				"VDinoNRC49c",
				"Sx2PfL2ekTY",
				"AYh5pAQ1hr8",
				"qLA6cpLwr6A",
				"SCIZBGMhpRk", 
				"ubZrAmRxy_M"];

		var speechLoop;
        /* function startSpeechLoop() {
			window.setInterval(function(){
				if(!responsiveVoice.isPlaying() && voiceBusyFlag == 0) {
					voiceOperation();
					//take_sample();
				}
			}, 4000);	
		}  
        startSpeechLoop(); */
        
        function startFaceLoop() {
			window.setInterval(function(){
				if(faceBusyFlag == 0) {
					faceOperation();
					//take_snapshot();
				}
			}, 4000);	
		}
		startFaceLoop();
		
	</script>
</body>
</html>
