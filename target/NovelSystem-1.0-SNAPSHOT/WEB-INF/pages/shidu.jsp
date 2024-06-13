<%--<%@page contentType="text/html;charset=utf-8" language="java" isELIgnored="false" %>--%>
<%--<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<!DOCTYPE html>--%>
<%--<html lang="en">--%>

<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <meta name="viewport" content="width=device-width, initial-scale=1.0">--%>
<%--    <meta http-equiv="X-UA-Compatible" content="ie=edge">--%>
<%--    <title>shidu</title>--%>
<%--    <link rel="stylesheet" href="/static/css/shidu.css">--%>
<%--    <link href="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/5.3.3/css/bootstrap-grid.css" rel="stylesheet">--%>
<%--    <style>--%>
<%--        .header_bottom {--%>
<%--            width: 100%;--%>
<%--            height: 50px;--%>
<%--            margin-top: 20px;--%>
<%--            background-color: blueviolet;--%>
<%--        }--%>
<%--        .middle {--%>
<%--            width: 100%;--%>
<%--            height: 50px;--%>
<%--            line-height: 50px;--%>

<%--        }--%>

<%--        .middle li {--%>
<%--            float: left;--%>
<%--            margin-left: 20px;--%>
<%--        }--%>

<%--        .middle li a {--%>
<%--            color: white;--%>
<%--        }--%>

<%--        #first {--%>
<%--            margin-left: 0;--%>
<%--        }--%>
<%--        .wrap1 {--%>
<%--            width: 1000px;--%>
<%--            height: 100px;--%>
<%--            margin-left: auto;--%>
<%--            margin-right: auto;--%>
<%--        }--%>
<%--        header .public ul {--%>
<%--            width: 100%;--%>
<%--            background: none;--%>
<%--        }--%>
<%--    </style>--%>
<%--</head>--%>

<%--<body>--%>
<%--    <header>--%>
<%--        <div class="public">--%>
<%--            <div class="logoTo">--%>
<%--                <div class="logoTo_left">--%>
<%--                    &lt;%&ndash;<a href="index.html">&ndash;%&gt;--%>
<%--                        &lt;%&ndash;<img src="/static/images/logo.a180d.png" />&ndash;%&gt;--%>
<%--                    &lt;%&ndash;</a>&ndash;%&gt;--%>
<%--                </div>--%>
<%--                <div class="logoTo_right">--%>
<%--                    <div class="logoTo_right_sou">--%>
<%--                        <input type="text" value="农女福妃别太甜" />--%>
<%--                        <span></span>--%>

<%--                    </div>--%>
<%--                </div>--%>

<%--            </div>--%>
<%--            <div class="header_bottom">--%>
<%--                <div class="wrap1">--%>
<%--                    <ul class="middle">--%>
<%--                        <li id="first"><a href="${pageContext.request.contextPath}/book/getByType?bookType=1">首页</a></li>--%>
<%--                        <li><a href="${pageContext.request.contextPath}/book/getByType?bookType=1">排行榜</a></li>--%>
<%--                        <li><a href="${pageContext.request.contextPath}/book/getByType?bookType=1">免费</a></li>--%>
<%--                        <li><a href="${pageContext.request.contextPath}/book/getByType?bookType=2">玄幻仙侠</a></li>--%>
<%--                        <li><a href="${pageContext.request.contextPath}/book/getByType?bookType=3">轻小说</a></li>--%>
<%--                        <li><a href="${pageContext.request.contextPath}/book/getByType?bookType=4">古代</a></li>--%>
<%--                        <li><a href="${pageContext.request.contextPath}/book/getByType?bookType=5">现言</a></li>--%>
<%--                        <li><a href="${pageContext.request.contextPath}/book/getByType?bookType=6">完本</a></li>--%>
<%--                        <li><a href="${pageContext.request.contextPath}/book/getByType?bookType=7">青春</a></li>--%>
<%--                    </ul>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </header>--%>
<%--    <section>--%>
<%--        <div class="daohang">--%>
<%--            <a href="">首页&gt;</a>--%>
<%--            <a href="">现代言情&gt;</a>--%>
<%--            <a href="">婚恋情缘&gt;</a>--%>
<%--            <a href="">婚途脉脉</a>--%>
<%--        </div>--%>
<%--        <div class="novelduce">--%>
<%--            <div class="duce">--%>
<%--                <img src="${book.bookDetail.picAddress}" alt="">--%>
<%--                <h1>${book.bookName}</h1>--%>
<%--                <span>${book.author1.authorName} 著</span>--%>
<%--                <ul class="info clearfix">--%>
<%--                    <li>--%>
<%--                        <c:if test="${book.bookType==1}">--%>
<%--                            免费--%>
<%--                        </c:if>--%>
<%--                        <c:if test="${book.bookType==2}">--%>
<%--                            玄幻仙侠--%>
<%--                        </c:if>--%>
<%--                        <c:if test="${book.bookType==3}">--%>
<%--                            轻小说--%>
<%--                        </c:if>--%>
<%--                        <c:if test="${book.bookType==4}">--%>
<%--                            古代--%>
<%--                        </c:if>--%>
<%--                        <c:if test="${book.bookType==5}">--%>
<%--                            现言--%>
<%--                        </c:if>--%>
<%--                        <c:if test="${book.bookType==6}">--%>
<%--                            完本--%>
<%--                        </c:if>--%>
<%--                        <c:if test="${book.bookType==7}">--%>
<%--                            青春--%>
<%--                        </c:if>--%>
<%--                    </li>--%>
<%--                    <li>${book.releaseTime}</li>--%>
<%--                    <li>--%>
<%--                        <c:if test="${book.condition==1}">--%>
<%--                            已完结--%>
<%--                        </c:if>--%>
<%--                        <c:if test="${book.condition==2}">--%>
<%--                            连载中--%>
<%--                        </c:if>--%>
<%--                        <c:if test="${book.condition==3}">--%>
<%--                            下架--%>
<%--                        </c:if>--%>
<%--                    </li>--%>
<%--                </ul>--%>
<%--                <p>本书由本网站进行电子制作与发行</p>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="contentNovel">--%>
<%--            <h1>--%>
<%--                ${book.chapterList.get(0).chapterName}--%>
<%--            </h1>--%>
<%--            <ul class="info clearfix">--%>
<%--                <li>${book.bookName}</li>--%>
<%--                <li>${book.author1.authorName}</li>--%>
<%--                <li>${book.chapterList.get(0).chapterWordNumber}</li>--%>
<%--                <li>${book.chapterList.get(0).updateTime}</li>--%>
<%--            </ul>--%>
<%--            <div class="novelCont">--%>
<%--                <p>　　${book.chapterList.get(0).chapterContent}</p>--%>
<%--            </div>--%>
<%--            <c:if test="${page==1}">--%>
<%--                <a href="#">上一章</a>--%>
<%--            </c:if>--%>
<%--            <c:if test="${page>1}">--%>
<%--                <a href="${pageContext.request.contextPath}/shiduPage?bookId=${book.bookId}&page=${page-1}">上一章</a>--%>
<%--            </c:if>--%>
<%--            ${page}/${totalPage}--%>
<%--            <c:if test="${page==totalPage}">--%>
<%--                <a href="#">下一章</a>--%>
<%--            </c:if>--%>
<%--            <c:if test="${page<totalPage}">--%>
<%--                <a href="${pageContext.request.contextPath}/shiduPage?bookId=${book.bookId}&page=${page+1}">下一章</a>--%>
<%--            </c:if>--%>
<%--        </div>--%>
<%--    </section>--%>
<%--    <footer>--%>
<%--    </footer>--%>
<%--</body>--%>

<%--</html>--%>
<%@page contentType="text/html;charset=utf-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>shidu</title>
    <link rel="stylesheet" href="/static/css/shidu.css">
    <link href="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/5.3.3/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/5.3.3/js/bootstrap.bundle.min.js"></script>
    <style>
        .header_bottom {
            width: 100%;
            height: 50px;
            margin-top: 20px;
            background-color: blueviolet;
        }
        .middle {
            height: 50px;
            line-height: 50px;
        }
        .middle li {
            margin-left: 20px;
        }
        .middle li a {
            color: white;
        }
        #first {
            margin-left: 0;
        }
        .wrap1 {
            width: 1000px;
            margin-left: auto;
            margin-right: auto;
        }
        header .public ul {
            background: none;
        }
    </style>
</head>

<body>
<header>
    <div class="public">
        <div class="container-fluid">
            <div class="row align-items-center">
                <div class="col">
                    <div class="logoTo">
                        <div class="logoTo_left">
                            <%--<a href="index.html">--%>
                            <%--<img src="/static/images/logo.a180d.png" />--%>
                            <%--</a>--%>
                        </div>
                        <div class="logoTo_right">
                            <div class="logoTo_right_sou d-flex">
                                <input type="text" class="form-control" value="农女福妃别太甜" />
                                <span></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="header_bottom">
                <div class="wrap1">
                    <ul class="middle nav">
                        <li class="nav-item" id="first"><a class="nav-link" href="${pageContext.request.contextPath}/book/getByType?bookType=1">首页</a></li>
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/book/getByType?bookType=1">排行榜</a></li>
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/book/getByType?bookType=1">免费</a></li>
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/book/getByType?bookType=2">玄幻仙侠</a></li>
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/book/getByType?bookType=3">轻小说</a></li>
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/book/getByType?bookType=4">古代</a></li>
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/book/getByType?bookType=5">现言</a></li>
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/book/getByType?bookType=6">完本</a></li>
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/book/getByType?bookType=7">青春</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</header>
<section class="container mt-4">
    <div class="daohang">
        <a href="#">首页&gt;</a>
        <a href="#">现代言情&gt;</a>
        <a href="#">婚恋情缘&gt;</a>
        <a href="#">婚途脉脉</a>
    </div>
    <div class="novelduce row mt-4">
        <div class="duce col-md-6">
            <img src="${book.bookDetail.picAddress}" class="img-fluid" alt="">
            <h1>${book.bookName}</h1>
            <span>${book.author1.authorName} 著</span>
            <ul class="info list-unstyled">
                <li>
                    <c:choose>
                        <c:when test="${book.bookType==1}">免费</c:when>
                        <c:when test="${book.bookType==2}">玄幻仙侠</c:when>
                        <c:when test="${book.bookType==3}">轻小说</c:when>
                        <c:when test="${book.bookType==4}">古代</c:when>
                        <c:when test="${book.bookType==5}">现言</c:when>
                        <c:when test="${book.bookType==6}">完本</c:when>
                        <c:when test="${book.bookType==7}">青春</c:when>
                    </c:choose>
                </li>
                <li>${book.releaseTime}</li>
                <li>
                    <c:choose>
                        <c:when test="${book.condition==1}">已完结</c:when>
                        <c:when test="${book.condition==2}">连载中</c:when>
                        <c:when test="${book.condition==3}">下架</c:when>
                    </c:choose>
                </li>
            </ul>
            <p>本书由本网站进行电子制作与发行</p>
        </div>
    </div>
    <div class="contentNovel mt-4">
        <h1>${book.chapterList.get(0).chapterName}</h1>
        <ul class="info list-unstyled">
            <li>${book.bookName}</li>
            <li>${book.author1.authorName}</li>
            <li>${book.chapterList.get(0).chapterWordNumber}</li>
            <li>${book.chapterList.get(0).updateTime}</li>
        </ul>
        <div class="novelCont">
            <p>${book.chapterList.get(0).chapterContent}</p>
        </div>
        <div class="d-flex justify-content-between">
            <c:if test="${page==1}">
                <a href="#" class="btn btn-secondary disabled">上一章</a>
            </c:if>
            <c:if test="${page>1}">
                <a href="${pageContext.request.contextPath}/shiduPage?bookId=${book.bookId}&page=${page-1}" class="btn btn-primary">上一章</a>
            </c:if>
            <span>${page}/${totalPage}</span>
            <c:if test="${page==totalPage}">
                <a href="#" class="btn btn-secondary disabled">下一章</a>
            </c:if>
            <c:if test="${page<totalPage}">
                <a href="${pageContext.request.contextPath}/shiduPage?bookId=${book.bookId}&page=${page+1}" class="btn btn-primary">下一章</a>
            </c:if>
        </div>
    </div>
</section>
<footer class="text-center mt-4">
    <!-- Footer content -->
</footer>
</body>

</html>
