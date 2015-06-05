
function BrowserDetect() {
	var ua = navigator.userAgent.toLowerCase();
	// browser engine name
	this.isGecko       = (ua.indexOf('gecko') != -1 && ua.indexOf('safari') == -1);
	this.isAppleWebKit = (ua.indexOf('applewebkit') != -1);
	// browser name
	this.isKonqueror   = (ua.indexOf('konqueror') != -1); 
	this.isSafari      = (ua.indexOf('safari') != - 1);
	this.isOmniweb     = (ua.indexOf('omniweb') != - 1);
	this.isOpera       = (ua.indexOf('opera') != -1); 
	this.isIcab        = (ua.indexOf('icab') != -1); 
	this.isAol         = (ua.indexOf('aol') != -1); 
	this.isIE          = (ua.indexOf('msie') != -1 && !this.isOpera && (ua.indexOf('webtv') == -1) ); 
	this.isMozilla     = (this.isGecko && ua.indexOf('gecko/') + 14 == ua.length);
	this.isFirefox    = (ua.indexOf('firefox/') != -1);
	this.isNS          = ( (this.isGecko) ? (ua.indexOf('netscape') != -1) : ( (ua.indexOf('mozilla') != -1) && !this.isOpera && !this.isSafari && (ua.indexOf('spoofer') == -1) && (ua.indexOf('compatible') == -1) && (ua.indexOf('webtv') == -1) && (ua.indexOf('hotjava') == -1) ) );
	this.versionMinor = parseFloat(navigator.appVersion);
	if (this.isIE && this.versionMinor >= 4) {this.versionMinor = parseFloat( ua.substring( ua.indexOf('msie ') + 5 ) );}
	this.versionMajor = parseInt(this.versionMinor);
	this.isIE6x = (this.isIE && this.versionMajor == 6);
}


function AC_AddExtension(src, ext)
{
  if (src.indexOf('?') != -1)
    return src.replace(/\?/, ext+'?'); 
  else
    return src + ext;
}

function AC_Generateobj(objAttrs, params, embedAttrs) 
{ 
  var str = '<object ';
  for (var i in objAttrs)
    str += i + '="' + objAttrs[i] + '" ';
  str += '>';
  for (var i in params)
    str += '<param name="' + i + '" value="' + params[i] + '" /> ';
    str += '<param name="AllowScriptAccess" value="always" /> ';
  str += '<embed ';
  for (var i in embedAttrs)
    str += i + '="' + embedAttrs[i] + '" ';
    str += 'AllowScriptAccess="always" ';
  str += ' ></embed></object>';
  document.write(str);
}

function adcVideoPlayer(code,issub,subindex,adfirst)
{
	var newWin;
	newWin = window.open("http://www.accuweather.com/video-on-demand.asp?partner=netweather&video=breaking&category=national_all&collection=weather","adcMediaPlayer","scrollbars=no,statusbar=no,toolbar=no,resizeable=no,HEIGHT=550,WIDTH=700");
}


function RunNetWeather(){
  var ret = 
    AC_GetArgs
    (  arguments, ".swf", "movie", "clsid:d27cdb6e-ae6d-11cf-96b8-444553540000"
     , "http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version="
     , "http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash"
     , "application/x-shockwave-flash", "7,0,0,0"
    );
  AC_Generateobj(ret.objAttrs, ret.params, ret.embedAttrs);
}

function AC_SW_RunContent(){
  var ret = 
    AC_GetArgs
    (  arguments, ".dcr", "src", "clsid:166B1BCA-3F9C-11CF-8075-444553540000"
     , "http://fpdownload.macromedia.com/pub/shockwave/cabs/director/sw.cab#version="
     , "http://www.macromedia.com/shockwave/download/"
     , null, "8,5,0,0"
    );
  AC_Generateobj(ret.objAttrs, ret.params, ret.embedAttrs);
}

function AC_GetArgs(args, ext, srcParamName, classid, codebase, pluginsPage, mimeType, cbVers){
  var ret = new Object();
  ret.embedAttrs = new Object();
  ret.params = new Object();
  ret.objAttrs = new Object();
  for (var i=0; i < args.length; i=i+2){
    var currArg = args[i].toLowerCase();    

    switch (currArg){	
      case "codebase":
      case "pluginspage":
      case "type":
      case "classid":
        break;
      case "src":
      case "movie":	
        args[i+1] = AC_AddExtension(args[i+1], ext);
        ret.embedAttrs["src"] = args[i+1];
        ret.params[srcParamName] = args[i+1];
        break;
      case "minversion":
        cbVers = args[i+1];
        break;
      case "width":
      case "height":
      case "align":
      case "vspace": 
      case "hspace":
      case "class":
      case "title":
      case "accesskey":
      case "name":
      case "id":
      case "tabindex":
        ret.embedAttrs[args[i]] = ret.objAttrs[args[i]] = args[i+1];
        break;
      default:
        ret.embedAttrs[args[i]] = ret.params[args[i]] = args[i+1];
    }
  }
  ret.objAttrs["classid"] = classid;
  ret.objAttrs["codebase"] = codebase + cbVers;
  ret.embedAttrs["pluginspage"] = pluginsPage;
  if (mimeType) ret.embedAttrs["type"] = mimeType;
  return ret;
}

function netWxBCaddScriptTag(id, url, callback) {
	var scriptTag = document.createElement("script");
	scriptTag.setAttribute("type", "text/javascript");
	scriptTag.setAttribute("charset", "utf-8");
	scriptTag.setAttribute("src", url + "&callback=" + callback);
	scriptTag.setAttribute("id", id);
	var head = document.getElementsByTagName("head").item(0);
	head.appendChild(scriptTag);
}

function netWxBCgetImage() {
	
	var url = [];
	url.push("http://vortex.accuweather.com/video/bc-video-request.asp?");
	
	url.push("command=find_video_by_id");
	url.push("&video_id=");
	
	url.push("&video_fields=id,videoStillURL");
	netWxBCaddScriptTag("netWxBCScriptInclude",url.join(''),"netWxBCresponse");
}

function netWxBCresponse(title) {
	var browser = new BrowserDetect();
	var obj = document.getElementById('netWxVideoDiv');
	var code = [];
	if (browser.isIE6x || browser.isAol) {
		code.push('<a href="#" onclick="netWxBCplayVideo(\''+title.id+'\'); return false;"><img style="border:none;width:294px;height:221px;padding:2px 3px 0px 3px;" src="'+title.videoStillURL+'" /></a>');
	} else {
		code.push('<img style="border:none;width:294px;height:221px;padding:2px 3px 0px 3px;" src="'+title.videoStillURL+'" />');
		code.push('<div style="position:absolute;top:0px;left:0px;">');
		code.push('<a href="#" onclick="netWxBCplayVideo(\''+title.id+'\'); return false;"><img style="border:none;" src="http://netwx.accuweather.com/images/play_overlay.png" /></a></div>');
	}
	code.push('<div><a href="#" onclick="netWxBCplayVideo(\''+title.id+'\');return false;">');
	code.push('<img style="border:none" src="http://netwx.accuweather.com/images/videoplayercontrols.gif" /></a></div>');
	obj.innerHTML = code.join('');
} 

function netWxBCplayVideo(id) {
	var code = [];
	code.push('<embed src="http://c.brightcove.com/services/viewer/federated_f9/16457168001?isVid=1&publisherID=1612802193" ');
	code.push('bgcolor="#000000" ');
	code.push('flashVars="playerID=16457168001&@videoPlayer='+id+'&domain=embed&autoStart=true" ');
	code.push('base="http://admin.brightcove.com" ');
	code.push('name="netWxBCvideoPlayer" ');
	code.push('id="netWxBCvideoPlayer" ');
	code.push('width="300" ');
	code.push('height="235" ');
	code.push('seamlesstabbing="false" ');
	code.push('type="application/x-shockwave-flash" ');
	code.push('allowFullScreen="true" ');
	code.push('wmode="transparent" ');
	code.push('swLiveConnect="true" ');
	code.push('pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash">');
	code.push('</embed>');

	var obj = document.getElementById('netWxVideoDiv');
	obj.innerHTML = code.join('');
}


RunNetWeather ("id","netWxV2","minversion","8,0,0,0","movie","http://netwx.accuweather.com/netWx-V29?zipcode=83821&customtheme=&theme=blue&metric=0&target=_blank&lang=eng&url=&video=&category=&logo=0&tStyle=whteYell&partner=netweather&myspace=0","src","http://netwx.accuweather.com/netWx-V29?zipcode=83821&customtheme=&theme=blue&metric=0&target=_blank&lang=eng&url=&video=&category=&logo=0&tStyle=whteYell&partner=netweather&myspace=0","width","300","height","235","name","netWxV2", "wmode","transparent");

try{
document.write("<scr"+"ipt>(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)})(window,document,'script','//www.google-analytics.com/analytics.js','ga_netwx');ga_netwx('create', 'UA-31945348-1', 'auto', {'name': 'netwxTracker'});ga_netwx('netwxTracker.set', 'page', '/netweather/v2/9');ga_netwx('netwxTracker.send', 'pageview', {'dimension1':  'netWeather','dimension2':  ((document.domain) ? document.domain.split('.').join('-') : 'netWeather_NoDomain'),'dimension3':'netweather','dimension4':  'netweather_9'});</scr"+"ipt>");
}catch(e){}