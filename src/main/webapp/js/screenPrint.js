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