  var tag = document.createElement('script');

  tag.src = "https://www.youtube.com/iframe_api";
  var firstScriptTag = document.getElementsByTagName('script')[0];
  firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

  var player;
  function onYouTubeIframeAPIReady() {
	  player = new YT.Player('player', {
		  height: '390',
		  width: '640',
		  videoId: "",
		  autoplay: 0,
		  modestbranding: 1,
		  controls: 0,
		  rel: 0,
		  events: {
		    'onReady': onPlayerReady,
		    'onStateChange': onPlayerStateChange
		  }
	    });
  }

  function onPlayerReady(event) {
    //event.target.playVideo();
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