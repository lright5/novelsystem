<%@ page import="java.util.Date" %>
<%@page contentType="text/html;charset=utf-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
  
  <head>
    <meta charset="UTF-8">
    <title>书籍订阅订单列表</title>
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
    <div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="">演示</a>
        <a>
          <cite>导航元素</cite></a>
      </span>
      <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
    </div>
    <div class="x-body">
      <div class="layui-row">
        <form class="layui-form layui-col-md12 x-so" action="${pageContext.request.contextPath}/bookorder/orderSearch" method="post">
          <%--<input class="layui-input" placeholder="开始日" name="start" id="start">--%>
          <%--<input class="layui-input" placeholder="截止日" name="end" id="end">--%>
          <%--<div class="layui-input-inline">--%>
            <%--<select name="contrller">--%>
              <%--<option>支付状态</option>--%>
              <%--<option>已支付</option>--%>
              <%--<option>待支付</option>--%>
            <%--</select>--%>
          <%--</div>--%>
          <%--<div class="layui-input-inline">--%>
            <%--<select name="contrller">--%>
              <%--<option>支付方式</option>--%>
              <%--<option>支付宝</option>--%>
              <%--<option>微信</option>--%>
              <%--<option>银行卡</option>--%>
            <%--</select>--%>
          <%--</div>--%>
          <%--<div class="layui-input-inline">--%>
            <%--<select name="contrller">--%>
              <%--<option value="">订单状态</option>--%>
              <%--<option value="0">待确认</option>--%>
              <%--<option value="3">已取消</option>--%>
              <%--<option value="4">已完成</option>--%>
            <%--</select>--%>
          <%--</div>--%>
          <input type="text" name="keyword"  placeholder="请输入用户ID" autocomplete="off" class="layui-input">
          <button class="layui-btn"  lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>
        </form>
      </div>
      <xblock>
        <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>
        <button class="layui-btn" onclick="x_admin_show('添加订单','${pageContext.request.contextPath}/bookorder/bookorderadd')"><i class="layui-icon"></i>添加</button>
        <span class="x-right" style="line-height:40px">共有数据：${pageInfo.total}</span>
      </xblock>
      <table class="layui-table">
        <thead>
          <tr>
            <th>
              <div class="layui-unselect header layui-form-checkbox" lay-skin="primary"><i class="layui-icon">&#xe605;</i></div>
            </th>
            <th>订单编号</th>
            <th>用户id</th>
            <th>订单金额</th>
            <th>折扣</th>
            <th>订单状态</th>
            <th>支付方式</th>
            <th>下单时间</th>
            <th>操作</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach items="${list}" var="bookorder">
          <tr>
            <td>
              <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='${bookorder.orderid}'><i class="layui-icon">&#xe605;</i></div>
            </td>
            <td>${bookorder.orderid}</td>
            <td>${bookorder.userId}</td>
            <td>${bookorder.orderPrice}</td>
            <c:if test="${reader.member_until>=Date()}">
              <td>会员八折</td>
            </c:if>
            <c:if test="${reader.member_until<Date()}">
              <td>原价</td>
            </c:if>
<%--            <td>${bookorder.discountId ==1? "9折":"限时全免"}</td>--%>

            <td class="td-status1">
                  <span class="layui-btn layui-btn-normal layui-btn-mini">${bookorder.orderStatus==1 ? "待确定":"已完成"}</span>
               </td>

            <td>${bookorder.payWay}</td>
            <td>${bookorder.orderDate}</td>

            <td class="td-manage">
              <a onclick="member_stop1(this,${bookorder.orderid})" href="javascript:;"  title="待确定">
                <i class="layui-icon">&#xe601;</i>
              </a>
              <a title="删除" onclick="member_del(this,'要删除的id')" href="javascript:;">
                <i class="layui-icon">&#xe640;</i>
              </a>
            </td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
      <div class="page">
        <div>
          <c:if test="${pageInfo.hasPreviousPage}">
            <a  class="prev" href="${pageContext.request.contextPath}/bookorder/bookorderlist?page=${pageInfo.prePage}">&lt;&lt;</a>
          </c:if>

          <c:forEach items="${pageInfo.navigatepageNums}" var="p">
            <c:if test="${pageInfo.pageNum==p}">
              <span class="current">${p}</span>
            </c:if>
            <c:if test="${pageInfo.pageNum!=p}">
              <a class="num" href="${pageContext.request.contextPath}/bookorder/bookorderlist?page=${p}">${p}
            </c:if>
           </a>

          </c:forEach>
          <c:if test="${pageInfo.hasNextPage}">
            <a class="next" href="${pageContext.request.contextPath}/bookorder/bookorderlist?page=${pageInfo.nextPage}">&gt;&gt;</a>
          </c:if>

         
        </div>
      </div>

    </div>
    <script>
      layui.use('laydate', function(){
        var laydate = layui.laydate;
        
        //执行一个laydate实例
        laydate.render({
          elem: '#start' //指定元素
        });

        //执行一个laydate实例
        laydate.render({
          elem: '#end' //指定元素
        });
      });

       /*用户-停用*/
      function member_stop1(obj,id){
          layer.confirm('确认要状态处理吗？',function(index){

              if($(obj).attr('title')=='待确定'){

                //发异步把用户状态进行更改
                if ()
                 $.ajax({
                     type:"post",
                     url:"${pageContext.request.contextPath}/bookorder/editStatus",
                     data:{id:id,status:2},
                     dataType:"json",
                     success: function (data) {
                         $(obj).attr('title','已完成')
                         $(obj).find('i').html('&#xe62f;');
                         $(obj).parents("tr").find(".td-status1").find('span').addClass('layui-btn-disabled').html('已完成');
                         layer.msg(data.msg,{icon:data.code==200 ? 6: 5,time:1000});
                     }
                 });
              }else{
                  $.ajax({
                      type:"post",
                      url:"${pageContext.request.contextPath}/bookorder/editStatus",
                      data:{id:id,status:2},
                      dataType:"json",
                      success: function (data) {
                          $(obj).attr('title','待确定')
                          $(obj).find('i').html('&#xe601;');

                          $(obj).parents("tr").find(".td-status1").find('span').removeClass('layui-btn-disabled').html('待确定');
                          layer.msg(data.msg,{icon:data.code==200 ? 6: 5,time:1000});
                      }
                  });
              }
              
          });
      }



      /*用户-删除*/
      <%--function member_del(obj,id){--%>
          <%--layer.confirm('确认要删除吗？',function(index){--%>
          <%--$.ajax({--%>
                  <%--type:"post",--%>
                  <%--url:"${pageContext.request.contextPath}/bookorder/delete",--%>
                  <%--data:{orderid:id,orderStatus:1},--%>
                  <%--dataType:"json",--%>
                  <%--success:function (data) {--%>
                      <%--// layer.confirm('确认要删除吗？', function (index) {--%>
                          <%--//发异步删除数据--%>
                          <%--$(obj).parents("tr").remove();--%>
                          <%--layer.msg('已删除!', {icon: 1, time: 1000});--%>

                      <%--// }--%>
                  <%--}--%>

              <%--});--%>
      <%--});--%>
      <%--}--%>

      function member_del(obj,id){
          layer.confirm('确认要删除吗？',function(index){
              //发异步删除数据
              $(obj).parents("tr").remove();
              layer.msg('已删除!',{icon:1,time:1000});
          });
      }



      function delAll (argument) {

        var data = tableCheck.getData();
        //将data转化为字符串
          data=data.join(",");
        layer.confirm('确认要删除吗？',function(index){
            //捉到所有被选中的，发异步进行删除
            $.ajax({
                type:"post",
                url:"${pageContext.request.contextPath}/bookorder/deleteAll",
                data:{ids:data},
                dataType:"json",
                success:function (data) {
                    layer.msg(data.msg, {icon: 1});
                    if(data.code==200){
                        location.replace(location.href);
                    }
                }
            });
        });
      }
    </script>

  </body>

</html>