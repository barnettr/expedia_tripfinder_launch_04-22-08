<% 
    If InStr(1, Request.ServerVariables("HTTP_USER_AGENT"), "MSIE") Then

%>
	<link title="combined" rel="stylesheet" type="text/css" media="screen" href="indygridview.css" />
<% 
    Else
%>
    <link title="combined" rel="stylesheet" type="text/css" media="screen" href="gridview_ff.css" />
    <link title="combined" rel="stylesheet" type="text/css" media="screen" href="sites_ff.css" />
<% 
    End If
    
    Dim friendly
    Dim linkURL : linkURL = Request("xml")
    Dim background : background = "http://media.expedia.com/media/content/expus/graphics/promos/deals/trip_finder_" & Request("region") & "_tab_bg.jpg"
    Dim mapbackground : mapbackground =  "http://media.expedia.com/media/content/expus/graphics/promos/deals/" & Request("region") & "_map_bg.gif"
    Dim cat : cat = Request("category")
    Dim reg : reg = Request("region")
    Dim numID : numID = Request("friendly")
    If (numID = "13") Then friendly = "Indiana Jones Travel Experiences" End If
    If (numID = "1") Then friendly = "All-inclusive Hotspots" End If
    If (numID = "2") Then friendly = "Amusement/Theme Parks" End If
    If (numID = "3") Then friendly = "Beach & Island Escapes" End If
    If (numID = "4") Then friendly = "Bright Lights, Big Cities" End If
    If (numID = "5") Then friendly = "Casinos Galore" End If
    If (numID = "6") Then friendly = "Food & Wine / Culinary Adventures" End If
    If (numID = "7") Then friendly = "Golf Getaways" End If
    If (numID = "8") Then friendly = "Historical & Cultural Experiences" End If
    If (numID = "9") Then friendly = "Mountain Exploration" End If
    If (numID = "10") Then friendly = "Parks, Lakes, & Rivers" End If
    If (numID = "11") Then friendly = "Resort & Spa Locales" End If
    If (numID = "12") Then friendly = "Romantic Retreats" End If
    
%>

	
	<style type="text/css">
	.linkHolder {font-family: arial, helvetica, sans serif;font-size:12px;font-weight:normal;cursor:pointer; padding-left:2px;color:#330000 !important;text-decoration:none;}
    .linkHolderHover{color:#990000 !important;text-decoration:underline;}
    .spanTitle{padding-left:2px;font-family: arial, helvetica, sans serif;font-size:12px;font-weight:bold;cursor:pointer;color:#330000 !important;text-decoration:none;}
    .spanTitleHover{padding-left:2px;font-family: arial, helvetica, sans serif;font-size:12px;font-weight:bold;cursor:pointer;color:#990000 !important;text-decoration:none;}
	.gridIcon{
	 background-image: url(http://media.expedia.com/media/content/expus/graphics/promos/deals/map_number_bg_default.gif);
	 background-repeat: no-repeat;
	 height: 22px;
	 padding-top:4px;
	 padding-left:2px;
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
	 padding-left:2px;
	 width: 23px;
	 cursor:pointer;
	}     
	</style>
	<link rel="stylesheet" href="example.css" TYPE="text/css" MEDIA="screen">
	<script type="text/javascript" src="http://dev.virtualearth.net/mapcontrol/mapcontrol.ashx?v=6"></script>
	<script language="javascript" type="text/javascript">
		var map = null;
		var latLon = new VELatLong(39.394111, -97.074532);
		<% If Request("region") = "intl" Then %>
		zoom = 1;
		<% Else %>
		zoom = 1;
		<% End If %>
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
		currentLocation.spanID = "";

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
            xmlDoc.open('GET','tripfinderxml.asp?cat=<%= cat %>&reg=<%= reg %>',true);
            xmlDoc.send(null);
        }

        function parseXML()
        {
            if (xmlDoc.readyState == 4)
            {
                if (xmlDoc.status == 200)
                {
                    xmlDoc = xmlDoc.responseXML;
                    xmlObj = xmlDoc.getElementsByTagName("row");
		            for (var x = 0; x < xmlObj.length; x++)
		            {
		                var pin = new Object;
		                pin.pinpos = pinpos;
		                pin.locid = xmlObj[x].getAttribute("locid");		                
		                pin.region = xmlObj[x].getElementsByTagName("region")[0].text;
		                pin.location = xmlObj[x].getElementsByTagName("location")[0].text;		                        
		                pin.state = xmlObj[x].getElementsByTagName("state")[0].text;
		                pin.site = xmlObj[x].getElementsByTagName("site")[0].text;
                        pin.desc = xmlObj[x].getElementsByTagName("description")[0].text;
                        pin.img = xmlObj[x].getElementsByTagName("image")[0].text;
                        pin.cat = xmlObj[x].getElementsByTagName("categories")[0].text;
                        try
                        {
                            pin.hot = xmlObj[x].getElementsByTagName("hotelprice")[0].text
                            pin.hotlink = xmlObj[x].getElementsByTagName("hotellink")[0].text
                            pin.pkg = xmlObj[x].getElementsByTagName("pkgprice")[0].text
                            pin.pkglink = xmlObj[x].getElementsByTagName("pkglink")[0].text
                        }
                        catch (e)
				        {
				            for(i=0; i<e.length; i++)
				                return false;
				        }
		                pin.lat = xmlObj[x].getAttribute("lat");                        
		                pin.lng = xmlObj[x].getAttribute("long"); 
		                 
                        pin.customIcon = "<div class='pinImgOff' onmouseover='this.className=\"pinImgOn\";' onmouseout='this.className=\"pinImgOff\";'>"+(pinpos+1)+"</div>";
 
		                arrPin[pinpos] = pin;
		                pinpos++
		            }
		            GetMap();
                }
            }
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
			    var spanID = (gridID+10);
			    getPricing(desc,hotel,pkgprice,hotellink,pkglink,categ);
			    setCurrentLocation(gridID,fl,e.elementID,spanID);
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
	        var description = "<div style='margin-left:0;'><table border='0' cellpadding='0' cellspacing='0' width='300'><tr><td align='left' valign='top' style='font-family:arial; font-size:11; color:#333333; padding-left:6px; padding-top:7px; text-align:left;'><b>" + location + " - " + site +"</b></td></tr></table></div>";
	        if (navigator.userAgent.indexOf("Firefox") != -1)
	        {
	            //var description = "<div style='margin-left:0;'><table border='1' cellpadding='0' cellspacing='0' width='300'><tr><td align='left' valign='top' style='font-family:arial; font-size:11; color:#333333; padding-left:6px; padding-top:7px; text-align:left;'><a href='javascript:this.map.HideInfoBox();'><img src='http://media.expedia.com/media/content/expus/graphics/promos/deals/wh_close.gif' align='right' style='margin-left:3px;' id='close'></a><a href='sites.asp?region="+region+"&locid="+locid+"' class='infoBoxLinkOff' onmouseover='this.className=\"infoBoxLinkOn\";' onmouseout='this.className=\"infoBoxLinkOff\";'><b>" + site + "</b></a> </td></tr></table></div>";
				var description = "<div style='margin-left:0;'><table border='0' cellpadding='0' cellspacing='0' width='300'><tr><td align='left' valign='top' style='font-family:arial; font-size:11; color:#333333; padding-left:6px; padding-top:7px; text-align:left;'><b>" + location + " - " + site +"</b></td></tr></table></div>";
	        }
	        if (navigator.userAgent.indexOf("MSIE 7") != -1)
            {
                var description = "<div style='margin-left:0;'><table border='0' cellpadding='0' cellspacing='0' width='300'><tr><td align='left' valign='top' style='font-family:arial; font-size:11; color:#333333; padding-left:6px; padding-top:7px; text-align:left;'><b>" + location + " - " + site +"</b></td></tr></table></div>";
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
			    featureLinkAry[i].onclick = function(){setCurrentLocation((this.idx+1).toString(),this.id,this.longName);getPricing(arrPin[this.idx].desc,arrPin[this.idx].hot,arrPin[this.idx].pkg,arrPin[this.idx].hotlink,arrPin[this.idx].pkglink,arrPin[this.idx].cat);};
			    featureLinkAry[i].desc = arrPin[i].desc;
			    featureLinkAry[i].hotel = arrPin[i].hot;
			    featureLinkAry[i].hotellink = arrPin[i].hotlink;
			    featureLinkAry[i].pkgprice = arrPin[i].pkg;
			    featureLinkAry[i].pkglink = arrPin[i].pkglink;
			    featureLinkAry[i].categ = arrPin[i].cat;
			    gridDiv[i] = document.createElement("div");
			    gridDiv[i].innerHTML = "<b>"+arrPin[i].location+"</b><br />"+arrPin[i].site;
			    //var feature_tn = document.createTextNode(arrPin[i].location + ", " + arrPin[i].state);
			    featureLinkAry[i].appendChild(gridDiv[i]);
			    holdingAry[i].appendChild(featureLinkAry[i]);
            }
        }

        
        
        function getPricing(description,hotel,packageprice,hotellink,pkglink,category)
        {
            document.getElementById("locationDescription").innerHTML = description;
            document.getElementById("pricing").style.display = "";
            document.getElementById("hotel").innerHTML = "<a href ='"+ hotellink +"' class='pricelink'>$"+hotel+"</a>";
            document.getElementById("package").innerHTML = "<a href ='"+ pkglink +"' class='pricelink'>$"+packageprice+"</a>";
            document.getElementById("features").innerHTML = category;
        }
        
        function getFrame(link)
        {            
            document.getElementById("priceFrame").src = link;
            document.getElementById("priceFrame").style.cssText = "display:block;background-color:Transparent;";
        }
        
        function setCurrentLocation(gridIconId, linkId, pinId, spanID)
        {
            for (var i = 0; i < arrPin.length; i++)
            {
	            var gridIcon = arrPin[i].pinpos+1;
	            document.getElementById(gridIcon).className="gridIcon";
	            
	            var link = "fl_"+arrPin[i].locid;
	            document.getElementById(link).className="linkHolder";
	            
	            var span = arrPin[i].pinpos+10;
	            document.getElementById(span).className="spanTitle";
	            
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
            currentLocation.spanID = spanID;

            document.getElementById(gridIconId).className="gridIconOff";
            document.getElementById(linkId).className="linkHolder linkHolderHover"; 
            document.getElementById(spanID).className="spanTitle spanTitleHover";
            var pin = map.GetShapeByID(pinId); 
            pin.SetZIndex(2000);   
			if (pin)
	        {
                var customIcon = "<div class='pinImgOn'>"+gridIconId+"</div>";
                pin.SetCustomIcon(customIcon);
	        }                    
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
        
        function swapClass(id,state,spanID)
        {
            if (id != currentLocation.linkID)
            {
                if (state == 'on')
                {
                    document.getElementById(id).className="linkHolder linkHolderHover";
                    document.getElementById(spanID).className="spanTitle spanTitleHover";
                    
                }
                else
                {
                  document.getElementById(id).className="linkHolder";
                  document.getElementById(spanID).className="spanTitle";  
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
    }
    </style>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>Theme Parks & Family Fun</title>
</head>

<body style="background-image:url(<%= background %>); background-repeat: no-repeat;">
<div id="dropdown" style="position:absolute; top:100px; left:700px; border:solid 1px #330000;">
<select id="ddlCategory" onChange="document.location=this.options[this.selectedIndex].value;" style="width:200px; font-size:11px;color:#330000;">
    <option value="indy.asp?category=experiences&region=indy&friendly=13"<% If cat = "experiences" Then Response.Write "selected=""selected""" End If %>>Indiana Jones Travel Experiences</option>
    <option value="finder.asp?category=hotspots&region=allinclusive&friendly=1"<% If cat = "hotspots" Then Response.Write "selected=""selected""" End If %>>All-inclusive Hotspots</option>
    <option value="finder.asp?category=familyfun&region=US&friendly=2"<% If cat = "familyfun" Then Response.Write "selected=""selected""" End If %>>Amusement/Theme Parks</option>
    <option value="finder.asp?category=escapes&region=US&friendly=3"<% If cat = "escapes" Then Response.Write "selected=""selected""" End If %>>Beach & Island Escapes</option>
    <option value="finder.asp?category=cities&region=US&friendly=4"<% If cat = "cities" Then Response.Write "selected=""selected""" End If %>>BrightLights, Big Cities</option>
    <option value="finder.asp?category=casinos&region=US&friendly=5"<% If cat = "casinos" Then Response.Write "selected=""selected""" End If %>>Casinos Galore</option>
    <option value="finder.asp?category=dining&region=US&friendly=6"<% If cat = "dining" Then Response.Write "selected=""selected""" End If %>>Food & Wine / Culinary Adventures</option>
    <option value="finder.asp?category=golf&region=US&friendly=7"<% If cat = "golf" Then Response.Write "selected=""selected""" End If %>>Golf Getaways</option>
    <option value="finder.asp?category=historical&region=US&friendly=8"<% If cat = "historical" Then Response.Write "selected=""selected""" End If %>>Historic and Cultural Experiences</option>
    <option value="finder.asp?category=exploration&region=US&friendly=9"<% If cat = "exploration" Then Response.Write "selected=""selected""" End If %>>Mountain Exploration</option>
    <option value="finder.asp?category=parks&region=US&friendly=10"<% If cat = "parks" Then Response.Write "selected=""selected""" End If %>>Parks, Lakes & Rivers</option>
    <option value="finder.asp?category=spas&region=US&friendly=11"<% If cat = "spas" Then Response.Write "selected=""selected""" End If %>>Resort & Spa Locales</option>
    <option value="finder.asp?category=retreats&region=US&friendly=12"<% If cat = "retreats" Then Response.Write "selected=""selected""" End If %>>Romantic Retreats</option>
</select>
</div>
<% 
    If cat = "experiences" OR cat = "hotspots" Then
	Else
%>
	
	<a href="finder.asp?category=<%= cat %>&region=US" style="text-decoration:none; cursor:pointer;"><div id="within" style="font-family: Arial,sans-serif;font-size: 14px;font-weight: bold;color: #330000; position:absolute;left:95px;top:150px;">Within the U.S.</div></a>
	<a href="finder.asp?category=<%= cat %>&region=intl&friendly=<%= (numID+12) %>" style="text-decoration:none; cursor:pointer;"><div id="beyond" style="font-family: Arial,sans-serif;font-size: 14px;font-weight: bold;color: #330000; position:absolute;left:315px;top:150px;">Beyond the U.S.</div></a>
<% 
    End If 
%>
	<div id="container" style="margin-top:215px; margin-left:20px;">
	<table border="0" cellpadding="0" cellspacing="0" width="992">
	    <tr>
	        <td width="430">
	            <table border="0" cellpadding="0" cellspacing="0" width="418">
		            <tr>
		                <td height="10" colspan="2" style="border-top:solid 1px #874815;">&nbsp;</td>
		            </tr>
		            <tr>
			            <td align="left" style="margin:0px; width:209px;">
				            <table border="0" cellpadding="2" cellspacing="0" width="100%">
					            <tr>
						            <td valign="top" class="gridIconCell" id="button1"></td>
						            <td class="linkHolder" id="linkHolder1"></td>
					            </tr>
					            <tr>
						            <td valign="top" class="gridIconCell" id="button2"></td>
						            <td class="linkHolder" id="linkHolder2"></td>
					            </tr>
					            <tr>
						            <td valign="top" class="gridIconCell" id="button3"></td>
						            <td class="linkHolder" id="linkHolder3"></td>
					            </tr>
					            <tr>
						            <td valign="top" class="gridIconCell" id="button4"></td>
						            <td valign="top" class="linkHolder" id="linkHolder4"></td>
					            </tr>
					            <tr>
						            <td valign="top" class="gridIconCell" id="button5"></td>
						            <td class="linkHolder" id="linkHolder5"></td>
					            </tr>
				            </table>
			            </td>
			            <td align="left" style="margin:0px; width:209px;"">
				            <table border="0" cellpadding="2" cellspacing="0" width="100%">
				                <tr>
						            <td valign="top" class="gridIconCell" id="button6"></td>
						            <td class="linkHolder" id="linkHolder6"></td>
					            </tr>
					            <tr>
						            <td valign="top" class="gridIconCell" id="button7"></td>
						            <td class="linkHolder" id="linkHolder7"></td>
					            </tr>
					            <tr>
						            <td valign="top" class="gridIconCell" id="button8"></td>
						            <td class="linkHolder" id="linkHolder8"></td>
					            </tr>
					            <tr>
						            <td valign="top" class="gridIconCell" id="button9"></td>
						            <td class="linkHolder" id="linkHolder9"></td>
					            </tr>
					            <tr>
						            <td valign="top" class="gridIconCell" id="button10"></td>
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
	        <td width="430">
	            <div id="locationDescription" class="description"></div>
                <div id="pricing" style="display:none;">
                    <p class="soaTitle">Summer of Adventure Sale</p>
                    <div id="hotels">Hotels from <span id="hotel"></span></div>
                    <div id="packages">Packages from <span id="package"></span></div>
                </div>

                <div id="features"></div>
	        </td>
	    </tr>
	</table>
	
	
	
	<div id="airmail" style="background-image:url(http://media.expedia.com/media/content/expus/graphics/promos/deals/air_mail_bg.gif); width:457px; height:31px; background-repeat:no-repeat;position:absolute;left:0px;top:0px; padding-left:20px;">
    <a href="http://www.expedia.com/" style="color:#330000; text-decoration:underline; font-family:Arial; font-size:10px; font-weight:normal;">Home</a> >
    <a href="http://www.expedia.com/daily/deals/default.asp" style="color:#330000; text-decoration:underline; font-family:Arial; font-size:10px; font-weight:normal;">Deals & Destinations</a> >
    <a href="http://www.expedia.com/" style="color:#330000; text-decoration:underline; font-family:Arial; font-size:10px; font-weight:normal;">Summer of Adventure</a> >
    <a href="http://www.expedia.com/" style="color:#330000; text-decoration:underline; font-family:Arial; font-size:10px; font-weight:normal;">Trip Finder</a> >
    <a href="http://www.expedia.com/" style="color:#330000; text-decoration:underline; font-family:Arial; font-size:10px; font-weight:normal;"><%= friendly %></a>
    </div>
	</div>
</body>
</html>
<script language="javascript" type="text/javascript">

   if (navigator.userAgent.indexOf("MSIE") != -1)
    {
        //document.getElementById("bodyFinder").style.cssText = "background-image:url(<%= background %>); width:992px; height:1066px; background-repeat: no-repeat;";
    }
    if (navigator.userAgent.indexOf("MSIE 7") != -1)
    {
        document.getElementById("myMap").style.cssText = "position:relative;width:410px;height:436px;margin:10px 0px 0px 10px;";
    }
    if (navigator.userAgent.indexOf("Firefox") != -1)
    {
        document.getElementById("myMap").style.cssText = "position:relative;width:410px;height:436px;margin:10px 0px 0px 10px;";
        document.getElementById("div1ColFxThMainContent").style.cssText = "background-image:url(<%= background %>); width:992px; height:1066px; background-repeat: no-repeat;";
        //document.getElementById("expediaLogo").style.cssText = "display:block; position:absolute; top:480px; width:83px; height:24px; left:150px; z-index:30; background-image:url(http://media.expedia.com/media/content/expus/graphics/promos/deals/wh_exp_map_logo_83x24.png);";
    }
    
</script>

