<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>密码更新</title>
    <link rel="stylesheet" href="/css/allstyle.css" />
</head>
<body>
<c:if test="${ sessionScope.currentUser==null }">
    <script>
        alert("未登录，请先登录");
        window.location.href="http://localhost:80/indexView";
    </script>
</c:if>
<style>
    body{ background:#f4f3f1;}
    .subbtn{
        width: 280px;
        padding: 12px;
        border-radius: 4px;
        margin: 30px 0 0 100px;
        color: #fff;
        background-color: #80c269;
        cursor: pointer;
    }
</style>

<jsp:include page="navigation.jsp" flush="true" />

<div class="user_info" style="margin-top: 10px">
    <!--顶部用户资料显示-->
    <div class="user_info_bg">
        <div class="user_info_portrait">
            <p class="user_info_name"><span>VIP专属:${user.username}</span></p>
            <p class="user_info_name"><span>心有琴弦，纵然客去茶凉，仍有小曲缓缓响起，仍有满树桂花知音而化为酒香。</span></p>
        </div>
        <div class="user_info_msg">
	        <span>性别：${user.sex}</span>
            <span>手机号：${user.phone}</span>
            <span>邮箱：${user.email}</span>
        </div>
    </div>

    <!--顶部用户资料显示 end-->

    <div class="user_info_cont clear">
        <!--用户中心左侧菜单-->
        <ul class="userinfo_left fl">
            <li class="active" ><span class="icon_user"></span><a href="http://localhost:80/user/updateView">个人信息</a></li>
            <li  ><span class="icon_msg"></span><a href="http://localhost:80/user/message">我的消息</a></li>
            <li  ><span class="icon_order"></span><a href="http://localhost:80/productOrder/orderView">我的订单</a></li>
            <li  ><span class="icon_custom"></span><a href="http://localhost:80/customization/listView">我的定制</a></li>

        </ul>
        <!--用户中心左侧菜单 end-->

        <div class="userinfo_right fr">
            <ul class="user_right_nav">
                <li class="user_right_tab active"><a href="javascript:void(0);">信息修改</a></li>
                <li class="user_right_tab"><a href="javascript:void(0);">账号绑定</a></li>
                <li class="user_right_tab"><a href="http://localhost:80/user/updatePassword">密码修改</a></li>
            </ul>

            <form id="form2"  method="post" onsubmit=" false" class="user_information">
                <input type="hidden" name="id" value="${user.id}" />
                <div class="user_form_list">
                    <label  class="label_txt">私人邮箱：</label>
                    <input type="text" name="email" value="${user.email}" class="user_inputxt" readonly="readonly"/>
                </div>

                <div class="user_form_list">
                    <label  class="label_txt">私人账户：</label>
                    <input type="text" name="username" value="${user.username}" class="user_inputxt" readonly="readonly"/>
                </div>

                <div class="user_form_list">
                    <label  class="label_txt">新密码：</label>
                    <input type="text" name="oldPassword" value="" class="user_inputxt" />
                </div>

                <div class="user_form_list">
                    <label  class="label_txt">确认密码：</label>
                    <input type="email" name="newPassword" value="" class="user_inputxt" />
                </div>

                <input type="button"  value="提交更新" class="userinfo_form_btn subbtn" onclick="updta()">
            </form>
        </div>
    </div>

</div>


<style>
    /*字体图标*/
    @font-face {
        font-family: 'iconfont';  /* project id 258222 */
        src: url('//at.alicdn.com/t/font_1qtzkjg92s0v0a4i.eot');
        src: url('//at.alicdn.com/t/font_1qtzkjg92s0v0a4i.eot?#iefix') format('embedded-opentype'),
        url('//at.alicdn.com/t/font_1qtzkjg92s0v0a4i.woff') format('woff'),
        url('//at.alicdn.com/t/font_1qtzkjg92s0v0a4i.ttf') format('truetype'),
        url('//at.alicdn.com/t/font_1qtzkjg92s0v0a4i.svg#iconfont') format('svg');
    }
    .iconfont{
        font-family:"iconfont";
        font-size:16px;
        font-style:normal;
        -webkit-font-smoothing: antialiased;
        -moz-osx-font-smoothing: grayscale;
        padding-left:20px
    }
</style>


<%@ include file="foot.jsp"%>


<script>
    function updta() {
        var reg=/^1[3|4|5|8|7][0-9]\d{4,8}$/;
        var reges=/^0\d{2,3}-?\d{7,8}$/;
        var username=$('input[name="username"]').val();
        var oldPassword=$('input[name="oldPassword"]').val();
        var newPassword=$('input[name="newPassword"]').val();
        if(username == ""){
            alert("用户名不能为空!");
            return false;
        }
        if(oldPassword == ""){
            alert("新密码不能为空!");
            return false;
        }
        if(newPassword == ""){
            alert("确认密码不能为空!");
            return false;
        }

        if (!(newPassword==oldPassword)) {
            alert("两次输入密码不一样，请重新输入!");
            return false;
        }

        var param = $("#form2").serialize();;
        console.log(param);
        /*密码修改页面*/
        $.post("http://localhost:80/user/updatePasswordView",
            param,
            function(result){
            if(result.status==200){
                alert("密码修改成功，请重新登录！");
                window.location.href="http://localhost:80/indexView";
            }else {
                alert(result.msg)
            }
        });

    }
</script>


</body>
</html>