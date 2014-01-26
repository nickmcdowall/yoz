if (window.WebSocket) {
	
	var w = new WebSocket("ws://localhost:8080/websocket");
	
	w.onopen = function () {
		console.log("Connected to websocket.");
	};
	
	w.onmessage = function (e) {
		var wrapper = document.createElement("div");
		wrapper.innerHTML = e.data;
		wrapper.className = "well well-sm";
		
		var real_time = document.getElementById("real_time");
		real_time.insertBefore(wrapper, real_time.firstChild);
	};
	
	w.onclose = function (e) {
		alert("WebSocket connection has closed: " + e.data);
	};
	
} else {
	alert("Unfortunately your Browser does not support WebSockets.");
}