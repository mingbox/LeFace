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
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
	<link rel="stylesheet" href="<c:url value='/css/main.css' />" />
	<style type="text/css">
		.clearfix:after {
		     visibility: hidden;
		     display: block;
		     font-size: 0;
		     content: " ";
		     clear: both;
		     height: 0;
	     }
		.clearfix { display: inline-block; }
		#video-container{position: absolute; width: 100%; height: 100%; z-index: 10;}
		#camera-wrapper {position: absolute; bottom: 80px; right: 20px; width: 150px; height:150px; overflow: hidden; border-radius: 200px; display: block; z-index: 100;}
		#my_camera { position: absolute; left: -20px; }
		/* .fullScreen {width = 100%; height = 100%;} */
		#player { position: absolute; bottom: 0; left: 0; }
		#inputBox { position: absolute; bottom: 0px; height: 70px; width: 100%; color: white;}
		/* .left-icon { background: rgba(255, 255, 255, .2); float: left; margin: 5px; margin-left: 10px; width: 40px; height: 40px; border-radius: 5px; }
		.right-icon { background: rgba(255, 255, 255, .2); float: right; margin: 5px 0; margin-right: 5px; width: 40px; height: 40px; border-radius: 5px; }*/
		.text-input { background: rgba(155, 155, 155, .2); margin: 10px; margin-left: 30px; margin-right: 100px; height: 50px; border-radius: 5px; } 
		input[type=text] { background: rgba(255, 255, 255, 0); border: 0;}
		.material-icons { font-size: 40px; cursor: pointer;}
		#dialogBox { display:inline-block; /* background: rgba(0, 0, 0, .1); */ position: absolute; bottom: 145px; left: 0px; height: 225px; color: white; }
		.dialog { display:inline-block; background: rgba(155, 155, 155, .5); height: 65px; margin: 5px auto; margin-left: 25px; border-radius: 10px; color: white;}
		.chatProfilePic { display:block; float:left; height: 55px; width: 55px; margin: 5px; border-radius: 50px;}
		.chatText { display:block; float:left; height: 45px; margin: 5px; margin-right:20px;}
		#profileBox { display:inline-block; position: absolute; bottom: 80px; left: 25px; height: 55px; }
		.profile-bar-image-wrapper { display:block; float:left; height: 40px; margin-right:10px;}
		#message-container{ display: none; position: absolute; background: rgba(155, 155, 155, .5); width: 150px; height: 400px; right: 20px; bottom: 250px; border-radius: 10px; z-index: 100;}
		.content-wrapper{ width: 100%; height: 100%; overflow: scroll;}
		.content-row{ width: 100%; padding: 5px; border-bottom: 1px solid #222;}
		.content-img{ width: 100%; height: auto; }
		.content-text{ margin:5px; }
		.content-text h4 { margin:0; }
	</style>
</head>
<body id="body">
	<div id="video-container">
		<div id="camera-wrapper"><div id="my_camera"></div></div>
		<input id="youtubeSearchQuery" value='' type="hidden"/><!-- <button id="search-button" onclick="search()">Search</button> -->
		<div id="player"></div><!-- youtube video block -->
		<div id="dialogBox">
			<div class="dialogWrapper">
			</div>
		</div>
		<div id="profileBox">
			<div class="profile-bar-image-wrapper"><img class="chatProfilePic" alt="pic" src="https://www.shoptab.net/blog/wp-content/uploads/2014/07/profile-circle.png"></div>
			<div class="profile-bar-image-wrapper"><img class="chatProfilePic" alt="pic" src="https://thecityprincessdotcom.files.wordpress.com/2014/02/profile-in-circle.png"></div>
			<div class="profile-bar-image-wrapper"><img class="chatProfilePic" alt="pic" src="http://images.nymag.com/news/business/boom-brands/business130930_grumpycat_2_560.jpg"></div>
			<div class="profile-bar-image-wrapper"><img class="chatProfilePic" alt="pic" src="https://media.creativemornings.com/uploads/user/avatar/120448/profile-circle.png"></div>
			<div class="profile-bar-image-wrapper"><img class="chatProfilePic" alt="pic" src="http://nexvpn.com/assets/images/pro.png"></div>
			<div class="profile-bar-image-wrapper"><img class="chatProfilePic" alt="pic" src="http://www.projectglobetrotter.com/wp-content/uploads/2016/05/circle-profile.png"></div>
			<div class="profile-bar-image-wrapper"><img class="chatProfilePic" alt="pic" src="http://8ballpool-france.com/img/circle.png"></div>
			<div class="profile-bar-image-wrapper"><img class="chatProfilePic" alt="pic" src="https://scontent.cdninstagram.com/t51.2885-15/e15/11333372_1466075417038785_1775864501_n.jpg?ig_cache_key=MTAxODA5NDQyMjc3NDg5ODIyNQ%3D%3D.2"></div>
			<div class="profile-bar-image-wrapper"><img class="chatProfilePic" alt="pic" src="https://s-media-cache-ak0.pinimg.com/564x/0c/24/b4/0c24b4d94375d13c710b456fa92c63b2.jpg"></div>
			<div class="profile-bar-image-wrapper"><img class="chatProfilePic" alt="pic" src="http://www.drodd.com/images15/anime18.jpg"></div>
		</div>
		<div id="inputBox">
			<!-- <div class="left-icon"><a><i class="material-icons">keyboard</i></a></div>
			<div class="right-icon"><a><i class="material-icons">create</i></a></div>
			<div class="right-icon"><a><i class="material-icons">flash_on</i></a></div>
			<div class="right-icon"><a><i class="material-icons">camera_alt</i></a></div> -->
			<div class="text-input"><input type="text" name="chatInput" placeholder="Join the conversation" onkeydown="postChat(this)"/></div>
		</div>
	</div>
	<div id="message-container">
		<div class="content-wrapper"> 
			<!-- <div class="content-row clearfix">
				<a href="#">
					<img class="content-img" alt="content-img" src="https://developer-tripadvisor.s3.amazonaws.com/static/img/ta_logo.png">
					<div class="content-text">
						<h4>Lake Tahoe, California</h4>
						<span>Basking in its 300 days of sunshine, Lake Tahoe is a haven for outdoor fun in every season.</span>
					</div>
				</a>
			</div>
			<div class="content-row clearfix">
				<a href="#">
					<img class="content-img" alt="content-img" src="https://developer-tripadvisor.s3.amazonaws.com/static/img/ta_logo.png">
					<div class="content-text">
						<h4>Lake Tahoe, California</h4>
						<span>Basking in its 300 days of sunshine, Lake Tahoe is a haven for outdoor fun in every season.</span>
					</div>
				</a>
			</div> -->
		</div>
	</div>
	
	<script src="<c:url value='/js/vendor/jquery.min.js' />"></script>
	<script type="text/javascript" src="<c:url value='/js/vendor/youtubeDataAPI/auth.js' />"></script>	
	<script type="text/javascript" src="<c:url value='/js/vendor/youtubeDataAPI/search.js' />"></script>	
	<script src="https://apis.google.com/js/client.js?onload=googleApiClientReady"></script>
	<%-- <script type="text/javascript" src="<c:url value='/js/youtubePlayer.js' />"></script>	 --%>
	
	<script type="text/javascript" src="<c:url value='/js/vendor/webcam.js' />"></script>
	
	
	<script language="JavaScript">
		var videoIdToPlay="IqFJJb7FV8k";
		var chatTotalCount = 0;
		var chatCount = 0;
		function postChat(ele) {
		    if(event.keyCode == 13) {
		    	if (ele.value == ""){
		    		//alert(""); 
		    	} else {
		    		if (chatCount >= 2){
		    			$('#dialogBox').find('div:first').remove();
		    		} 
		    		$("#dialogBox").append( "<div id='chat"+chatTotalCount+"' class=\"dialogWrapper animated slideInUp\"><div class=\"dialog\"><img class=\"chatProfilePic\" alt=\"pic\" src=\"<c:url value='/images/avatar.jpg' />\"><span class=\"chatText\">@Jane<br/>"+ele.value+"</span></div></div>" );
		    		var tempIndex = chatTotalCount;
		    		setTimeout(function(){
		    			$("#chat"+tempIndex).removeClass('animated slideInUp');
		    			$('#chat'+tempIndex).addClass('animated fadeOut');
					}, 3500);
		    		chatTotalCount++;
		    		if (chatCount < 3){
		    			chatCount++;
		    		}
		    	}
		    	ele.value = "";
		    }
		}
	</script>	
		
	<script language="JavaScript">	
		Webcam.set({
			// live preview size
			width: 200,
			height: 150,
			
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
			  height: $('#video-container').height(),
			  width: $('#video-container').width(),
			  videoId: "",
			  playerVars: {
				  autoplay: 0,
				  modestbranding: 0,
				  controls: 0,
				  rel: 0,
				  fs: 0,
				  iv_load_policy: 3,
				  showinfo: 0
		      },
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
		  if (player.getPlayerState() == 2){
			  $.get('<c:url value="/"/>getVideoAnnotation?videoId='+videoIdToPlay+'&timestamp='+parseInt(player.getCurrentTime()*1000)).done(function (data) { 
				//alert(JSON.stringify(data));
				  var array = JSON.parse(JSON.stringify(data));
				  for (i = 0; i < array.length; i++) { 
					  $(".content-wrapper").append('<div class="content-row clearfix"><a href="'+array[i].url+'" target="_blank"><img class="content-img" alt="content-img" src="'+array[i].imageUrl+'"><div class="content-text"><h4>'+array[i].key+'</h4><span>'+array[i].value+'</span></div></a></div>');
			      }
				  $("#message-container").css('display', "block");
				  $("#message-container").addClass('animated slideInRight');
				  
			  });
		  } else {
			  $('.content-wrapper').find('div').remove();
			  $("#message-container").css('display', "none");
			  $("#message-container").removeClass('animated slideInRight');
		  } 
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
