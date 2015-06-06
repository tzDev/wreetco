// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require_tree .

$(function(){ $(document).foundation(); });


function setupTransitions() {
	//alert(window.innerWidth);
	// define the css strings that we'll use for the 'style' property of the splash elements
	var transitions = [
		{
			start: "background-color: rgb(37,41,50);",
			end: "background-color: rgb(41,144,159);"
		}, {
			start: "background-color: rgb(41,144,159);",
			end: "background-color: rgb(51,51,51);"
		}, {
			start: "background-color: rgb(51,51,51);",
			end: "background-color: rgb(255, 255, 255);"
		}, {
			start: "",
			end: ""
		}	
	];
	// get the splash elements and their rendered height
	var splashes = $('.splash');
	var splash_height = splashes.height();
	// iterate the objects and set the 'data-[height]' attributes for skrollr
	for (var i = 0; i < splashes.length; i++) {
		// opacity div: splashes[i].children[0].style
		// well we know how tall, but we need to know where the top is
		var top = $('.splash_' + i).offset().top;
		// set the element start 
		splashes[i].setAttribute("data-" + top, transitions[i].start);
		// set the element end
		splashes[i].setAttribute("data-" + (top + splash_height - 50), transitions[i].end); // seems to look better if it ends a little early (50px)
		// let's do out opacity stuff on the children
		// we've wrapped all the child els in a convenient div for masking
		var opacity_div = splashes[i].children[0]; // should be first child
		// set the show/hide triggers
		opacity_div.setAttribute("data-" + (top - (splash_height / 2)), "opacity: 0;"); 
		opacity_div.setAttribute("data-" + (top - 50), "opacity: 1;"); // again looks better starting a little ealy (50px)
		opacity_div.setAttribute("data-" + (top + (splash_height / 2)), "opacity: 0;");
	}
	// after the elements have had their data attributes set we can init skrollr
	skrollr.init({
		forceHeight: false
	});
	// if everything looks good let's say so
	return 1;
	
}
	
	
	
	
	
