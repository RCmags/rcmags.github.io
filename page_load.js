// Transmit size of "container" div
const sendPostMessage = () => {
	height = document.getElementById('container').offsetHeight;
	window.parent.postMessage( {frame_height: height}, '*' );
}

// When to update size:
window.onload = () => sendPostMessage();
window.onresize = () => sendPostMessage();