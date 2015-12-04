<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Language" content="en-us" />
<meta http-equiv="Content-type" content="text/html; charset=iso-8859-1"/>
<META NAME="keywords" content="resort, cheap hotels, motel reservations, Cheap Hotel Rates, Discount Hotel Reservation, Discount Hotel Rooms, Cheap Hotel, Hotel Rates, Hotel Reservation, Discount Hotel, Hotel Rooms" />
<META NAME="description" content="Cheap Hotel Rates, Expedia.com is the premier online travel planning site. Discount Hotel Reservation, purchase airline tickets online, find vacation packages, and make hotel and car reservations, find maps, destination information, travel news and more." />

<title>Trip Finder</title>

<% 
    Dim friendly
    Dim linkURL : linkURL = Request("xml")
    Dim background : background = "http://media.expedia.com/media/content/expus/graphics/promos/deals/trip_finder_indy_tab_bg.jpg"
    Dim mapbackground : mapbackground =  "http://media.expedia.com/media/content/expus/graphics/promos/deals/indy_map_bg.gif"
    Dim cat : cat = "experiences"
    Dim reg : reg = "indy"
    Dim numID : numID = "13"
    friendly = "Indiana Jones Travel Experiences"
    
%>

	<script type="text/javascript" src="http://dev.virtualearth.net/mapcontrol/mapcontrol.ashx?v=6"></script>
	<script language="javascript" type="text/javascript">
	zoom = 1;
    var cat = "<%= cat %>";
    var reg = "<%= reg %>";
    var g_IE = "<%= g_bIE %>"
    <%
        If Request.QueryString("dest") <> "" Then sStartId = Request.QueryString("dest") Else sStartId = "1" End If
        sStart = CInt(sStartId) - 1
    %>
    var startNum = <%=sStart%>;
    var startId = '<%=sStartId%>';
    </script>
	<script language="javascript" type="text/javascript" src="finder.js"></script>
	<style type="text/css">
    .MSVE_ZoomBar {
        background-color:#5a7a9b;
        color:ffffff;
        filter:alpha(opacity=10);
        opacity:0.1;
    }
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
            getFlashMovie("indynav").flashSetCurrent(num);
        }

        function destChangeFromFlash(num) {
            var idx = num - 1;
            setTimeout("isCmdFromFlash=true;setCurrentLocation('" + num.toString() + "', 'fl_'+arrPin[" + idx.toString() + "].locid, featureLinkAry[" + idx.toString() + "].longName);", 700);
            getPricing(arrPin[idx].desc, arrPin[idx].hot, arrPin[idx].pkg, arrPin[idx].hotlink, arrPin[idx].pkglink, arrPin[idx].cat);            
        }

        function jsTrace(str)
        {
	        alert(str);
        }

    </script>
    <style type="text/css">
    BODY {background-color:#7190bc !important;}
	.linkHolder {font-family: arial, helvetica, sans serif;font-size:12px;font-weight:normal;cursor:pointer; padding-left:2px;color:#330000 !important;text-decoration:none; vertical-align:top; text-align:left;}
    .linkHolderHover{color:#990000 !important;text-decoration:underline;text-align:left;padding-left:2px;}
    .priceHolder {font-family: arial, helvetica, sans serif;font-size:12px;font-weight:bold;cursor:pointer; color:#330000 !important;text-decoration:none;}
    .priceHolderHover{color:#990000 !important;text-decoration:underline;}
    .priceLink{color:#330000 !important;text-decoration:underline;font-family:arial,helvetica,sans serif;font-size:12px;font-weight:normal;}
    .priceLinkHover{color:#990000 !important;text-decoration:underline;}
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
	.ftrCapt {color:#fef3c6 !important;}
	</style>

</head>    
<!--#include virtual="/daily/prod/common/header.asp"-->
<link rel="stylesheet" type="text/css" href="/daily/styles/core.css?v=4" />
<link rel="stylesheet" type="text/css" href="/daily/styles/mainwide.css?v=1" />

<div id="divTFContent" style="background-image:url(<%= background %>); background-repeat: no-repeat;top:0px;width:992px;height:1066px;position:relative;">
<% 
    If InStr(1, Request.ServerVariables("HTTP_USER_AGENT"), "MSIE") Then

%>
	<link title="combined" rel="stylesheet" type="text/css" media="screen" href="indygridview.css" />
	<link title="combined" rel="stylesheet" type="text/css" media="screen" href="sites.css" />
<% 
    Else
%>
    <link title="combined" rel="stylesheet" type="text/css" media="screen" href="indygridview_ff.css" />
    <link title="combined" rel="stylesheet" type="text/css" media="screen" href="sites_ff.css" />
<% 
    End If
%>    
<!--#include virtual="/daily/vacations/summerofadventure/tripfinder/breadcrumbs.asp"-->
<div id="marriott" style="width:124px; height:52px; z-index:10000; position:absolute; left:850px; top:16px; background-image:url(http://media.expedia.com/media/content/expus/graphics/promos/deals/tripfinder/marriott_logo.jpg); background-repeat:no-repeat;"></div>
<div id="hero" style="width:301px; height:59px; z-index:10000; position:absolute; left:155px; top:44px; filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src='http://media.expedia.com/media/content/expus/graphics/promos/deals/tripfinder/indyhero.png', sizingMethod='scale');"></div>
<div id="pageDescription">Explore some of the most stunning places on Earth with ten exclusive Travel Experiences inspired by the Indiana Jones&#8482; movies. From the jungles of Nepal to the pyramids of Egypt, follow in the footsteps of one of the world's most intrepid movie heroes with these affordable, custom, private tours.</div>
<div id="catTitle">Choose a category</div><br />
<div id="dropdown" style="position:absolute; top:100px; left:770px; border:solid 1px #330000;">
<select id="ddlCategory" onChange="document.location=this.options[this.selectedIndex].value;" style="width:200px; font-size:11px;color:#330000;">
    <option value="finder.asp?category=experiences&region=indy&friendly=13"<% If cat = "experiences" Then Response.Write "selected=""selected""" End If %>>Indiana Jones Travel Experiences</option>
    <option value="finder.asp?category=hotspots&region=allinclusive&friendly=1"<% If cat = "hotspots" Then Response.Write "selected=""selected""" End If %>>All-inclusive Hot Spots</option>
    <option value="finder.asp?category=familyfun&region=US&friendly=2"<% If cat = "familyfun" Then Response.Write "selected=""selected""" End If %>>Amusement/Theme Parks</option>
    <option value="finder.asp?category=escapes&region=US&friendly=3"<% If cat = "escapes" Then Response.Write "selected=""selected""" End If %>>Beach & Island Escapes</option>
    <option value="finder.asp?category=cities&region=US&friendly=4"<% If cat = "cities" Then Response.Write "selected=""selected""" End If %>>Bright Lights, Big Cities</option>
    <option value="finder.asp?category=casinos&region=allinclusive&friendly=5"<% If cat = "casinos" Then Response.Write "selected=""selected""" End If %>>Casinos Galore</option>
    <option value="finder.asp?category=dining&region=US&friendly=6"<% If cat = "dining" Then Response.Write "selected=""selected""" End If %>>Food & Wine / Culinary Adventures</option>
    <option value="finder.asp?category=golf&region=US&friendly=7"<% If cat = "golf" Then Response.Write "selected=""selected""" End If %>>Golf Getaways</option>
    <option value="finder.asp?category=historical&region=US&friendly=8"<% If cat = "historical" Then Response.Write "selected=""selected""" End If %>>Historical and Cultural Experiences</option>
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
	<div id="container" style="margin-top:0px; margin-left:20px;">
	<div id="divLinksAndMap" style="position:relative;top:215px;">
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
			            <td align="left" style="margin:0px; width:209px;">
				            <table border="0" cellpadding="2" cellspacing="0" width="100%">
					            <tr>
						            <td valign="top" class="gridIconCell" id="button1"></td>
						            <td align="left" valign="top" class="linkHolder" id="linkHolder1"></td>
					            </tr>
					            <tr>
						            <td valign="top" class="gridIconCell" id="button2"></td>
						            <td valign="top" align="left" class="linkHolder" id="linkHolder2"></td>
					            </tr>
					            <tr>
						            <td valign="top" class="gridIconCell" id="button3"></td>
						            <td valign="top" align="left" class="linkHolder" id="linkHolder3"></td>
					            </tr>
					            <tr>
						            <td valign="top" class="gridIconCell" id="button4"></td>
						            <td valign="top" align="left" class="linkHolder" id="linkHolder4"></td>
					            </tr>
					            <tr>
						            <td valign="top" class="gridIconCell" id="button5"></td>
						            <td valign="top" align="left" class="linkHolder" id="linkHolder5"></td>
					            </tr>
				            </table>
			            </td>
			            <td align="left" style="margin:0px; width:209px;"">
				            <table border="0" cellpadding="2" cellspacing="0" width="100%">
				                <tr>
						            <td valign="top" class="gridIconCell" id="button6"></td>
						            <td valign="top" align="left" class="linkHolder" id="linkHolder6"></td>
					            </tr>
					            <tr>
						            <td valign="top" class="gridIconCell" id="button7"></td>
						            <td valign="top" align="left" class="linkHolder" id="linkHolder7"></td>
					            </tr>
					            <tr>
						            <td valign="top" class="gridIconCell" id="button8"></td>
						            <td valign="top" align="left" class="linkHolder" id="linkHolder8"></td>
					            </tr>
					            <tr>
						            <td valign="top" class="gridIconCell" id="button9"></td>
						            <td valign="top" align="left" class="linkHolder" id="linkHolder9"></td>
					            </tr>
					            <tr>
						            <td valign="top" class="gridIconCell" id="button10"></td>
						            <td valign="top" align="left" class="linkHolder" id="linkHolder10"></td>
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
    <div id="flashcontainer" style="position:absolute;top:154px;left:515px;width:468px;height:346px;">
    <div id="flashnav">
    <script language="JavaScript" type="text/javascript">
    
    var hasRightVersion = DetectFlashVer(requiredMajorVersion, requiredMinorVersion, requiredRevision);
	if (hasRightVersion)
	{
	    AC_FL_RunContent(
			'codebase', 'http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,0,0',
			'width', '468',
			'height', '386',
			'src', 'http://media.expedia.com/media/content/expus/graphics/promos/deals/tripfinder/indynav.swf',
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
			'name', 'indynav',
			'menu', 'true',
			'allowFullScreen', 'false',
			'allowScriptAccess','sameDomain',
			'movie', 'indynav',
			'salign', '',
			'flashvars', '<%If Request.QueryString("dest") <> "" Then%>item=<%=Request.QueryString("dest")%>&<%End If%>cat=<%=cat%>&reg=<%=reg%>&xml=<%=Server.UrlEncode("/daily/vacations/summerofadventure/tripfinder/tripfinderxml.asp?cat=" & cat & "&reg=" & reg)%>'
			); //end AC code
	}    
    </script>
    </div>
    </div>
    <div style="position:absolute;left:504px;top:530px;width:420px;">
	    <div id="locationDescription" class="description"></div>
        <div id="pricing" style="display:none;position:absolute;top:<%If g_bIE Then%>188<%Else%>174<%End If%>px;left:42px;">
            <p class="soaTitle">Vacation Sale</p>
            <div id="hotels">Hotels from <span id="hotel"></span></div>
            <div id="packages">Packages from <span id="package"></span></div>
        </div>
        <div id="indypricing" style="display:block;position:absolute;top:<%If g_bIE Then%>158<%Else%>164<%End If%>px;left:42px;width:420px;">
            <div id="site"></div>
            <div id="indyLoc">Your adventure includes:</div>
            <div id="cost"></div>
            <div id="descpara"></div>
            <div id="details" style="width:86px; height:21px; position:absolute; top:<%If g_bIE Then%>102<%Else%>98<%End If%>px; left:160px;"></div>
        </div>
        <div id="features" style="position:absolute;top:314px;width:420px"></div>
        
	</div>
    </div>
        
    </div>  
    <div id="divBottomContentContainer">
	<!--#include virtual="/daily/prod/common/footer.asp"-->
    </div>
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
        //document.getElementById("div1ColFxThMainContent").style.cssText = "background-image:url(<%= background %>); width:992px; height:1066px; background-repeat: no-repeat;";
        //document.getElementById("expediaLogo").style.cssText = "display:block; position:absolute; top:480px; width:83px; height:24px; left:150px; z-index:30; background-image:url(http://media.expedia.com/media/content/expus/graphics/promos/deals/wh_exp_map_logo_83x24.png);";
    }
    
</script>

