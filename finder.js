var map = null;
var latLon = new VELatLong(39.394111, -97.074532);
var arrPin = [];
var pinpos = 0;
var selStyle = "r";  // a, h, r
var selMode = VEMapMode.Mode2D;
var fixed = 0;
var showSwitch = 1;  
var xmlObj = "";
var xmlDoc = "";
var currentLocation = new Object;
currentLocation.gridIconID = "";
currentLocation.linkID = "";
currentLocation.pinID = "";
var g_firefox = document.getElementById && !document.all;

var NUM_ITEMS = 10
var buttonAry = new Array();
var holdingAry = new Array();
var icons = new Array();
var featureLinkAry = new Array();
var gridDiv = new Array();
var isCmdFromFlash = false;
var isFirstLoad = true;		


function createXMLHttpRequest()
{
    if (window.ActiveXObject)
    {
        xmlDoc = new ActiveXObject('Microsoft.XMLHTTP');  
    }
    else if (window.XMLHttpRequest)
    {
        xmlDoc = new XMLHttpRequest();
    }
} 

function loadXML()
{
    createXMLHttpRequest();
    xmlDoc.onreadystatechange = parseXML;
    xmlDoc.open('GET','tripfinderxml.asp?cat=' + cat + '&reg=' + reg, true);
    xmlDoc.send(null);
}

function parseXML()
{
    if (xmlDoc.readyState == 4)
    {
        if (xmlDoc.status == 200)
        {
            try {
                xmlDoc = xmlDoc.responseXML;                
                xmlObj = xmlDoc.getElementsByTagName("row");
                for (var x = 0; x < xmlObj.length; x++)
                {
                    var pin = new Object;
                    pin.pinpos = pinpos;
                    pin.locid = xmlObj[x].getAttribute("locid");	                	                
                    pin.region = getNodeText(xmlObj[x], "region");
                    pin.location = getNodeText(xmlObj[x], "location");
                    pin.state = getNodeText(xmlObj[x], "state");
                    pin.site = getNodeText(xmlObj[x], "site");
                    pin.price = getNodeText(xmlObj[x], "price");
                    pin.pricedesc = getNodeText(xmlObj[x], "pricedesc");
                    pin.desc = getNodeText(xmlObj[x], "description");
                    pin.img = getNodeText(xmlObj[x], "image");
                    pin.cat = getNodeText(xmlObj[x], "categories");
                    pin.hot = getNodeText(xmlObj[x], "hotelprice");
                    pin.hotlink = getNodeText(xmlObj[x], "hotellink");
                    pin.pkg = getNodeText(xmlObj[x], "pkgprice");
                    pin.pkglink = getNodeText(xmlObj[x], "pkglink");
                    
                    pin.lat = xmlObj[x].getAttribute("lat");                        
                    pin.lng = xmlObj[x].getAttribute("long"); 
	                 
                    pin.customIcon = "<div class='pinImgOff' onmouseover='this.className=\"pinImgOn\";' onmouseout='this.className=\"pinImgOff\";'>"+(pinpos+1)+"</div>";

                    arrPin[pinpos] = pin;
                    pinpos++
                }
                GetMap();
            } catch (ex) {}
        }
    }
}

function getNodeText(parentnode, name)
{
    try {
        if (parentnode.getElementsByTagName(name)[0].text)
            return parentnode.getElementsByTagName(name)[0].text;
        else
            return parentnode.getElementsByTagName(name)[0].firstChild.nodeValue;
    }
    catch(ex) {return "";}
}

var infobox = null;
function GetMap()
{
    map = new VEMap('myMap');
    map.SetDashboardSize(VEDashboardSize.Normal);	
    map.onLoadMap = MapLoaded;
    map.LoadMap(latLon,zoom,'r');
    map.AttachEvent("onmouseover", mouseoverPin);
    map.AttachEvent("onmouseout", mouseoutPin);	
    map.AttachEvent("onmousewheel", onscrollwheel);
    map.AttachEvent("onclick", clickPin);

    map.ClearInfoBoxStyles();
    AddPushpins();
    buildLinks();
        
    setCurrentLocation(startId,featureLinkAry[startNum].id,featureLinkAry[startNum].longName);
    getPricing(arrPin[startNum].desc,arrPin[startNum].hot,arrPin[startNum].pkg,arrPin[startNum].hotlink,arrPin[startNum].pkglink,arrPin[startNum].cat,arrPin[startNum].location,arrPin[startNum].site,arrPin[startNum].region);	        
}

function MapLoaded(){}

function clickPin(e)
{
    if (e.elementID != null)
    {
	    var fl = "fl_"+getLinkID(map.GetShapeByID(e.elementID).GetID());
	    var gridID = getPinPos(map.GetShapeByID(e.elementID).GetID());
	    var hotel = document.getElementById(fl).hotel;
	    var desc = document.getElementById(fl).desc;
	    var hotellink = document.getElementById(fl).hotellink;
	    var pkgprice = document.getElementById(fl).pkgprice;
	    var pkglink = document.getElementById(fl).pkglink;
	    var categ = document.getElementById(fl).categ;
	    var site = document.getElementById(fl).site;
	    var location = document.getElementById(fl).location;
	    var state = document.getElementById(fl).region;
	    getPricing(desc,hotel,pkgprice,hotellink,pkglink,categ,location,site,region);
	    setCurrentLocation(gridID,fl,e.elementID);
    }
}

function onscrollwheel(e)
{
     return true;
}

function getPinID(val)
{
	for (x = 0; x < arrPin.length; x++)
	{
		if (arrPin[x].id == val)
		{
			return arrPin[x].pinid;
		}
	}
}      

function mouseoverPin(e)
{
    if (e.elementID != null && e.elementID != currentLocation.pinID)
    {
	    var fl = getLinkID(map.GetShapeByID(e.elementID).GetID());
	    showLink(fl);
	    var pin = map.GetShapeByID(e.elementID);
	    SetZIndex(pin,1);
		if (pin)
        {
            var customIcon = "<div class='pinImgOn' onmouseover='this.className=\"pinImgOn\";' onmouseout='this.className=\"pinImgOff\";'>"+pid+"</div>";
            pin.SetCustomIcon(customIcon);
        }                   
    }
}

function mouseoutPin(e)
{
    if (e.elementID != null)
    {
        if (e.elementID != currentLocation.pinID)
        {
            var fl = getLinkID(map.GetShapeByID(e.elementID).GetID());
            hideLink(fl); 
            var pin = map.GetShapeByID(e.elementID);
            SetZIndex(pin,-1);
            if (pin)
            {
                var customIcon = "<div class='pinImgOff' onmouseover='this.className=\"pinImgOn\";' onmouseout='this.className=\"pinImgOff\";'>"+pid+"</div>";
                pin.SetCustomIcon(customIcon);
            } 
        }                 
    }  
}

function getLinkID(val)
{
    for (x = 0; x < arrPin.length; x++)
    {
        if (arrPin[x].pinid == val)
        {
	        return arrPin[x].locid;
        }
    }
}

function getPinPos(val)
{
    for (x = 0; x < arrPin.length; x++)
    {
        if (arrPin[x].pinid == val)
        {
	        return arrPin[x].pinpos+1;
        }
    }
}        

function showLink(id)
{
    var fl = "fl_"+id;
    document.getElementById(fl).className = "linkHolder linkHolderHover";
    for (var i=0;i < NUM_ITEMS; i++)
    {
	    if (id == arrPin[i].locid)
	    {
	        document.getElementById((i+1).toString()).className = 'gridIconOff';
    	    return;
	    }
    }
}

function hideLink(id)
{
    var fl = "fl_"+id;
    document.getElementById(fl).className = "linkHolder";
    for (var i=0;i < NUM_ITEMS; i++)
    {
    	if (id == arrPin[i].locid)
    	{
		    document.getElementById((i+1).toString()).className = 'gridIcon';
	        return;
    	}
    }
}

function AddPushpins()
{
    for (x = 0; x < arrPin.length; x++)
    {
        var pin = BuildPushpin(arrPin[x].locid,arrPin[x].region,arrPin[x].site,arrPin[x].location,arrPin[x].state,arrPin[x].desc,arrPin[x].img,arrPin[x].hot,arrPin[x].hotlink,arrPin[x].pkg,arrPin[x].pkglink,arrPin[x].cat,arrPin[x].lat,arrPin[x].lng,arrPin[x].customIcon);
        map.AddShape(pin);
        arrPin[x].pinid = pin.GetID();
    }
}

function BuildPushpin(locid,region,site,location,state,desc,img,hot,hotlink,pkg,pkglink,cat,lat,lng,customIcon)
{
    var loc = new VELatLong(lat,lng);
    var title = "<table border='0' cellpadding='0' cellspacing='0' style='width:100%'><tr><td align='left' valign='top' style='width:16px;'><span style='padding: 1px 3px 1px 3px; margin: 2px; border: 1px solid #EEE; font-weight: bold; background-color: #4985c7; color: #FFF;'></span></td><td align='left' valign='top' style='text-align:left; padding-left:6px;'><a href='' style='text-decoration:none; border:0px; font-weight:bold; text-align:left; color:#4985c7'></a></td><td align='right' valign='top' style='width:41px; height:34px; padding-left:4px;'></td></tr></table>";
    if (reg == "indy")
    {
        var description = "<div style='margin-left:0;'><table border='0' cellpadding='0' cellspacing='0' width='300'><tr><td align='left' valign='top' style='font-family:arial; font-size:11; color:#333333; padding-left:6px; padding-top:7px; text-align:left;'><b>" + location + ":&nbsp;&nbsp;"+ site +"</b></td></tr></table></div>";
    }
    else
    {
        var description = "<div style='margin-left:0;'><table border='0' cellpadding='0' cellspacing='0' width='300'><tr><td align='left' valign='top' style='font-family:arial; font-size:11; color:#333333; padding-left:6px; padding-top:7px; text-align:left;'><b>" + location + ", "+ state +"</b></td></tr></table></div>";
    }
    if (navigator.userAgent.indexOf("Firefox") != -1)
    {
		if (reg == "indy")
		{
		    var description = "<div style='margin-left:0;'><table border='0' cellpadding='0' cellspacing='0' width='300'><tr><td align='left' valign='top' style='font-family:arial; font-size:11; color:#333333; padding-left:6px; padding-top:0px; text-align:left;'><b>" + location + ":&nbsp;&nbsp;"+ site +"</b></td></tr></table></div>";
        }
        else
        {
            var description = "<div style='margin-left:0;'><table border='0' cellpadding='0' cellspacing='0' width='300'><tr><td align='left' valign='top' style='font-family:arial; font-size:11; color:#333333; padding-left:6px; padding-top:0px; text-align:left;'><b>" + location + ", "+ state +"</b></td></tr></table></div>";
        }
    }
    if (navigator.userAgent.indexOf("MSIE 7") != -1)
    {
        if (reg == "indy")
        {
            var description = "<div style='margin-left:0;'><table border='0' cellpadding='0' cellspacing='0' width='300'><tr><td align='left' valign='top' style='font-family:arial; font-size:11; color:#333333; padding-left:6px; padding-top:7px; text-align:left;'><b>" + location + ":&nbsp;&nbsp;"+ site +"</b></td></tr></table></div>";
        }
        else
        {
            var description = "<div style='margin-left:0;'><table border='0' cellpadding='0' cellspacing='0' width='300'><tr><td align='left' valign='top' style='font-family:arial; font-size:11; color:#333333; padding-left:6px; padding-top:7px; text-align:left;'><b>" + location + ", "+ state +"</b></td></tr></table></div>";
        }
    }
    var homeIcon = customIcon;
	
    var shape = new VEShape(VEShapeType.Pushpin, loc);
    shape.SetCustomIcon(homeIcon);
    shape.SetTitle(title);
    shape.SetDescription(description);
    return shape;
}

function buildLinks()
{
    for (i=0; i < NUM_ITEMS; i++)
    {
	    var num_str = Number(i+1).toString();
	    buttonAry[i] = document.getElementById("button" + num_str);
	    holdingAry[i] = document.getElementById("linkHolder" + num_str);
	    icons[i] = document.createElement("div");
	    icons[i].className = "gridIcon";
	    icons[i].setAttribute('id',num_str);
	    icons[i].setAttribute('idx', i);
	    icons[i].longName = 'msftve_1000_20000' + i.toString() + '_1000' + i.toString();
	    icons[i].onmouseover = function(){GridShowInfoBox(this.longName,this.id);swapClass(featureLinkAry[this.idx].id,'on');};
	    icons[i].onmouseout = function(){GridHideInfoBox(this.longName,this.id);swapClass(featureLinkAry[this.idx].id,'off');};
	    var textnode = document.createTextNode(num_str);
	    icons[i].appendChild(textnode);
	    buttonAry[i].appendChild(icons[i]);
	    featureLinkAry[i] = document.createElement("a");
	    featureLinkAry[i].id = "fl_"+arrPin[i].locid;
	    featureLinkAry[i].idx = i;
	    featureLinkAry[i].longName = icons[i].longName;
	    featureLinkAry[i].className="linkHolder";
	    featureLinkAry[i].onmouseover = function(){GridShowInfoBox(this.longName,(this.idx+1).toString());swapClass(featureLinkAry[this.idx].id,'on');};
	    featureLinkAry[i].onmouseout = function(){GridHideInfoBox(this.longName,(this.idx+1).toString());swapClass(featureLinkAry[this.idx].id,'off');};
	    featureLinkAry[i].onclick = function(){setCurrentLocation((this.idx+1).toString(),this.id,this.longName);getPricing(arrPin[this.idx].desc,arrPin[this.idx].hot,arrPin[this.idx].pkg,arrPin[this.idx].hotlink,arrPin[this.idx].pkglink,arrPin[this.idx].cat,arrPin[this.idx].location,arrPin[this.idx].site,arrPin[this.idx].region);};
	    featureLinkAry[i].desc = arrPin[i].desc;
	    featureLinkAry[i].hotel = arrPin[i].hot;
	    featureLinkAry[i].hotellink = arrPin[i].hotlink;
	    featureLinkAry[i].pkgprice = arrPin[i].pkg;
	    featureLinkAry[i].pkglink = arrPin[i].pkglink;
	    featureLinkAry[i].categ = arrPin[i].cat;
	    featureLinkAry[i].location = arrPin[i].location;
	    featureLinkAry[i].site = arrPin[i].site;
	    featureLinkAry[i].region = arrPin[i].region;
	    if (reg == "indy")
	    {
	        gridDiv[i] = document.createElement("div");
	        if (g_firefox)
	        {
	            gridDiv[i].style.cssText = "vertical-align:top;position:relative;margin-top:-18px;";  
	        }
	        else
	        {
	            gridDiv[i].style.cssText = "vertical-align:top; text-align:left;";
	        }
	        
			gridDiv[i].innerHTML = "<strong>"+arrPin[i].location+"</strong><br />"+arrPin[i].site;
			featureLinkAry[i].appendChild(gridDiv[i]);
			holdingAry[i].appendChild(featureLinkAry[i]);
	    }
	    else
	    {
	        var feature_tn = document.createTextNode(arrPin[i].location + ", " + arrPin[i].state);
	        featureLinkAry[i].appendChild(feature_tn);
	        holdingAry[i].appendChild(featureLinkAry[i]);
        }
    }
}



function getPricing(description,hotel,packageprice,hotellink,pkglink,category,location,site,region)
{
    document.getElementById("locationDescription").innerHTML = description;
    if (reg == "indy")
    {
        var salelink = "<a href='/daily/vacations/summerofadventure/sale/"+region+"/default.asp?dest="+location+"'><img src='http://media.expedia.com/media/content/expus/graphics/promos/deals/tripfinder/indy/tripfinder_button_see_details.gif' style='width:86px;height:21px;border:0px;'></a>";
        
        //document.getElementById("site").innerHTML = site;
        document.getElementById("cost").innerHTML = hotel;
        document.getElementById("descpara").innerHTML = packageprice;
        document.getElementById("details").innerHTML = salelink;
    }
    else
    {
        if (hotel != undefined)
        {
            document.getElementById("pricing").style.display = "";
            document.getElementById("hotel").innerHTML = "<a href ='"+ hotellink +"' onmouseover='this.className=\"priceHolderHover\";' onmouseout='this.className=\"priceHolder\";' class='priceHolder'>$"+hotel+"</a>";
            document.getElementById("package").innerHTML = "<a href ='"+ pkglink +"' onmouseover='this.className=\"priceHolderHover\";' onmouseout='this.className=\"priceHolder\";' class='priceHolder'>$"+packageprice+"</a>";
        }
        document.getElementById("features").innerHTML = category;
    }
}
function getFrame(link)
{            
    document.getElementById("priceFrame").src = link;
    document.getElementById("priceFrame").style.cssText = "display:block;background-color:Transparent;";
}

function setCurrentLocation(gridIconId, linkId, pinId)
{
    for (var i = 0; i < arrPin.length; i++)
    {
        var gridIcon = arrPin[i].pinpos+1;
        document.getElementById(gridIcon).className="gridIcon";
        
        var link = "fl_"+arrPin[i].locid;
        document.getElementById(link).className="linkHolder";
        
        var pin = map.GetShapeByID(arrPin[i].pinid);
        pin.SetZIndex(1000);
		if (pin)
        {
            var customIcon = "<div class='pinImgOff' onmouseover='this.className=\"pinImgOn\";' onmouseout='this.className=\"pinImgOff\";'>"+gridIcon+"</div>";
            pin.SetCustomIcon(customIcon);
        }	            
    }
    currentLocation.gridIconID = gridIconId;
    currentLocation.linkID = linkId;
    currentLocation.pinID = pinId;

    document.getElementById(gridIconId).className="gridIconOff";
    document.getElementById(linkId).className="linkHolder linkHolderHover"; 

    var pin = map.GetShapeByID(pinId); 
    pin.SetZIndex(2000);   

	if (pin)
    {
        var customIcon = "<div class='pinImgOn'>"+gridIconId+"</div>";
        pin.SetCustomIcon(customIcon);
    }
    if (isCmdFromFlash)
        isCmdFromFlash = false;
    else if (!isFirstLoad)
        setTimeout("flashSetCurrent(" + gridIconId + ");", 100);
    isFirstLoad = false;
}

function CenterPin()
{
	panningBehavior = true;
	map.SetCenter(panningpin.GetIconAnchor());
}

function OnMapMoved()
{
	if (panningBehavior)
	{
	    if (showInfoboxFromGrid == true)
	    {
		    setTimeout("map.ShowInfoBox(panningpin)",10);
		}
	}
	panningBehavior = false;
}

function GridShowInfoBox(obj,pid)
{
	for (var x = 0; x < pid.length; x++)
	{
	    if (pid != "")
	    {
	        document.getElementById(pid).className = "gridIconOff";
	    }
	}
	
	var pin = map.GetShapeByID(obj);
    pin.SetZIndex(2000);
    if (pin)
    {
		var customIcon = "<div class='pinImgOn' onmouseover='this.className=\"pinImgOn\";' onmouseout='this.className=\"pinImgOff\";'>"+pid+"</div>";
        pin.SetCustomIcon(customIcon);
		
		var shapeLat = Math.round(pin.GetIconAnchor().Latitude);
		var shapeLng = Math.round(pin.GetIconAnchor().Longitude);
		var mapLat = Math.round(map.GetCenter().Latitude);
		var mapLng = Math.round(map.GetCenter().Longitude);
		if(shapeLat == mapLat && shapeLng == mapLng)
		{
//				    if (showInfoboxFromGrid == true)
//				    {
//					    map.ShowInfoBox(pin);
//					}
		}
		else
		{
			panningpin = pin;
			panningDelay = setTimeout("CenterPin()",1000);
		}
    }
}

function GridHideInfoBox(obj,pid)
{
    clearTimeout(panningDelay);
	for (var x = 0; x < pid.length; x++)
	{
	    if (pid != "" && obj != currentLocation.pinID)
	    {
	        document.getElementById(pid).className = "gridIcon";
	    }
	}
	if (obj != currentLocation.pinID)
	    {
	    var pin = map.GetShapeByID(obj);
        pin.SetZIndex(1000);
        if (pin)
        {
		    var customIcon = "<div class='pinImgOff' onmouseover='this.className=\"pinImgOn\";' onmouseout='this.className=\"pinImgOff\";'>"+pid+"</div>";
            pin.SetCustomIcon(customIcon);
        }
    }
}       

function truncate(txt,region,locid)
{
    var len = 150;
    var p = txt;
    if (p)
    {
        var trunc = p;
        if (trunc.length > len)
        {
	        trunc = trunc.substring(0, len);
	        trunc = trunc.replace(/\w+$/, '');
	        trunc += '... <a href="sites.asp?region='+region+'&locid='+locid+'" class="sitepageLinkOff" onmouseover="this.className=\'sitepageLinkOn\';" onmouseout="this.className=\'sitepageLinkOff\';" style="text-decoration:underline;">More info&nbsp;</a><img src="http://media.expedia.com/media/content/expus/graphics/promos/deals/wh_arrow-sm.gif">';
	        return trunc;
        }
    }
}
function truncateLoc(txt)
{
    var len = 32;
    var p = txt;
    if (p)
    {
        var trunc = p;
        if (trunc.length > len)
        {
	        trunc = trunc.substring(0, len);
	        trunc = trunc.replace(/\w+$/, '');
	        trunc += "...";
	        return trunc;
        }
    }
}  

function swapClass(id,state)
{
    if (id != currentLocation.linkID)
    {
        if (state == 'on')
        {
            document.getElementById(id).className="linkHolder linkHolderHover";
        }
        else
        {
          document.getElementById(id).className="linkHolder";  
        }
    }
}

function SetZIndex(shape,delta)
{
	if (shape && shape.GetPrimitive)
	{
		var shapeElem = document.getElementById(shape.GetPrimitive(0).iid);
		if (shapeElem && shapeElem.style)
		{
			shapeElem.style.zIndex = parseInt(shapeElem.style.zIndex) + delta;
		}
	}
}
      
function addEvent(obj,evType,fn){if(obj.addEventListener){obj.addEventListener(evType,fn,false);return true;}else if(obj.attachEvent){var r=obj.attachEvent("on"+evType,fn);return r;}else{return false;}}

addEvent(window, 'load', loadXML);
