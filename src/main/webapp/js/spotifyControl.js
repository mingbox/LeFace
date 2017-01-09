function spotifyPlay(songId){
	$('#spotify').src = "https://embed.spotify.com/?uri=spotify:track:"+songId;
	$('#spotify').show();
	$('#play-button').click();
}

function spotifyHide(){
	$('#play-button').click();
	$('#spotify').hide();
}