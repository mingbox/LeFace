var client;
var request;

function getMode() {
    return Microsoft.CognitiveServices.SpeechRecognition.SpeechRecognitionMode.shortPhrase;
}

var mode = getMode();
client = Microsoft.CognitiveServices.SpeechRecognition.SpeechRecognitionServiceFactory.createMicrophoneClient(
                mode,
                "en-us",
                'e0ee7225240c464ab33a155b8267a703');

function take_sample() {
	 
    client.startMicAndRecognition();
    setTimeout(function () {
        client.endMicAndRecognition();
    }, 5000);

    client.onPartialResponseReceived = function (data) {
        setText(data);
    }

    client.onFinalResponseReceived = function (data) {
        setText(JSON.stringify(data));
    }

    client.onIntentReceived = function (data) {
        setText(data);
    };
    
    client.onError = function (data) {
        setText(data);
    };
    //setText("");
}