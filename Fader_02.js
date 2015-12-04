

var Fader = {fps:27, step:10};

/**
 * initalise the object (you never need to call this)
 */
Fader.init = function(){
	var s = document.body.style;
	this.opFlag = (s.opacity != undefined);
	this.NSFlag = (s.MozOpacity != undefined);
	this.IEFlag = (s.filter != undefined);
}

/**
 * Set the opacity of an element
 * @element		the html element
 * @opacity		the opacity of the flag (0 - 100)
 */
Fader.setOpacity = function(element, opacity){
	if (!this.opFlag) Fader.init(); // only run this once
    var s = element.style;
    if (this.opFlag) s.opacity = (opacity / 100);
    if (this.NSFlag) s.MozOpacity = (opacity / 100);
    if (this.IEFlag) s.filter = "alpha(opacity=" + opacity + ")"; 
}

/**
 * Fade an element in
 * @element		the html element
 * @opacity		optional - the starting opacity of the fade (0 - 100)
 * @completeFunc	a function to call when completed
 */
Fader.fadeIn = function(object, opacity, completeFunc){
	me = this;
	object.fading = true;
	if (opacity == undefined) opacity = 0;
	this.setOpacity(object, opacity);
	if (opacity < 100) {
		window.setTimeout(function(){me.fadeIn(object,opacity + me.step, completeFunc)},1000 / this.fps);
	} else {
		object.fading = false;
		if (completeFunc) completeFunc();
	}
}

/**
 * Fade an element out
 * @element		the html element
 * @opacity		optional - the starting opacity of the fade (0 - 100)
 * @completeFunc	a function to call when completed
 */
Fader.fadeOut = function(object, opacity, completeFunc){
	me = this;
	object.fading = true;
	if (opacity == undefined) opacity = 100;
	this.setOpacity(object, opacity);
	if (opacity > 0) {
		window.setTimeout(function(){me.fadeOut(object,opacity - me.step, completeFunc)},1000 / this.fps);
	} else {
		object.fading = false;
		if (completeFunc) completeFunc();
	}
}