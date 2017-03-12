/**
 * 
 */

var stompClient = null;

function setConnected(connected) {
    $("#connect").prop("disabled", connected);
    $("#disconnect").prop("disabled", !connected);
    /*if (connected) {
        $("#conversation").show();
    }
    else {
        $("#conversation").hide();
    }
    $("#greetings").html("");
    */
}

function connect() {
    var socket = new SockJS('/boards');
    stompClient = Stomp.over(socket);
    stompClient.connect({}, function (frame) {
        setConnected(true);
        console.log('Connected: ' + frame);
        stompClient.subscribe('/topic/board/' + boardId, function (message) {
        	console.log(message.body);
            showGreeting(message.body);
        });
    });
}

function disconnect() {
    if (stompClient != null) {
        stompClient.disconnect();
    }
    setConnected(false);
    console.log("Disconnected");
}

function sendMessage() {
	/*var styles = [{
		name: $('#txtStyleName').val(),
		styleAttributes: []
	}];*/
	var style = {name: $('#txtStyleName').val(), styleAttributes: []};
	
	var idx = 0;
	var vals = $('#selVal')[0];
	
	$('#selAttr option').each(function() {
		var attrId = $(this).attr('value');
		var attrName = $(this).html();
		var val = vals.options[idx++].innerHTML;
		style.styleAttributes.push({
			"attribute": {
				"id": attrId,
				"name": attrName
			},
			"value": val
		});
	});
	
	var msg = {
		"text": $("#msgTxt").html(),
		"style" : style
	};
    stompClient.send("/app/board/" + boardId, {}, JSON.stringify(msg));
    
    $('#selAttr').html('');
    $('#selVal').html('');
    $('#txtStyleName').val('');
    $('#msgTxt').html('');
    $('#msgTxt').attr('style', '');
    $('#msgTxt').focus();
}

function showGreeting(message) {
	var msg = JSON.parse(message);
	
	var msgdiv = document.createElement("div");
	$(msgdiv).html(msg.text);
	//for(style in msg.styles) {
	//for(var i = 0; i < msg.styles.length; i++) {
		//var style = msg.styles[i];
		var style = msg.style;
		console.log(style);
		//for(styleattrib in style.styleattributes) {
		for(var j = 0; j < style.styleAttributes.length; j++) {
			var styleattrib = style.styleAttributes[j];
			$(msgdiv).css(styleattrib.attribute.name, styleattrib.value);
		}
	//}
    $(".msgarea").append(msgdiv);
}

$(function () {
    /*$("form").on('submit', function (e) {
        e.preventDefault();
    });*/
    /*$( "#connect" ).click(function() { connect(); });
    $( "#disconnect" ).click(function() { disconnect(); });*/
	connect();
    $( "#btnSend" ).click(function() { sendMessage(); });
});
