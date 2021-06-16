// Iframe element
var iframe = document.getElementById("iframe");

// Change source based on button click:
document.getElementById("menu1").onclick = function() {
	iframe.src="about.html";
}

document.getElementById("menu2").onclick = function() {
	iframe.src="projects.html";
}

document.getElementById("menu3").onclick = function() {
	iframe.src="contact.html";
}

// Receive height of "container" div and resize iframe			
window.onmessage = (input) => {
	iframe.style.height = `${input.data.frame_height + 30}px`;
};
