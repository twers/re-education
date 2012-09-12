/**
 * Created by .
 * User: jinjingcao
 * Date: 12-4-12
 * Time: 涓嬪崍4:12
 * To change this template use File | Settings | File Templates.
 */
(function(){
	var ver = "1.0.1";
	try{
		ver = opener.QC.getVersion();
	}catch(e){

	}

	ver = ver ? "-" + ver : ver;

	var qc_script;
	var reg = /\/qzone\/openapi\/qc_loader\.js/i;
	var scripts = document.getElementsByTagName("script");
	for(var i=0, script, l=scripts.length;i<l;i++){
		script = scripts[i];
		var src = script.src||"";
		var mat = src.match(reg);
		if(mat) {qc_script = script;break;}
	}

//	debugger

	var s_src = 'http://qzonestyle.gtimg.cn/qzone/openapi/qc'+ver+'.js';
	var arr=['src='+s_src+''];
	for(var i= 0,att;i<qc_script.attributes.length;i++) {
		att=qc_script.attributes[i];
		if(att.name!="src" && att.specified ){
			arr.push([att.name,'"'+att.value+'"'].join("="));
		}
	}

	if(document.readyState!='complete') {
		document.write('<script '+arr.join(" ")+' ><'+'/script>');
	}else{
		var s = document.createElement("script");
		s.type="text/javascript";
		s.src = s_src;
		var h = document.getElementsByTagName("head");
		if(h&&h[0]){
			h.appendChild(s);
		}
	}
//	document.write('<script type="text/javascript" src="http://qzonestyle.gtimg.cn/qzone/openapi/qc'+ver+'.js" charset="utf-8" data-callback="true" ><'+'/script>');
})();/*  |xGv00|522edfb3df9feb9fd8ae951160814960 */