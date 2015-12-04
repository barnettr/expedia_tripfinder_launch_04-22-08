<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Language" content="en-us" />
<meta http-equiv="Content-type" content="text/html; charset=iso-8859-1"/>
<META NAME="keywords" content="resort, cheap hotels, motel reservations, Cheap Hotel Rates, Discount Hotel Reservation, Discount Hotel Rooms, Cheap Hotel, Hotel Rates, Hotel Reservation, Discount Hotel, Hotel Rooms" />
<META NAME="description" content="Cheap Hotel Rates, Expedia.com is the premier online travel planning site. Discount Hotel Reservation, purchase airline tickets online, find vacation packages, and make hotel and car reservations, find maps, destination information, travel news and more." />

<title>Trip Finder</title>



<%
    Dim friendly, friendlytxt
    Dim linkURL : linkURL = Request.QueryString("xml")
    Dim friendlyimage : friendlyimage = "http://media.expedia.com/media/content/expus/graphics/promos/deals/tripfinder/title_" &  Request("category") & ".png"
    Dim background : background = "http://media.expedia.com/media/content/expus/graphics/promos/deals/trip_finder_" & Request("region") & "_tab_bg.jpg"
    Dim mapbackground : mapbackground =  "http://media.expedia.com/media/content/expus/graphics/promos/deals/" & Request("region") & "_map_bg.gif"
    Dim cat : cat = LCase(Request.QueryString("category"))
    Dim reg : reg = Request.QueryString("region")
    If UCase(reg) = "US" Then reg = UCase(reg) End If
    Dim numID : numID = Request("friendly")
    If (numID = "13") Then friendly = "Indiana Jones Travel Experiences" End If
    If (numID = "1") Then 
        friendly = "All-inclusive Hot Spots"
        friendlytxt = "Luxuriate in the sun and let your worries slip away. These resort escapes include your room, meals, drinks, and activities, all covered for one price."
    End If
    If (numID Mod 12 = "2") Then 
        friendly = "Amusement/Theme Parks"
        friendlytxt = "Blast into a vacation where the rides leave you breathless. These unique destinations offer attractions for the whole family to enjoy." 
    End If
    If (numID Mod 12 = "3") Then 
        friendly = "Beach & Island Escapes"
        friendlytxt = "Craving the gentle rhythm of ocean waves? These relaxing destinations promise sandy beaches, swaying palms, and remote coves ideal for bare feet." 
    End If
    If (numID Mod 12 = "4") Then 
        friendly = "Bright Lights, Big Cities"
        friendlytxt = "Embark on an urban adventure. For spectacular skylines, world class shopping, fine dining, entertainment, and art, these urban hot spots have it all." 
    End If
    If (numID Mod 12 = "5") Then 
        friendly = "Casinos Galore"
        friendlytxt = "Here's where to experience the thrill of a winning poker hand or a lucky roll of the dice. High rollers and low-stakes players welcome." 
    End If
    If (numID Mod 12 = "6") Then 
        friendly = "Food & Wine / Culinary Adventures"
        friendlytxt = "There are those with a taste for adventure, and those with adventurous tastes. These getaways cater to travelers searching for the culinary experience of a lifetime." 
    End If
    If (numID Mod 12 = "7") Then 
        friendly = "Golf Getaways"
        friendlytxt = "Play fairways rich in history and heritage. The world's most exclusive courses exemplify these resort destinations catering to the discerning golfer." 
    End If
    If (numID Mod 12 = "8") Then 
        friendly = "The Great Outdoors"
        friendlytxt = "Pack your kayak, mountain bike, snow board, or rugged boots for these vacation destinations for the avid outdoor enthusiast. Don't forget your sense of adventure." 
    End If
    If (numID Mod 12 = "9") Then 
        friendly = "Historical & Cultural Experiences"
        friendlytxt = "Walk in the footsteps of those who moved the world. These enriching adventures offer awe-inspiring art and opportunities to live history." 
    End If
    If (numID Mod 12 = "10") Then 
        friendly = "Resort & Spa Locales"
        friendlytxt = "Refocus. Find peace. Treat your body and soul to revitalizing sensory experiences at these luxurious resort escapes." 
    End If
    If (numID Mod 12 = "11") Then 
        friendly = "Romantic Retreats"
        friendlytxt = "Fall in love over and over again. These gorgeous destinations provide sublime settings for your  romantic getaway." 
    End If
    If (numID Mod 12 = "0") Then friendly = "" End If
%>  
	<style type="text/css">
	BODY {background-color:#7190bc !important;}
<%   
    If InStr(1, Request.ServerVariables("HTTP_USER_AGENT"), "MSIE 7.0") Then
%>    
    .customInfoBox-beak,.customInfoBox-progressAnimation {visibility:inherit !important; z-index:3000 !important;top:-5px !important;left:-18px !important;}
    .customInfoBox-body {
    border:1px solid #330000 !important;
    left:-22px;
    overflow:visible !important;
    position:relative;
    top:-3px;
    width:308px;
    height:20px;
    background-color:#ffcc66 !important;
}
    .pinImgOff {
    width:23px;
    height:19px !important;
    filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(
    src='http://media.expedia.com/media/content/expus/graphics/promos/deals/map_number_bg_default.png', sizingMethod='scale'); 
    color: #330000;
    font-family:arial, Sans-Serif;
    text-align:center;
    font-size:11px;
    font-weight:bold;
    padding-top:6px;
    padding-right:2px;
    cursor:pointer;
}

    .pinImgOn {
    width:23px;
    height:19px !important;
    filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(
    src='http://media.expedia.com/media/content/expus/graphics/promos/deals/map_number_bg_hover.png', sizingMethod='scale');
    color: #f9edb9;
    font-family:arial, Sans-Serif;
    text-align:center;
    font-size:11px;
    font-weight:bold;
    padding-top:6px;
    cursor:pointer;
}
.gridIcon{
	 background-image: url(http://media.expedia.com/media/content/expus/graphics/promos/deals/map_number_bg_default.gif);
	 background-repeat: no-repeat;
	 height: 22px;
	 padding-top:4px;
	 padding-right:4px !important;
	 width: 23px;
	 cursor:pointer;
	 color:#330000;
	}
	.gridIconOff{
	 background-image: url(http://media.expedia.com/media/content/expus/graphics/promos/deals/map_number_bg_hover.gif);
	 background-repeat: no-repeat;
	 color: #f9edb9;
	 height: 22px;
	 padding-top:4px;
	 padding-right:4px !important;
	 width: 23px;
	 cursor:pointer;
	}

<% 
    End If
%>

	.linkHolder {font-family: arial, helvetica, sans serif;font-size:12px;font-weight:bold;cursor:pointer; padding-left:2px;color:#330000 !important;text-decoration:none;}
    .linkHolderHover{color:#990000 !important;text-decoration:underline;}
    .priceHolder {font-family: arial, helvetica, sans serif;font-size:12px;font-weight:bold;cursor:pointer; color:#330000 !important;text-decoration:underline;}
    .priceHolderHover{color:#990000 !important;text-decoration:underline;}
    .priceLink{color:#330000 !important;text-decoration:underline;font-family:arial,helvetica,sans serif;font-size:12px;font-weight:normal;}
    .priceLinkHover{color:#990000 !important;text-decoration:underline;}
	.gridIcon{
	 background-image: url(http://media.expedia.com/media/content/expus/graphics/promos/deals/map_number_bg_default.gif);
	 background-repeat: no-repeat;
	 height: 22px;
	 padding-top:4px;
	 padding-left:0px;
	 width: 23px;
	 cursor:pointer;
	 color:#330000;
	}
	.gridIconCell{
	 font-family: Arial,sans-serif;
	 font-size: 11px;
	 font-weight: bold;
	 color: #f9edb9;
	 padding-left: 4px;
	 text-align: center;
	}
	.gridIconOff{
	 background-image: url(http://media.expedia.com/media/content/expus/graphics/promos/deals/map_number_bg_hover.gif);
	 background-repeat: no-repeat;
	 color: #f9edb9;
	 height: 22px;
	 padding-top:4px;
	 padding-left:0px;
	 width: 23px;
	 cursor:pointer;
	}     
	.ftrCapt {color:#fef3c6 !important;}
	</style>

</head>    
<!--#include virtual="/daily/prod/common/header.asp"-->
<link rel="stylesheet" type="text/css" href="/daily/styles/core.css?v=4" />
<link rel="stylesheet" type="text/css" href="/daily/styles/mainwide.css?v=1" />

<div id="divTFContent" style="background-image:url(<%= background %>); background-repeat: no-repeat;top:0px;width:992px;height:1066px;position:relative;">
	
	<script type="text/javascript" src="http://dev.virtualearth.net/mapcontrol/mapcontrol.ashx?v=6"></script>
	<script language="javascript" type="text/javascript">
		
		var map = null;
		var latLon = new VELatLong(39.394111, -97.074532);
		<% If Request("region") = "intl" Then %>
		zoom = 1;
		<% Else %>
		zoom = 3;
		<% End If %>
		var cat = "<%= cat %>"
		var reg = "<%= reg %>"
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
		
		if (cat == "casinos")
		{
		    var NUM_ITEMS = 8;
		}
		else if (cat == "familyfun" && reg == "intl")
		{
		    var NUM_ITEMS = 8;
		}
		else
		{
		    var NUM_ITEMS = 10;
		}
		var buttonAry = new Array();
		var holdingAry = new Array();
		var icons = new Array();
		var featureLinkAry = new Array();
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
            xmlDoc.open('GET','tripfinderxml.asp?cat=<%= cat %>&reg=<%= reg %>',true);
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
	        <%
	            If Request.QueryString("dest") <> "" Then
	                sStartId = Request.QueryString("dest")
	            Else
	                sStartId = "1"
	            End If
	            sStart = CStr(CInt(sStartId) - 1)
	        %>
	            
	        setCurrentLocation('<%=sStartId%>',featureLinkAry[<%=sStart%>].id,featureLinkAry[<%=sStart%>].longName);
	        getPricing(arrPin[<%=sStart%>].desc,arrPin[<%=sStart%>].hot,arrPin[<%=sStart%>].pkg,arrPin[<%=sStart%>].hotlink,arrPin[<%=sStart%>].pkglink,arrPin[<%=sStart%>].cat,arrPin[<%=sStart%>].location,arrPin[<%=sStart%>].region);	        
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
			    var location = document.getElementById(fl).location;
			    var region = document.getElementById(fl).region;
			    getPricing(desc,hotel,pkgprice,hotellink,pkglink,categ,location,region);
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
	        //var title = "<table border='0' cellpadding='0' cellspacing='0' style='width:100%'><tr><td align='left' valign='top' style='width:16px;'><span style='padding: 1px 3px 1px 3px; margin: 2px; border: 1px solid #EEE; font-weight: bold; background-color: #4985c7; color: #FFF;'>" + locid + "</span></td><td align='left' valign='top' style='text-align:left; padding-left:6px;'><a href='' style='text-decoration:none; border:0px; font-weight:bold; text-align:left; color:#4985c7'>" + site + "</a></td><td align='right' valign='top' style='width:41px; height:34px; padding-left:4px;'></td></tr></table>"
	        var title = "<table border='0' cellpadding='0' cellspacing='0' style='width:100%'><tr><td align='left' valign='top' style='width:16px;'><span style='padding: 1px 3px 1px 3px; margin: 2px; border: 1px solid #EEE; font-weight: bold; background-color: #4985c7; color: #FFF;'></span></td><td align='left' valign='top' style='text-align:left; padding-left:6px;'><a href='' style='text-decoration:none; border:0px; font-weight:bold; text-align:left; color:#4985c7'></a></td><td align='right' valign='top' style='width:41px; height:34px; padding-left:4px;'></td></tr></table>"
	        //var description = "<div style='margin-left:0;'><table border='0' cellpadding='0' cellspacing='0' width='300'><tr><td align='left' valign='top' style='font-family:arial; font-size:11; color:#333333; padding-left:6px; padding-top:7px; text-align:left;'><a href='sites.asp?region="+region+"&locid="+locid+"' class='infoBoxLinkOff' onmouseover='this.className=\"infoBoxLinkOn\";' onmouseout='this.className=\"infoBoxLinkOff\";'><b>" + site + "</b></a> </td></tr></table></div>";
	        var description = "<div style='margin-left:0;'><table border='0' cellpadding='0' cellspacing='0' width='300'><tr><td align='left' valign='top' style='font-family:arial; font-size:11; color:#333333; padding-left:6px; padding-top:7px; text-align:left;'><b>" + location + ", "+ state +"</b></td></tr></table></div>";
	        if (navigator.userAgent.indexOf("Firefox") != -1)
	        {
	            //var description = "<div style='margin-left:0;'><table border='1' cellpadding='0' cellspacing='0' width='300'><tr><td align='left' valign='top' style='font-family:arial; font-size:11; color:#333333; padding-left:6px; padding-top:7px; text-align:left;'><a href='javascript:this.map.HideInfoBox();'><img src='http://media.expedia.com/media/content/expus/graphics/promos/deals/wh_close.gif' align='right' style='margin-left:3px;' id='close'></a><a href='sites.asp?region="+region+"&locid="+locid+"' class='infoBoxLinkOff' onmouseover='this.className=\"infoBoxLinkOn\";' onmouseout='this.className=\"infoBoxLinkOff\";'><b>" + site + "</b></a> </td></tr></table></div>";
				//var description = "<div style='margin-left:0;'><table border='0' cellpadding='0' cellspacing='0' width='300'><tr><td align='left' valign='top' style='font-family:arial; font-size:11; color:#333333; padding-left:6px; padding-top:7px; text-align:left;'><a href='sites.asp?region="+region+"&locid="+locid+"' class='infoBoxLinkOff' onmouseover='this.className=\"infoBoxLinkOn\";' onmouseout='this.className=\"infoBoxLinkOff\";'><b>" + site + "</b></a> </td></tr></table></div>";
				var description = "<div style='margin-left:0;'><table border='0' cellpadding='0' cellspacing='0' width='300'><tr><td align='left' valign='top' style='font-family:arial; font-size:11; color:#333333; padding-left:6px; padding-top:0px; text-align:left;'><b>" + location + ", "+ state +"</b></td></tr></table></div>";
	        }
	        if (navigator.userAgent.indexOf("MSIE 7") != -1)
            {
                var description = "<div style='margin-left:0;'><table border='0' cellpadding='0' cellspacing='0' width='300'><tr><td align='left' valign='top' style='font-family:arial; font-size:11; color:#333333; padding-left:6px; padding-top:7px; text-align:left;'><b>" + location + ", "+ state +"</b></td></tr></table></div>";
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
			    featureLinkAry[i].onclick = function(){setCurrentLocation((this.idx+1).toString(),this.id,this.longName);getPricing(arrPin[this.idx].desc,arrPin[this.idx].hot,arrPin[this.idx].pkg,arrPin[this.idx].hotlink,arrPin[this.idx].pkglink,arrPin[this.idx].cat,arrPin[this.idx].location,arrPin[this.idx].region);};
			    featureLinkAry[i].desc = arrPin[i].desc;
			    featureLinkAry[i].hotel = arrPin[i].hot;
			    featureLinkAry[i].hotellink = arrPin[i].hotlink;
			    featureLinkAry[i].pkgprice = arrPin[i].pkg;
			    featureLinkAry[i].pkglink = arrPin[i].pkglink;
			    featureLinkAry[i].categ = arrPin[i].cat;
			    featureLinkAry[i].region = arrPin[i].region;
			    var feature_tn = document.createTextNode(arrPin[i].location + ", " + arrPin[i].state);
			    featureLinkAry[i].appendChild(feature_tn);
			    holdingAry[i].appendChild(featureLinkAry[i]);
            }
        }

        
        
        function getPricing(description,hotel,packageprice,hotellink,pkglink,category,location,region)
        {
            document.getElementById("locationDescription").innerHTML = description;
            var newdescription = document.getElementById("locationDescription").innerHTML.replace("&amp;#174;", "®");
            //newdescription += newdescription.replace("Â", "");
            //document.getElementById("locationDescription").innerHTML = newdescription;
            //newdescription = document.getElementById("locationDescription").innerHTML.replace("Â", "");
            //alert(newdescription);
            document.getElementById("locationDescription").innerHTML = newdescription;
            if (hotel != undefined)
            {
                var salelink = "/daily/vacations/summerofadventure/sale/"+region+"/default.asp?dest="+location;
                document.getElementById("pricing").style.display = "";
                document.getElementById("hotel").innerHTML = "<a href ='"+ salelink +"' onmouseover='this.className=\"priceHolderHover\";' onmouseout='this.className=\"priceHolder\";' class='priceHolder'>$"+hotel+"</a>";
                document.getElementById("package").innerHTML = "<a href ='"+ salelink +"' onmouseover='this.className=\"priceHolderHover\";' onmouseout='this.className=\"priceHolder\";' class='priceHolder'>$"+packageprice+"</a>";
            }
            document.getElementById("features").innerHTML = category;
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
	</script>
	<style type="text/css">
    .MSVE_ZoomBar {
        background-color:#5a7a9b;
        color:ffffff;
        filter:alpha(opacity=10);
        opacity:0.1;
    </style>
	

        <script language="javascript" src="/daily/js/flash.js"></script>
        <script language="vbscript" src="/daily/js/flash.vbs"></script>
		<script language="javascript">AC_FL_RunContent = 0;</script>
        <script src="/daily/prod/js/AC_RunActiveContent.js" language="javascript"></script>
        <script language="javascript" type="text/javascript">
        function getFlashMovie(movieName) {
            var isIE = navigator.appName.indexOf("Microsoft") != -1;
            return (isIE) ? window[movieName] : document[movieName];
        }
         
        function flashSetCurrent(num) {
            getFlashMovie("tfnav").flashSetCurrent(num);
        }

        function destChangeFromFlash(num) {
            var idx = num - 1;
            setTimeout("isCmdFromFlash=true;setCurrentLocation('" + num.toString() + "', 'fl_'+arrPin[" + idx.toString() + "].locid, featureLinkAry[" + idx.toString() + "].longName);", 700);
            getPricing(arrPin[idx].desc, arrPin[idx].hot, arrPin[idx].pkg, arrPin[idx].hotlink, arrPin[idx].pkglink, arrPin[idx].cat, arrPin[idx].location, arrPin[idx].region);            
            GridShowInfoBox("'fl_'+arrPin[" + idx.toString() + "].locid, featureLinkAry[" + idx.toString() + "].longName")
        }

        function jsTrace(str)
        {
	        alert(str);
        }

        </script>





<% 
    If InStr(1, Request.ServerVariables("HTTP_USER_AGENT"), "MSIE") Then

%>
	<link title="combined" rel="stylesheet" type="text/css" media="screen" href="gridview.css" />
	<link title="combined" rel="stylesheet" type="text/css" media="screen" href="sites.css" />
<% 
    Else
%>
    <link title="combined" rel="stylesheet" type="text/css" media="screen" href="gridview_ff.css" />
    <link title="combined" rel="stylesheet" type="text/css" media="screen" href="sites_ff.css" />
<% 
    End If
    If InStr(1, Request.ServerVariables("HTTP_USER_AGENT"), "MSIE 7.0") Then
%>
  <style type="text/css">
    .customInfoBox-beak,.customInfoBox-progressAnimation {visibility:inherit !important; z-index:3000 !important;top:-2px !important;left:-19px !important;}
    .customInfoBox-body {
    border:1px solid #330000 !important;
    left:-24px !important;
    overflow:visible !important;
    position:relative;
    top:-8px !important;
    width:308px;
    height:30px;
    background-color:#ffcc66 !important;
    }
    .pinImgOff {
    width:23px;
    height:19px !important;
    filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(
    src='http://media.expedia.com/media/content/expus/graphics/promos/deals/map_number_bg_default.png', sizingMethod='scale'); 
    color: #330000;
    font-family:arial, Sans-Serif;
    text-align:center;
    font-size:11px;
    font-weight:bold;
    padding-top:6px;
    padding-left:1px;
    cursor:pointer;
}

    .pinImgOn {
    width:23px;
    height:19px !important;
    filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(
    src='http://media.expedia.com/media/content/expus/graphics/promos/deals/map_number_bg_hover.png', sizingMethod='scale');
    color: #f9edb9;
    font-family:arial, Sans-Serif;
    text-align:center;
    font-size:11px;
    font-weight:bold;
    padding-top:6px;
    cursor:pointer;
}
.gridIcon{
	 background-image: url(http://media.expedia.com/media/content/expus/graphics/promos/deals/map_number_bg_default.gif);
	 background-repeat: no-repeat;
	 height: 22px;
	 padding-top:4px;
	 padding-right:4px !important;
	 width: 23px;
	 cursor:pointer;
	 color:#330000;
	}
	.gridIconOff{
	 background-image: url(http://media.expedia.com/media/content/expus/graphics/promos/deals/map_number_bg_hover.gif);
	 background-repeat: no-repeat;
	 color: #f9edb9;
	 height: 22px;
	 padding-top:4px;
	 padding-right:4px !important;
	 width: 23px;
	 cursor:pointer;
	}
	#wrapper{
    position:absolute;
    left:20px;
    top:245px !important;
    width:420px;
    }
    .soaTitle{
    font-family:arial;
    font-weight:bold; 
    font-size:14px; 
    color:#990000;
    text-align:center;
    /*padding-left:115px;*/
    margin-bottom:10px;
    position:absolute;
    top:40px;
    left:150px;
    }
  
  </style>
  <% End If %>  
<!--#include virtual="/daily/vacations/summerofadventure/tripfinder/breadcrumbs.asp"-->
<div id="marriott" style="width:124px; height:52px; z-index:10000; position:absolute; left:850px; top:16px; background-image:url(http://media.expedia.com/media/content/expus/graphics/promos/deals/tripfinder/marriott_logo.jpg); background-repeat:no-repeat;"></div>
<div id="heroTitle" style="width:365px; height:22px; z-index:10000; position:absolute; left:155px; top:44px; filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src='<%= friendlyimage %>', sizingMethod='scale');<%If g_bIE Then%><%Else%>background-image:url(<%= friendlyimage %>);<%End If%>"></div>
<div id="pageDescriptionFinder"><%= friendlytxt %></div>
<div id="catTitle">Choose a category</div>
<div id="dropdown" style="position:relative; top:100px; left:770px; border:solid 1px #330000;scrollbar-face-color:#330000;width:200px;">
<select id="ddlCategory" onChange="document.location=this.options[this.selectedIndex].value;" style="width:200px; font-size:11px;color:#330000;">
    <option value="indy.asp?category=experiences&region=indy&friendly=13"<% If cat = "experiences" Then Response.Write "selected=""selected""" End If %>>Indiana Jones Travel Experiences</option>
    <option value="finder.asp?category=hotspots&region=allinclusive&friendly=1"<% If cat = "hotspots" Then Response.Write "selected=""selected""" End If %>>All-inclusive Hot Spots</option>
    <option value="finder.asp?category=familyfun&region=US&friendly=2"<% If cat = "familyfun" Then Response.Write "selected=""selected""" End If %>>Amusement/Theme Parks</option>
    <option value="finder.asp?category=escapes&region=US&friendly=3"<% If cat = "escapes" Then Response.Write "selected=""selected""" End If %>>Beach & Island Escapes</option>
    <option value="finder.asp?category=cities&region=US&friendly=4"<% If cat = "cities" Then Response.Write "selected=""selected""" End If %>>Bright Lights, Big Cities</option>
    <option value="finder.asp?category=casinos&region=allinclusive&friendly=5"<% If cat = "casinos" Then Response.Write "selected=""selected""" End If %>>Casinos Galore</option>
    <option value="finder.asp?category=dining&region=US&friendly=6"<% If cat = "dining" Then Response.Write "selected=""selected""" End If %>>Food & Wine / Culinary Adventures</option>
    <option value="finder.asp?category=golf&region=US&friendly=7"<% If cat = "golf" Then Response.Write "selected=""selected""" End If %>>Golf Getaways</option>
    <option value="finder.asp?category=outdoors&region=US&friendly=8"<% If cat = "outdoors" Then Response.Write "selected=""selected""" End If %>>The Great Outdoors</option>
    <option value="finder.asp?category=historical&region=US&friendly=9"<% If cat = "historical" Then Response.Write "selected=""selected""" End If %>>Historical and Cultural Experiences</option>
    <option value="finder.asp?category=spas&region=US&friendly=10"<% If cat = "spas" Then Response.Write "selected=""selected""" End If %>>Resort & Spa Locales</option>
    <option value="finder.asp?category=retreats&region=US&friendly=11"<% If cat = "retreats" Then Response.Write "selected=""selected""" End If %>>Romantic Retreats</option>
    <!--<option value="finder.asp?category=retreats&region=US&friendly=12"<% If cat = "retreats" Then Response.Write "selected=""selected""" End If %>>Romantic Retreats</option>-->
</select>
</div>
<% 
    If cat = "experiences" OR cat = "hotspots" OR cat = "casinos" Then
	Else
%>
	<%If reg = "US" Then%>
	<div id="within" style="font-family: Arial,sans-serif;font-size: 14px;font-weight: bold;color: #330000; position:absolute;left:85px;top:150px;">Within the U.S.</div>
	<a href="finder.asp?category=<%= cat %>&region=intl&friendly=<%= (numID+12) %>" style="text-decoration:none; cursor:pointer;"><div id="beyond" style="font-family: Arial,sans-serif;font-size: 14px;font-weight: bold;color: #330000; position:absolute;left:300px;top:150px;">Beyond the U.S.</div></a>
	<%Else%>
	<a href="finder.asp?category=<%= cat %>&region=US&friendly=<%= (numID-12) %>" style="text-decoration:none; cursor:pointer;"><div id="within" style="font-family: Arial,sans-serif;font-size: 14px;font-weight: bold;color: #330000; position:absolute;left:85px;top:150px;">Within the U.S.</div></a>
	<div id="beyond" style="font-family: Arial,sans-serif;font-size: 14px;font-weight: bold;color: #330000; position:absolute;left:300px;top:150px;">Beyond the U.S.</div>
	<%End If%>
<% 
    End If 
%>
	<div id="container" style="margin-left:20px;">
	

    <div id="divLinksAndMap" style="position:relative;top:200px;">
    <table border="0" cellpadding="0" cellspacing="0" width="992">
	    <tr>
	        <td width="430">
	            <table border="0" cellpadding="0" cellspacing="0" width="430">
		            <tr>
	                    <td colspan="2" class="gridTitle">Choose a destination</td>
	                </tr>
		            <tr>
		                <td height="10" colspan="2" style="border-top:solid 1px #874815;">&nbsp;</td>
		            </tr>
		            <tr>
			            <td align="left" style="margin:0px; width:213px;">
				            <table border="0" cellpadding="2" cellspacing="0" width="100%">
					            <tr>
						            <td class="gridIconCell" id="button1"></td>
						            <td class="linkHolder" id="linkHolder1"></td>
					            </tr>
					            <tr>
						            <td class="gridIconCell" id="button2"></td>
						            <td class="linkHolder" id="linkHolder2"></td>
					            </tr>
					            <tr>
						            <td class="gridIconCell" id="button3"></td>
						            <td class="linkHolder" id="linkHolder3"></td>
					            </tr>
					            <tr>
						            <td class="gridIconCell" id="button4"></td>
						            <td class="linkHolder" id="linkHolder4"></td>
					            </tr>
					            <tr>
						            <td class="gridIconCell" id="button5"></td>
						            <td class="linkHolder" id="linkHolder5"></td>
					            </tr>
				            </table>
			            </td>
			            <td valign="top" align="left" style="margin:0px; width:209px;"">
				            <table border="0" cellpadding="2" cellspacing="0" width="100%">
				                <tr>
						            <td class="gridIconCell" id="button6"></td>
						            <td class="linkHolder" id="linkHolder6"></td>
					            </tr>
					            <tr>
						            <td class="gridIconCell" id="button7"></td>
						            <td class="linkHolder" id="linkHolder7"></td>
					            </tr>
					            <tr>
						            <td class="gridIconCell" id="button8"></td>
						            <td class="linkHolder" id="linkHolder8"></td>
					            </tr>
					            <tr>
						            <td class="gridIconCell" id="button9"></td>
						            <td class="linkHolder" id="linkHolder9"></td>
					            </tr>
					            <tr>
						            <td class="gridIconCell" id="button10"></td>
						            <td class="linkHolder" id="linkHolder10"></td>
					            </tr>
				            </table>
			            </td>
		            </tr>
                </table>
	            <br /><br />
	            <table border="0" cellpadding="0" cellspacing="0" width="430">
	                <tr>
	                    <td width="430">
	                        <div id="mapContainer" style="width:430px; height:456px; background-image:url(<%= mapbackground %>); background-repeat:no-repeat;">
	                            <div id="expediaLogo"></div>
	                            <div id="myMap" style="position:relative; width:410px; height:436px; margin-left:9px; margin-top:9px; border:solid 1px #979279;"></div>
                            </div>        
	                    </td>
	                </tr>
	            </table>
	        </td>
	    </tr>
	</table>
    </div>
    <div id="flashnav" style="position:absolute;top:246px;left:506px;width:468px;height:246;">
    <div id="wrapper">
	    <div id="locationDescription" class="description"></div>
        <div id="pricing" style="display:none;position:absolute;top:<%If g_bIE Then%>160<%Else%>170<%End If%>px;">
            <p id="soaTitle">Vacation Sale</p>
            <div id="hotels">Hotels from <span id="hotel"></span></div>
            <div id="packages">Packages from <span id="package"></span></div>
        </div>
        <div id="features" style="position:absolute;top:314px;width:420px"></div>
	</div>

    <script language="JavaScript" type="text/javascript">
    
    var hasRightVersion = DetectFlashVer(requiredMajorVersion, requiredMinorVersion, requiredRevision);
	if (hasRightVersion)
	{
	    AC_FL_RunContent(
			'codebase', 'http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,0,0',
			'width', '468',
			'height', '246',
			'src', 'http://media.expedia.com/media/content/expus/graphics/promos/deals/tripfinder/tfnav.swf',
			'quality', 'high',
			'pluginspage', 'http://www.macromedia.com/go/getflashplayer',
			'align', 'middle',
			'play', 'true',
			'loop', 'true',
			'scale', 'showall',
			'wmode', 'transparent',
			'devicefont', 'false',
			'id', 'indynav',
			'bgcolor', '#ffffff',
			'name', 'tfnav',
			'menu', 'true',
			'allowFullScreen', 'false',
			'allowScriptAccess','sameDomain',
			'movie', 'tfnav',
			'salign', '',
			'flashvars', '<%If Request.QueryString("dest") <> "" Then%>item=<%=Request.QueryString("dest")%>&<%End If%>cat=<%=cat%>&reg=<%=reg%>&xml=<%=Server.UrlEncode("/daily/vacations/summerofadventure/tripfinder/tripfinderxml.asp?cat=" & cat & "&reg=" & reg)%>'
			); //end AC code
	}    
    </script>
    
        
    </div>
    </div>
    </div>  
    <div id="divBottomContentContainer">
	<!--#include virtual="/daily/prod/common/footer.asp"-->
    </div>

</html>
<script language="javascript" type="text/javascript">

    
    if (navigator.userAgent.indexOf("MSIE 7") != -1)
    {
        document.getElementById("myMap").style.cssText = "position:relative;width:410px;height:436px;margin:10px 0px 0px 10px;";
    }
    if (navigator.userAgent.indexOf("Firefox") != -1)
    {
        if (reg == "allinclusive")
        {
            document.getElementById("flashnav").style.cssText = "position:absolute;top:206px;left:506px;width:468px;height:246;";
            document.getElementById("pricing").style.cssText = "position:absolute;top:160px;";
            document.getElementById("divLinksAndMap").style.cssText = "position:relative;top:150px;";
        }
        document.getElementById("myMap").style.cssText = "position:relative;width:410px;height:436px;margin:10px 0px 0px 10px;";
        //document.getElementById("expediaLogo").style.cssText = "display:block; position:absolute; top:480px; width:83px; height:24px; left:150px; z-index:30; background-image:url(http://media.expedia.com/media/content/expus/graphics/promos/deals/wh_exp_map_logo_83x24.png);";
    }
    if (navigator.userAgent.indexOf("MSIE") != -1)
    {
        if (reg == "allinclusive")
	    {
	        document.getElementById("flashnav").style.cssText = "position:absolute;top:206px;left:506px;width:468px;height:246;";
	        document.getElementById("soaTitle").style.cssText = "font-family:arial;font-weight:bold; font-size:14px; color:#990000;text-align:center;margin-bottom:10px;position:absolute;top:20px;left:150px;";
	        document.getElementById("hotels").style.cssText = "font-family:arial;font-weight:normal; font-size:12px; color:#330000;text-align:right;padding-right:80px;margin-bottom:5px;position:absolute;top:40px;right:10px;";
	        document.getElementById("packages").style.cssText = "font-family:arial;font-weight:normal; font-size:12px; color:#330000;text-align:right;padding-right:80px;position:absolute;top:60px;right:10px;"; 
	        document.getElementById("divLinksAndMap").style.cssText = "position:relative;top:150px;";
	    }
    }
    
    
</script>
