/**
 * 
 */

var CahClient = function(id, $) {
	this.gameId = id;
	this.$ = $;
	var t = this;
	var success = function(data, status, xhr) {
		console.log(data);
		this.model = data;
	}
	
	var boundSuccess = success.bind(this);
	
	//var boundSetModel = setModel.bind(this);
	
	$.ajax("model", {dataType: "json"})
		.done(boundSuccess)
		.fail(function(xhr, status) {
			console.log("fail");
			console.log(status);
		});
}
