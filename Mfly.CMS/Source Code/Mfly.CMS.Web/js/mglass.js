/**
 * @author Piotr Salaciak 2010-11-24
 * @version 1.0
 */

/**
 * @return MGlass class instance
 * @param {String} imageId Small image identififier
 * @param {String} largeImageSrc Large image URL
 * @param {Object} configObject Configuration for this instance
 */
function MGlass(imageId, largeImageSrc, configObject){
	this.smallImage = document.getElementById(imageId);
	this.largeImage = new Image();
	this.largeImage.src = largeImageSrc;

	this.config = (configObject || {});

	this.onMouseMove = function(e){
		if (typeof e === "undefined")
			e = event;
		var wrapper = this;
		var mglassViewer = wrapper.childNodes[0];
		var img = wrapper.childNodes[1];
		var pageOffset = MGlass.getPageOffset();
		var imagePosition = MGlass.getElementPosition(img);
		
		if (imagePosition.x <= (e.clientX) && 
			imagePosition.y <= (e.clientY) && 
			imagePosition.x + img.clientWidth >= (e.clientX) && 
			imagePosition.y + img.clientHeight >= (e.clientY)){
			
			mglassViewer.style.visibility = 'visible';
			var x = (e.clientX);
			var y = (e.clientY);
			var xia = (y - imagePosition.y) - (mglassViewer.clientHeight / 2);
			var you = (x - imagePosition.x) - (mglassViewer.clientWidth / 2);
			mglassViewer.style.left = (x - (mglassViewer.clientWidth / 2) - 300 - Math.round(you/2)) + "px";
			mglassViewer.style.top = (y - (mglassViewer.clientHeight / 2) - 50 -  Math.round(xia/2)) + "px";
			//document.title = you + ":" + xia;

			var srcX = x - imagePosition.x;
			var srcY = y - imagePosition.y;
			
			var dstX = (srcX * (this.tag.largeImage.width - mglassViewer.clientWidth)) / img.clientWidth;
			var dstY = (srcY * (this.tag.largeImage.height - mglassViewer.clientHeight)) / img.clientHeight;
			dstX = dstX + (you > 0 ? 5 : -5);
			dstY = dstY + (xia > 0 ? 5 : -5);;
			mglassViewer.style.backgroundPosition = (-dstX) + "px " + (-dstY) +  "px";
		} else {
			mglassViewer.style.visibility = 'hidden';
		}	
	}
	this.onMouseOut = function(e){
		if (typeof e === "undefined")
			e = event;
		var wrapper = this;
		var mglassViewer = wrapper.childNodes[0];
		var img = wrapper.childNodes[1];
		var pageOffset = MGlass.getPageOffset();
		var imagePosition = MGlass.getElementPosition(img);
		
		if (!(imagePosition.x <= (e.clientX) && 
			imagePosition.y <= (e.clientY) && 
			imagePosition.x + img.clientWidth >= (e.clientX) && 
			imagePosition.y + img.clientHeight >= (e.clientY))){
			mglassViewer.style.visibility = 'hidden';
		}
		
	}
	
	var wrapperElement = document.createElement("DIV");
	wrapperElement.className = (this.config.wrapperClassName || "mglass_wrapper");
	wrapperElement.tag = this;
	wrapperElement.name = "mglass_wrapper";
	if(this.smallImage.width/700 > this.smallImage.height/400 ) {
	    wrapperElement.style.width =  "700px";
	    wrapperElement.style.height = Math.round(this.smallImage.height/(this.smallImage.width/700)) +"px";
    } else {
	    wrapperElement.style.width = Math.round(this.smallImage.width/(this.smallImage.height/400)) + "px";
	    wrapperElement.style.height = "400px";
    }
	/*wrapperElement.style.width = "400" + "px";
  if(parseInt(this.smallImage.width)>parseInt(this.smallImage.height)) {
  wrapperElement.style.height = "400"+"px";
  }
  else{
  wrapperElement.style.height = "700" + "px";
  }*/
	
	wrapperElement.onmousemove = this.onMouseMove;
	wrapperElement.onmouseout = this.onMouseOut;
	
	var viewerElement = document.createElement("DIV");
	viewerElement.className = (this.config.viewerClassName || "mglass_viewer");
	viewerElement.name = "mglass_viewer";
	viewerElement.style.background = "url('"+ this.largeImage.src +"') no-repeat";
	if (this.config.innerHTML)
		viewerElement.innerHTML = this.config.innerHTML;

	var pictureBoxElement = document.createElement("DIV");
	pictureBoxElement.className = (this.config.pictureBoxClassName || "mglass_picture_box");
	pictureBoxElement.name = "mglass_picture_box";
	pictureBoxElement.style.padding = "10px 0px 0px 0px;";
	if(this.smallImage.width/700 > this.smallImage.height/400 ) {
	    pictureBoxElement.style.width =  "760px";
	    pictureBoxElement.style.height = (Math.round(this.smallImage.height/(this.smallImage.width/700))+60) +"px";
    } else {
	    pictureBoxElement.style.width = (Math.round(this.smallImage.width/(this.smallImage.height/400))+60) + "px";
	    pictureBoxElement.style.height = "460px";
    }
  /*if(parseInt(this.smallImage.width)>parseInt(this.smallImage.height)) {
  pictureBoxElement.style.height = "400"+"px";
  }
  else{
  pictureBoxElement.style.height = "700" + "px";
  }*/
  
	
	wrapperElement.appendChild(viewerElement);
	wrapperElement.appendChild(pictureBoxElement);
	
	this.smallImage.parentNode.replaceChild(wrapperElement, this.smallImage);
	pictureBoxElement.appendChild(this.smallImage);
}

/**
 * @return page current offset, that is object with x and y coordinates.
 */
MGlass.getPageOffset = function () {
	var scrOfX = 0, scrOfY = 0;
	if (typeof(window.pageYOffset) == 'number') {
		scrOfX = window.pageXOffset;
		scrOfY = window.pageYOffset;
	} else if (document.body && (document.body.scrollLeft || document.body.scrollTop)) {
		scrOfX = document.body.scrollLeft;
		scrOfY = document.body.scrollTop;
	} else if (document.documentElement && (document.documentElement.scrollLeft || document.documentElement.scrollTop)) {
		scrOfX = document.documentElement.scrollLeft;
		scrOfY = document.documentElement.scrollTop;
	}
	return {x: scrOfX, y: scrOfY};
}

/**
 * @return element's current offset, regarding all it's parents offset
 * @param {HTMLElement} obj element for which offset is calculated
 */
MGlass.getElementPosition = function(obj){
	var curentLeft = 0, currentTop = 0;
	if (obj.offsetParent) {
		do {
			curentLeft += obj.offsetLeft;
			currentTop += obj.offsetTop;
		} while (obj = obj.offsetParent);
	}
	return {x: curentLeft, y: currentTop};
}