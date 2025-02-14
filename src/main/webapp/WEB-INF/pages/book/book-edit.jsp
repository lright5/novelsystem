<%@page contentType="text/html; charset=utf-8" language="java"  isELIgnored="false" %>
<!DOCTYPE html>
<html>
  
  <head>
    <meta charset="UTF-8">
    <title>欢迎页面-X-admin2.0</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="/static/css/font.css">
    <link rel="stylesheet" href="/static/css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="/static/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="/static/js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
      <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
      <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  
  <body>
    <div class="x-body layui-anim layui-anim-up">
        <form class="layui-form">
            <%--隐藏域--%>
            <input type="hidden" name="bookId" value="${book.bookId}">
          <div class="layui-form-item">
              <label for="L_username" class="layui-form-label">
                  <span class="x-red">*</span>书名
              </label>
              <div class="layui-input-inline">
                  <input type="text" value="${book.bookName}" id="L_username" name="bookName" required="" lay-verify="nikename"
                  autocomplete="off" class="layui-input">
              </div>
          </div>
            <div class="layui-form-item">
                <label  class="layui-form-label">
                    <span class="x-red">*</span>小说类型
                </label>
                <div class="layui-input-inline">
                    <input type="text" value="${book.bookType}" name="bookType" required="" lay-verify="nikename" class="layui-input">
                </div>
            </div>
<%--            <div class="layui-form-item">
                <label  class="layui-form-label">
                    <span class="x-red">*</span>作者
                </label>
                <div class="layui-input-inline">
                    <input type="text" value="${book.author}" name="author" required="" lay-verify="nikename" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label  class="layui-form-label">
                    <span class="x-red">*</span>作者ID
                </label>
                <div class="layui-input-inline">
                    <input type="text" value="${book.authorId}" name="authorId" required="" lay-verify="nikename" class="layui-input">
                </div>
            </div>--%>
            <div class="layui-form-item">
                <label  class="layui-form-label">
                    <span class="x-red">*</span>小说价格
                </label>
                <div class="layui-input-inline">
                    <input type="text" value="${book.bookPrice}" name="bookPrice" required="" lay-verify="nikename" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label  class="layui-form-label">
                    <span class="x-red">*</span>更新章节
                </label>
                <div class="layui-input-inline">
                    <input type="text" value="${book.updateSection}" name="updateSection" required="" lay-verify="nikename" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label  class="layui-form-label">
                    <span class="x-red">*</span>章节数
                </label>
                <div class="layui-input-inline">
                    <input type="text" value="${book.chapterNumber}" name="chapterNumber" required="" lay-verify="nikename" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label  class="layui-form-label">
                    <span class="x-red">*</span>评分
                </label>
                <div class="layui-input-inline">
                    <input type="text" value="${book.score}" name="score" required="" lay-verify="nikename" class="layui-input">
                </div>
            </div>
          <div class="layui-form-item">
              <label  class="layui-form-label">
              </label>
              <button  class="layui-btn" lay-filter="add" lay-submit="">
                  编辑
              </button>
          </div>

      </form>
    </div>

    </div>
    <script>
        layui.use(['form','layer'], function(){
            $ = layui.jquery;
          var form = layui.form
          ,layer = layui.layer;
        
          //自定义验证规则
          form.verify({
            nikename: function(value){
              if(value.length < 1){
                return '不能为空';
              }
            }
            // ,pass: [/(.+){6,12}$/, '密码必须6到12位']
            // ,repass: function(value){
            //     if($('#L_pass').val()!=$('#L_repass').val()){
            //         return '两次密码不一致';
            //     }
            // }
          });

          //监听提交
            form.on('submit(add)', function(data){
            $.ajax({
                type: "post",
                url:"${pageContext.request.contextPath}/book/edit",
                data:data.field,
                dataType: "json",
                success:function (data) {
                    console.log(data);
                    layer.alert(data.msg, {icon: data.code == 200 ? 6 : 5},function () {
                        // 获得frame索引
                        var index = parent.layer.getFrameIndex(window.name);
                        //关闭当前frame
                        parent.layer.close(index);
                        //刷新页面
                        parent.location.replace(location.href);
                    });
                }
            });
            return false;
          });
        });
    </script>

  </body>

</html>