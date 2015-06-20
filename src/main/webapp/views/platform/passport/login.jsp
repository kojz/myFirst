<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
	<jsp:include page="../resoure/resource.jsp"></jsp:include>
    <!-- css -->
    <link href="${viewPath}/platform/passport/assets/css/bs3/dpl-min.css" rel="stylesheet" type="text/css" />
    <link href="${viewPath}/platform/passport/assets/css/bs3/bui-min.css" rel="stylesheet" type="text/css" />
    <!-- bootstrap3 上用的Glyphicons字体图标-->
    <link href="${viewPath}/platform/passport/assets/css/glyphicon.css" rel="stylesheet" type="text/css" />
    <!-- alibaba图标库 iconfont.cn
    <link href="assets/css/iconfont.css" rel="stylesheet" type="text/css" />-->
    <link href="${viewPath}/platform/passport/assets/css/login.css" rel="stylesheet" type="text/css" />

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="assets/js/html5shiv.min.js"></script>
    <![endif]-->
</head>
<body>
    <div class="top-container">
        <div class="header">
            <header>
                <label class="l-logo">
                    <span class="a-fadeinT">Log</span>
                    <span class="a-fadeinR">in</span>
                </label>
            </header>
        </div>

        <div class="content">
            <div id="theForm" >
                <div id="owl" class="owl">
                    <div class="arms">
                        <div class="arm"></div>
                        <div class="arm arm-r"></div>
                    </div>
                </div>
                <div class="fields">
                    <!-- 信息提示区域 -->
                    <div class="control-group">
                        <div class="controls" id="noticeTip">
                            <div class="tips tips-small tips-notice fn-pd5" >
                                <span class="x-icon x-icon-small x-icon-warning">
                                    <i class="icon icon-white icon-volume-up"></i>
                                </span>
                                <div class="tips-content">请输入用户名密码、验证码登录。</div>
                            </div>
                        </div>
                    </div>
                    <!-- /信息提示区域 -->
                    <div class="control-group">
                        <div class="controls">
                            <label for="username" class="control-label  glyphicon glyphicon-user"></label>
                            <input type="text" name="username" id="username" placeholder="用户名" tabindex="1" autofocus="true"
                                   class="form-control-input" autocomplete="off" />
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="controls">
                            <label for="password" class="control-label  glyphicon glyphicon-lock"></label>
                            <input type="text" onfocus="this.type='password'" name="password" id="password" placeholder="密码" tabindex="2" autocomplete="off"
                                   class="form-control-input" />
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="controls">
                            <label for="captcha" class="control-label glyphicon glyphicon-check"></label>
                            <input type="text" name="captcha" id="captcha" placeholder="验证码" tabindex="3" autocomplete="off"
                                   class="form-control-input  input-captcha"/>
                            <img id="captchaImg" src="${viewPath}/platform/passport/assets/img/login/captcha.jpg" width="90" height="37" >
                        </div>
                    </div>
                </div>
                <div class="buttons">
                    <div class="remember">
                        <input type="checkbox" value="1" id="remember" class="fn-vm" tabindex="4"/>
                        <label for="remember">&nbsp;记住我</label>
                    </div>
                    <button class="button button-primary " id="loginBtn" tabindex="5">登录</button>
                </div>
            </div>
        </div>
    </div>
    <div class="bottom-container">
        <div class="bottom-content"></div>
        <div class="foot">
            <p>&copy; 2014-2015 xxxx All Rights Reserved.</p>
        </div>
    </div>
<!-- jQuery -->
<script type="text/javascript" src="${viewPath}/platform/passport/assets/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="${viewPath}/platform/passport/assets/js/sea.js"></script>
<script type="text/javascript" src="${viewPath}/platform/passport/assets/js/config.js"></script>
<!--[if lt IE 10]>
<script src="./assets/js/jquery.placeholder.min.js"></script>
<script >$('input, textarea').placeholder({customClass:'fn-placeholder'});</script>
<![endif]-->
<script>
    /**
     */
    $(function(){
        // 闭眼动画
        $('#password').focus(function() {
            $('#owl').find('.arm').stop().first().animate({top:'5px',left:'65px'},300).next().animate({top:'5px',left:'120px'},300);
        }).blur(function() {
            $('#owl').find('.arm').stop().first().animate({top:'40px',left:'20px'},300).next().animate({top:'40px',left:'160px'},300);
        });

        // use cookie, tooltip, overlay
        seajs.use(['bui/cookie', 'bui/tooltip' ,'bui/overlay'], function( cookie, Tooltip ){

            var username = $("#username").focus(),
                remember = $('#remember'),
                c_username = cookie.get('username');

            if( !!c_username ){
                // 如果已经记住账号
                username.val( c_username );
                remember.attr('checked',true );
            }
            $("#password").attr('type','text').one('focus',function(){
               $(this).attr('type','password');
            });

            // 构建3个提示
            var conf = {
                autoRender : true,
                trigger : null,
                alignType : 'right',
                offset : 10,
                title : null,
                elCls : 'tips tips-notice ',
                titleTpl : '<span class="x-icon x-icon-small x-icon-warning"><i class="icon icon-white icon-info"></i></span>\ <div class="tips-content">{title}</div>'
            };
            var tipsMsg = [
                { trigger : '#username', title : '测试账号：admin'},
                { trigger : '#password', title : '密码：123'},
                { trigger : '#captcha',  title : '3257'}
            ];
            $.each( tipsMsg, function(i , n){
                $.extend( conf, n );
                new Tooltip.Tip( conf );
            });

            // 表单回车事件
            $('#theForm').keydown(function( e ){
                if( e.keyCode == 13 ){
                    $("#loginBtn").trigger('click');
                }
            });
          
        });



    });
</script>
</body>
</html>