<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html lang="en">
<head>
	<title>OpenEco AppMockup</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link rel="stylesheet" href="<c:url value='/css/main.css' />" />
	<style type="text/css">
		#camera-wrapper {position: fixed; bottom: 155px; right: 20px; width: 120px; height:120px; overflow: hidden; border-radius: 200px; display: block; z-index: 100;}
		#my_camera { position: absolute; left: -20px; }
		/* .fullScreen {width = 100%; height = 100%;} */
		#player { position: fixed; bottom: 50px; left: 0; }
		#inputBox { background: rgba(0, 0, 0, 1); position: fixed; bottom: 0px; height: 50px; width: 100%; color: white;}
		.left-icon { background: rgba(255, 255, 255, .2); float: left; margin: 5px; margin-left: 10px; width: 40px; height: 40px; border-radius: 5px; }
		.right-icon { background: rgba(255, 255, 255, .2); float: right; margin: 5px 0; margin-right: 5px; width: 40px; height: 40px; border-radius: 5px; }
		.text-input { background: rgba(255, 255, 255, .2); margin: 5px; margin-left: 55px; margin-right: 140px; height: 40px; border-radius: 5px; }
		input[type=text] { background: rgba(255, 255, 255, 0); border: 0;}
		.material-icons { font-size: 40px; cursor: pointer;}
		#dialogBox { display:inline-block; /* background: rgba(0, 0, 0, .1); */ position: fixed; bottom: 165px; left: 0px; height: 225px; color: white; }
		.dialog { display:inline-block; background: rgba(5, 5, 5, .5); height: 55px; margin: 10px auto; margin-left: 25px; border-radius: 50px; color: white;}
		.chatProfilePic { display:block; float:left; height: 45px; width: 45px; margin: 5px 10px; border-radius: 50px;}
		.chatText { display:block; float:left; height: 45px; margin: 10px 5px; margin-right:20px;}
		#profileBox { display:inline-block; position: fixed; bottom: 100px; left: 0px; height: 55px; }
		.profile-bar-wrapper { display:block; float:left; height: 40px; margin-left:25px;}
	</style>
</head>
<body id="top">

	
	
	<div id="camera-wrapper"><div id="my_camera"></div></div>
	<input id="youtubeSearchQuery" value='' type="hidden"/><!-- <button id="search-button" onclick="search()">Search</button> -->
	<div id="player"></div><!-- youtube video block -->
	<div id="dialogBox">
		<div class="dialogWrapper">
		</div>
	</div>
	<div id="profileBox">
		<div class="profile-bar-wrapper"><img class="chatProfilePic" alt="pic" src="<c:url value='/images/avatar.jpg' />"></div>
		<div class="profile-bar-wrapper"><img class="chatProfilePic" alt="pic" src="<c:url value='/images/avatar.jpg' />"></div>
		<div class="profile-bar-wrapper"><img class="chatProfilePic" alt="pic" src="<c:url value='/images/avatar.jpg' />"></div>
		<div class="profile-bar-wrapper"><img class="chatProfilePic" alt="pic" src="<c:url value='/images/avatar.jpg' />"></div>
		<div class="profile-bar-wrapper"><img class="chatProfilePic" alt="pic" src="<c:url value='/images/avatar.jpg' />"></div>
		<div class="profile-bar-wrapper"><img class="chatProfilePic" alt="pic" src="<c:url value='/images/avatar.jpg' />"></div>
		<div class="profile-bar-wrapper"><img class="chatProfilePic" alt="pic" src="<c:url value='/images/avatar.jpg' />"></div>
	</div>
	<div id="inputBox">
		<div class="left-icon"><a><i class="material-icons">keyboard</i></a></div>
		<div class="right-icon"><a><i class="material-icons">create</i></a></div>
		<div class="right-icon"><a><i class="material-icons">flash_on</i></a></div>
		<div class="right-icon"><a><i class="material-icons">camera_alt</i></a></div>
		<div class="text-input"><input type="text" name="chatInput" placeholder="Write something" onkeydown="postChat(this)"/></div>
	</div>

	<script src="<c:url value='/js/vendor/jquery.min.js' />"></script>
	<script type="text/javascript" src="<c:url value='/js/vendor/youtubeDataAPI/auth.js' />"></script>	
	<script type="text/javascript" src="<c:url value='/js/vendor/youtubeDataAPI/search.js' />"></script>	
	<script src="https://apis.google.com/js/client.js?onload=googleApiClientReady"></script>
	<%-- <script type="text/javascript" src="<c:url value='/js/youtubePlayer.js' />"></script>	 --%>
	
	<script type="text/javascript" src="<c:url value='/js/vendor/webcam.js' />"></script>
	
	
	<script language="JavaScript">
		var videoIdToPlay="QvW61K2s0tA";
		var chatCount = 0;
		function postChat(ele) {
		    if(event.keyCode == 13) {
		    	if (ele.value == ""){
		    		//alert(""); 
		    	} else {
		    		if (chatCount >= 2){
		    			$('#dialogBox').find('div:first').remove();
		    		} 
		    		$("#dialogBox").append( "<div class=\"dialogWrapper\"><div class=\"dialog\"><img class=\"chatProfilePic\" alt=\"pic\" src=\"<c:url value='/images/avatar.jpg' />\"><span class=\"chatText\">"+ele.value+"</span></div></div>" );
		    		if (chatCount < 3){
		    			chatCount++;
		    		}
		    	}
		    	ele.value = "";
		    }
		}
		
		/* <div class="dialogWrapper">
			<div class="dialog"><img class="chatProfilePic" alt="pic" src="<c:url value='/images/avatar.jpg' />"><span class="chatText">dfgsdgd</span></div>
		</div> */
	</script>	
		
	<script language="JavaScript">	
		Webcam.set({
			// live preview size
			width: 160,
			height: 120,
			
			// device capture size
			dest_width: 640,
			dest_height: 480,
			
			// final cropped size
			/*crop_width: 480,
			crop_height: 480,  */
			
			// format and quality
			image_format: 'jpeg',
			jpeg_quality: 90
		});

		Webcam.attach( '#my_camera' );
	</script>
	
	<script language="JavaScript">
	  var tag = document.createElement('script');

	  tag.src = "https://www.youtube.com/iframe_api";
	  var firstScriptTag = document.getElementsByTagName('script')[0];
	  firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

	  var player;
	  function onYouTubeIframeAPIReady() {
		  player = new YT.Player('player', {
			  height: $(window).height(),
			  width: $(window).width(),
			  videoId: "",
			  autoplay: 0,
			  modestbranding: 1,
			  controls: 0,
			  rel: 0,
			  fs: 0,
			  iv_load_policy: 3,
			  showinfo: 0,
			  events: {
			    'onReady': onPlayerReady,
			    'onStateChange': onPlayerStateChange
			  }
		    });
	  }

	  function onPlayerReady(event) {
	    //event.target.playVideo();
		  player.loadVideoById(videoIdToPlay, 5, "large");
	  }

	  var done = false;
	  function onPlayerStateChange(event) {
		
	  }
	  function stopVideo() {
		$('#player').hide();
	    player.stopVideo();
	  }
	  function playVideo(videoId) {
		$('#player').show();
		player.loadVideoById(videoId, 5, "large");
		player.mute();
	  }
	  
	  function setPlayerFullScreen(){
		  player.setSize(window.innerWidth, window.innerHeight);
		  player.unMute();
		  player.playVideo();
	  }
	  
	  function cancelPlayerFullScreen(){
		  player.setSize(640, 480);
	  }
	</script>
</body>
</html>
