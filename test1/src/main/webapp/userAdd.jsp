<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>超市账单管理系统</title>
    <link rel="stylesheet" href="css/public.css"/>
    <link rel="stylesheet" href="css/style.css"/>
</head>
<body>
<!--头部-->
<header class="publicHeader">
    <h1>超市账单管理系统</h1>

    <div class="publicHeaderR">
        <p><span>下午好！</span><span style="color: #fff21b"> ${user.userName}</span> , 欢迎你！</p>
        <a href="login.html">退出</a>
    </div>
</header>
<!--时间-->
<section class="publicTime">
    <span id="time">2015年1月1日 11:11  星期一</span>
    <a href="#">温馨提示：为了能正常浏览，请使用高版本浏览器！（IE10+）</a>
</section>
<!--主体内容-->
<section class="publicMian ">
    <div class="left">
        <h2 class="leftH2"><span class="span1"></span>功能列表 <span></span></h2>
        <nav>
            <ul class="list">
                <li><a href="billList.html">账单管理</a></li>
                <li><a href="providerList.html">供应商管理</a></li>
                <li id="active"><a href="userList.html">用户管理</a></li>
                <li><a href="password.html">密码修改</a></li>
                <li><a href="login.html">退出系统</a></li>
            </ul>
        </nav>
    </div>
    <div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>用户管理页面 >> 用户添加页面</span>
        </div>
        <div class="providerAdd">
            <form action="getAddUser" method="post">
                <!--div的class 为error是验证错误，ok是验证成功-->
                <div class="" id="isRight">
                    <label for="userCode">用户编码：</label>
                    <input type="text" name="userCode" id="userCode"/>
                    <span>*请输入用户编码，且不能重复</span>
                </div>
                <div>
                    <label for="userName">用户名称：</label>
                    <input type="text" name="userName" id="userName"/>
                    <span>*请输入用户名称</span>
                </div>
                <div>
                    <label for="userpassword">用户密码：</label>
                    <input type="text" name="userpassword" id="userpassword"/>
                    <span>*密码长度必须大于6位小于20位</span>

                </div>
                <div>
                    <label for="userRemi">确认密码：</label>
                    <input type="text" name="userRemi" id="userRemi"/>
                    <span>*请输入确认密码</span>
                </div>
                <div>
                    <label>用户性别：</label>
                    <select name="gender">
                        <option value="1">男</option>
                        <option value="2">女</option>
                    </select>
                    <span></span>
                </div>
                <div>
                    <label for="data">出生日期：</label>
                    <input type="text" name="birthday" id="data"/>
                    <span>*</span>
                </div>
                <div>
                    <label for="userphone">用户电话：</label>
                    <input type="text" name="phone" id="userphone"/>
                    <span>*</span>
                </div>
                <div>
                    <label for="userAddress">用户地址：</label>
                    <input type="text" name="address" id="userAddress"/>
                </div>
                <div>
                    <label>用户类别：</label>
                    <input type="radio" name="userRole" value="1"/>管理员
                    <input type="radio" name="userRole" value="2"/>经理
                    <input type="radio" name="userRole" value="3" checked/>普通用户

                </div>
                <div class="providerAddBtn">
                    <!--<a href="#">保存</a>-->
                    <!--<a href="userList.html">返回</a>-->
                    <input type="button" value="保存" class="submitBtn"/>
                    <input type="button" value="返回" onclick="history.back(-1)"/>
                </div>
            </form>
        </div>
    </div>
</section>
<footer class="footer">
    版权归北大青鸟
</footer>
<script src="js/time.js"></script>
<script src="js/jquery.js"></script>
<script>
   /* function onInput(){
        var ajaxIsRight = false;
        var userCode = $(this).val();
        $.ajax({
            url: "getUserCode",
            type: "get",
            dataType: "text",
            data: {"userCode": userCode},
            success: function (data) {
                if (data > 0) {
                    $("#isRight").addClass("error");
                    ajaxIsRight = false;
                    return false;
                } else {
                    $("#isRight").addClass("ok");
                    ajaxIsRight = true;
                    return true;
                }
            }
        })
    }*/
    $(function () {
        var ajaxIsRight = false;
        var submitbool = false;

        $("#userCode").blur(function () {
            var userCode = $(this).val();
            $.ajax({
                url: "getUserCode",
                type: "get",
                dataType: "text",
                data: {"userCode": userCode},
                success: function (data) {
                    if (data > 0) {
                        $("#isRight").removeClass("ok").addClass("error");
                        ajaxIsRight = false;
                        return false;
                    } else {
                        $("#isRight").removeClass("error").addClass("ok");
                        ajaxIsRight = true;
                        return true;
                    }
                }
            })
        })
        $(".submitBtn").click(function () {
            var userName = $("#userName").val();
            var userpassword = $("#userpassword").val();
            var userRemi = $("#userRemi").val();
            if (userName == null || userName == "") {
                alert("用户名请填写");
                submitbool = false;
                return submitbool;
            }
            if (userpassword != userRemi) {
                alert("密码不一致");
                submitbool = false;
                return submitbool;
            }
            if (userpassword.length < 5 || userpassword.length > 21) {
                alert("密码不能小于5不能大于21");
                submitbool = false;
                return submitbool;
            } else {
                submitbool = true;
            }
            if (submitbool == true && ajaxIsRight== true ) {
                $("form").submit();
            }
        })
    })

</script>
</body>
</html>