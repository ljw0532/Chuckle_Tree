var sock = null;
const message = document.getElementById("message");
$(document).ready(function (){
	   connectWs();
});
 
function connectWs(){
	sock = new SockJS('ws:'+getContextPath()+'/echo');
	
	sock.onopen = function(){
		console.log('info: connection opened');
	};

	sock.onmessage = function(evt){
		const data = evt.data;
		console.log('좋아요:' +data);
		message.innerHTML=data;
	}

	sock.onclose = function(){
		console.log('connect close');
	};
	
	sock.onerror = function(err) {
		console.log('Errors:' , err);
	};
}


function getContextPath() {
    var hostIndex = location.href.indexOf( location.host ) + location.host.length;
    return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
}; 
