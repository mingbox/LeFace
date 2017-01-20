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
		.camera-wrapper {position: absolute; right: 20px; width: 150px; height:150px; overflow: hidden; border-radius: 10px; display: block; z-index: 100; cursor: all-scroll;}
		.video_cam { position: absolute; left: -20px; }
		.live-cam-wrapper { bottom: 140px; display: none;}
		.cam-cross {position:absolute; top: 5px; right: 10px; font-size:.8em; cursor: pointer;}
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
		.chatProfilePic { display:block; float:left; height: 55px; width: 55px; margin: 5px; border-radius: 50px; cursor: pointer;}
		.chatText { display:block; float:left; height: 45px; margin: 5px; margin-right:20px;}
		#profileBox { display:inline-block; position: absolute; bottom: 80px; left: 25px; height: 55px; }
		.profile-bar-image-wrapper { display:block; float:left; height: 40px; margin-right:10px;}
		#message-container{ display: none; position: absolute; background: rgba(155, 155, 155, .5); width: 150px; height: 400px; right: 20px; top: 180px; border-radius: 10px; z-index: 100;}
		.content-wrapper{ width: 100%; height: 100%; overflow: scroll;}
		.content-row{ width: 100%; padding: 5px; border-bottom: 1px solid #222;}
		.content-img{ width: 100%; height: auto; }
		.content-text{ margin:5px; }
		.content-text h4 { margin:0; }
		#heart-box { display:block; position: absolute; /* background: rgba(155, 155, 155, .5); */ bottom: 0px; right: 15px; width:75px; height: 250px; z-index: 100;}
		.heart { display:block; position: absolute; width: 35px; height: 35px; bottom: 0px; left: 20px}
	</style>
</head>
<body id="body">
	<div id="video-container">
		<div class="camera-wrapper" style="top: 20px;" ><div class="video_cam" id="my_camera"></div></div>
		<div class="camera-wrapper live-cam-wrapper" style="left: 25px;"><div class="video_cam" id="cam1"></div><a num="1" class="cam-cross">&#10060</a></div>
		<div class="camera-wrapper live-cam-wrapper" style="left: 100px;"><div class="video_cam" id="cam2"></div><a num="2" class="cam-cross">&#10060</a></div>
		<div class="camera-wrapper live-cam-wrapper" style="left: 175px;"><div class="video_cam" id="cam3"></div><a num="3" class="cam-cross">&#10060</a></div>
		<div class="camera-wrapper live-cam-wrapper" style="left: 250px;"><div class="video_cam" id="cam4"></div><a num="4" class="cam-cross">&#10060</a></div>
		<div class="camera-wrapper live-cam-wrapper" style="left: 325px;"><div class="video_cam" id="cam5"></div><a num="5" class="cam-cross">&#10060</a></div>
		<div class="camera-wrapper live-cam-wrapper" style="left: 400px;"><div class="video_cam" id="cam6"></div><a num="6" class="cam-cross">&#10060</a></div>
		<div class="camera-wrapper live-cam-wrapper" style="left: 475px;"><div class="video_cam" id="cam7"></div><a num="7" class="cam-cross">&#10060</a></div>
		<div class="camera-wrapper live-cam-wrapper" style="left: 550px;"><div class="video_cam" id="cam8"></div><a num="8" class="cam-cross">&#10060</a></div>
		<div class="camera-wrapper live-cam-wrapper" style="left: 625px;"><div class="video_cam" id="cam9"></div><a num="9" class="cam-cross">&#10060</a></div>
		<div class="camera-wrapper live-cam-wrapper" style="left: 700px;"><div class="video_cam" id="cam10"></div><a num="10" class="cam-cross">&#10060</a></div>
		<input id="youtubeSearchQuery" value='' type="hidden"/><!-- <button id="search-button" onclick="search()">Search</button> -->
		<div id="player"></div><!-- youtube video block -->
		<div id="dialogBox">
			<div class="dialogWrapper">
			</div>
		</div>
		<div id="profileBox">
			<div class="profile-bar-image-wrapper"><img id="1" class="chatProfilePic" alt="pic" src="https://www.shoptab.net/blog/wp-content/uploads/2014/07/profile-circle.png"></div>
			<div class="profile-bar-image-wrapper"><img id="2" class="chatProfilePic" alt="pic" src="https://thecityprincessdotcom.files.wordpress.com/2014/02/profile-in-circle.png"></div>
			<div class="profile-bar-image-wrapper"><img id="3" class="chatProfilePic" alt="pic" src="http://images.nymag.com/news/business/boom-brands/business130930_grumpycat_2_560.jpg"></div>
			<div class="profile-bar-image-wrapper"><img id="4" class="chatProfilePic" alt="pic" src="https://media.creativemornings.com/uploads/user/avatar/120448/profile-circle.png"></div>
			<div class="profile-bar-image-wrapper"><img id="5" class="chatProfilePic" alt="pic" src="http://nexvpn.com/assets/images/pro.png"></div>
			<div class="profile-bar-image-wrapper"><img id="6" class="chatProfilePic" alt="pic" src="http://www.projectglobetrotter.com/wp-content/uploads/2016/05/circle-profile.png"></div>
			<div class="profile-bar-image-wrapper"><img id="7" class="chatProfilePic" alt="pic" src="http://8ballpool-france.com/img/circle.png"></div>
			<div class="profile-bar-image-wrapper"><img id="8" class="chatProfilePic" alt="pic" src="https://scontent.cdninstagram.com/t51.2885-15/e15/11333372_1466075417038785_1775864501_n.jpg?ig_cache_key=MTAxODA5NDQyMjc3NDg5ODIyNQ%3D%3D.2"></div>
			<div class="profile-bar-image-wrapper"><img id="9" class="chatProfilePic" alt="pic" src="https://s-media-cache-ak0.pinimg.com/564x/0c/24/b4/0c24b4d94375d13c710b456fa92c63b2.jpg"></div>
			<div class="profile-bar-image-wrapper"><img id="10" class="chatProfilePic" alt="pic" src="http://www.drodd.com/images15/anime18.jpg"></div>
		</div>
		<div id="inputBox">
			<!-- <div class="left-icon"><a><i class="material-icons">keyboard</i></a></div>
			<div class="right-icon"><a><i class="material-icons">create</i></a></div>
			<div class="right-icon"><a><i class="material-icons">flash_on</i></a></div>
			<div class="right-icon"><a><i class="material-icons">camera_alt</i></a></div> -->
			<div class="text-input"><input type="text" id="chatInput" name="chatInput" placeholder="Join the conversation" onkeydown="postChat(this)"/></div>
		</div>
	</div>
	<div id="message-container">
		<div class="content-wrapper"> 
			
		</div>
	</div>
	<div id="heart-box"> 
		<%-- <img class="heart" src="<c:url value='/images/heart0.png'/>" /> --%>
	</div>
	
	<script type="text/javascript" src="<c:url value='/js/vendor/jquery.min.js' />"></script>
	<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script type="text/javascript" src="<c:url value='/js/vendor/move.min.js' />"></script>
	<script type="text/javascript" src="<c:url value='/js/vendor/youtubeDataAPI/auth.js' />"></script>	
	<script type="text/javascript" src="<c:url value='/js/vendor/youtubeDataAPI/search.js' />"></script>	
	<script src="https://apis.google.com/js/client.js?onload=googleApiClientReady"></script>
	<%-- <script type="text/javascript" src="<c:url value='/js/youtubePlayer.js' />"></script>	 --%>
	
	<script type="text/javascript" src="<c:url value='/js/vendor/webcam.js' />"></script>
	
	
	<script language="JavaScript">
		var videoIdToPlay="IqFJJb7FV8k";
		var chatTotalCount = 0;
		var chatCount = 0;
		var defaultProfilePic = 'https://www.shoptab.net/blog/wp-content/uploads/2014/07/profile-circle.png';
		var defaultPersonName = 'raj';
		var heartId = 0;
		var heartFlyTimeMax = 4;
		var heartHeightMax = 200;
		
		function heartPopup(){
			if (heartId > 50000) heartId = 0;
			heartId++;
			var thisId = heartId;
			var flyTimeTotal = Math.floor(Math.random() * heartFlyTimeMax);
			var flyHeight = Math.floor(Math.random() * heartHeightMax)+100;
			var picNum = Math.floor(Math.random() * 3);
			var xShift = Math.floor(Math.random() * 40);
			if (picNum == 0){
				$('#heart-box').append('<img class="heart" id="heart'+thisId+'" src="<c:url value='/images/heart0.png'/>" />');
			} else if (picNum == 1){
				$('#heart-box').append('<img class="heart" id="heart'+thisId+'" src="<c:url value='/images/heart1.png'/>" />');
			} else if (picNum == 2){
				$('#heart-box').append('<img class="heart" id="heart'+thisId+'" src="<c:url value='/images/heart2.png'/>" />');
			}
			setTimeout(function(){
				move('#heart'+thisId)
				  .x(20-xShift)
				  .y(0-flyHeight)
				  .duration(flyTimeTotal+2+'s')
				  .end();
				setTimeout(function(){
					$('#heart'+thisId).addClass('animated fadeOut');
				}, (flyTimeTotal+1)*1000);
			}, 100);
			
		}
		function postChat(ele) {
			heartPopup();
		    if(event.keyCode == 13) {
		    	if (ele.value == ""){
		    		//alert(""); 
		    	} else {
		    		postChatOps(defaultPersonName, defaultProfilePic, ele.value);
		    		if (ele.value.includes("@")){
		    			setTimeout(function(){
		    				postChatOps('jane', 'https://thecityprincessdotcom.files.wordpress.com/2014/02/profile-in-circle.png', 'So beautiful!!');
		    				setTimeout(function(){
			    				postChatOps('jane', 'https://thecityprincessdotcom.files.wordpress.com/2014/02/profile-in-circle.png', 'Where was this shot?');
			    				setTimeout(function(){
				    				postChatOps('grumpycat', 'http://images.nymag.com/news/business/boom-brands/business130930_grumpycat_2_560.jpg', 'I think maybe BC');
				    				setTimeout(function(){
					    				postChatOps('marcus', 'https://media.creativemornings.com/uploads/user/avatar/120448/profile-circle.png', 'Nice footage! Have the same exact Snowshot jacket');
					    			}, 3000);
			    				}, 3000);
		    				}, 1500);
		    			}, 3000);
		    		}
		    	}
		    	ele.value = "";
		    }
		}
		function postChatOps(name, pic, text){
			if (chatCount >= 2){
    			$('#dialogBox').find('div:first').remove();
    		} 
    		$("#dialogBox").append( "<div id='chat"+chatTotalCount+"' class=\"dialogWrapper animated slideInUp\"><div class=\"dialog\"><img class=\"chatProfilePic\" alt=\"pic\" src=\""+pic+"\"><span class=\"chatText\">@"+name+"<br/>"+text+"</span></div></div>" );
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
		function videoPause(){
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
		$("#chatInput").focus();
		$(".camera-wrapper").draggable();
		$(".chatProfilePic").click(function(){
			//alert('#cam'+$(this).attr('id'));
			$('#cam'+$(this).attr('id')).parent().show();
		});
		$(".cam-cross").click(function(){
			$('#cam'+$(this).attr('num')).parent().hide();
		});
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
		Webcam.attach( '#cam1' );
		Webcam.attach( '#cam2' );
		Webcam.attach( '#cam3' );
		Webcam.attach( '#cam4' );
		Webcam.attach( '#cam5' );
		Webcam.attach( '#cam6' );
		Webcam.attach( '#cam7' );
		Webcam.attach( '#cam8' );
		Webcam.attach( '#cam9' );
		Webcam.attach( '#cam10' );
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
		  videoPause();
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
