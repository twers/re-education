$(window).load(function(){
	QC.Login({
	  btnId:"qq-login",    //插入按钮的节点id
	 	size: 'A_M'
	}, function(reqData, opts) {
    var dom = document.getElementById(opts['btnId']),
    _logoutTemplate=[
        //头像
        '<span><img src="{figureurl}" class="{size_key}"/></span>',
        //昵称
        '<span>{nickname}</span>',
        //退出
        '<span><a href="javascript:QC.Login.signOut();">退出</a></span>'    
 		].join("");
    dom && (dom.innerHTML = QC.String.format(_logoutTemplate, {
       nickname : QC.String.escHTML(reqData.nickname),
       figureurl : reqData.figureurl
    }));
	    
		if (QC.Login.check()) {
	 		QC.Login.getMe(function(openId, accessToken) {
				$.post('/users', { 
					'user[access_token]' : accessToken,
					'user[unique_id]' : openId,
					'user[avatar_url]' : reqData.figureurl_1,
					'user[nick_name]' : reqData.nickname
				}).done(function(ret){
					var user = ret.user;
					if(cookie('online') == 'false'){
						cookie('online', true);
						if(user){
							if(!ret.registered){
								window.location.href = '/publishers/new';
							}else{
								window.location.reload();
							}
						}
					}
				});
		 	});
		}
	}, function(){
		$.post('/logout').done(function(json){
			cookie('online', false);
			json.result && window.location.reload();
		});
	});
});