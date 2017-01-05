// After the API loads, call a function to enable the search box.
function handleAPILoaded() {
  $('#search-button').attr('disabled', false);
}

// Search for a specified string.
function search() {
  var q = $('#youtubeSearchQuery').val();
  var request = gapi.client.youtube.search.list({
    q: q,
    part: 'id',
    maxResults: 5,
    type: 'video'
  });
  return request;
}
