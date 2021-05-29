// Iframe element
var frame = document.getElementById("frame");

// Change source based on button click:
document.getElementById("menu1").onclick = function() {
	frame.src="about.html";
}

document.getElementById("menu2").onclick = function() {
	frame.src="projects.html";
}

document.getElementById("menu3").onclick = function() {
	frame.src="contact.html";
}