
var READY_STATE_OPEN = 1;
var READY_STATE_HEADER = 2;
var READY_STATE_LOADING = 3;
var READY_STATE_DONE = 4;
var req;
var resultMethod;

function getXMLDocument(){
	var xDoc = null;
	if(document.implementation && document.implementation.createDocument){
		xDoc = document.implementation.createDocument("", "", null);
	}else if(typeof ActiveXObject != "undefined"){
		var msXmlAx = null;
		try {
			msXmlAx = new ActiveXObject("Msxml2, DOMDocument");
		} catch (e) {
			msXmlAx = new ActiveXObject("Msxml, DOMDocument");
		}
		xDoc = msXmlAx;
	}
	if(xDoc == null || typeof xDoc.load == "undefined"){
		
		xDoc = null;
	}
	return xDoc;
}  
function sendRequest(url, params, HttpMethod, onReadyMethod){
	if(!HttpMethod){
		HttpMethod="GET";//GET POST PUT DELETE OPTION HEAD
	}
	req = getXMLHTTPRequest();
	if(req){
		resultMethod=onReadyMethod;
		req.onreadystatechange = onReadStateChange;
		req.open(HttpMethod,url,true);
		req.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		req.send(params);
	}
}
function onReadStateChange(){
	var ready = req.readyState;
	var data = null;
	if(ready == READY_STATE_DONE){
		data = req.responseText;
		resultMethod(data);
	}else{
	}
}
function getXMLHTTPRequest(){
	var xRequest = null;
	if(window.XMLHttpRequest){
		xRequest = new XMLHttpRequest();
	}else if(typeof ActiveXObject != "undefined"){
		xRequest = new ActiveXObject("Microsoft.XMLHTTP");
	}
	return xRequest;
}
