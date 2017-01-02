<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page import="bean.Page" %>
<%@ page import="bean.StudentInfo" %>
<%@ page import="bean.ruisibean" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

    <!-- bootstrap table   -->
    <link href="//cdn.bootcss.com/bootstrap-table/1.11.0/bootstrap-table.min.css" rel="stylesheet">
    <script src="//cdn.bootcss.com/bootstrap-table/1.11.0/bootstrap-table.min.js"></script>
    <script src="//cdn.bootcss.com/bootstrap-table/1.11.0/bootstrap-table-locale-all.js"></script>
    <script src="//cdn.bootcss.com/bootstrap-table/1.11.0/extensions/export/bootstrap-table-export.min.js"></script>
    <!-- bootstrap table 包含excel导出，pdf导出 -->
    <script src="https://rawgit.com/hhurz/tableExport.jquery.plugin/master/tableExport.js"></script>
    <script src="//cdn.bootcss.com/FileSaver.js/2014-11-29/FileSaver.min.js"></script>
    <meta charset="UTF-8">
    <base href="<%=basePath%>">

    <title>帖子信息</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">

    <style type="text/css">
        /*div#container {*/
            /*width: 100%*/
        /*}*/

        /*div#header {*/
            /*background-color: #99bbbb;*/
            /*height: 105px;*/
            /*text-align: center;*/
        /*}*/

        /*div#menu {*/
            /*background-color: #F0F8FF;*/
            /*height: 100%;*/
            /*width: 100%;*/
            /*float: left;*/
        /*}*/

    </style>

</head>

<body>
<div id="container">
    <div id="header">
        <br>
        <h1>
            帖子信息
        </h1>
        <br>
        <hr>
    </div>
    <br>
    <div id="menu">
        <h3>
            全部帖子信息如下
        </h3>
        <table  id="demo" class="table table-striped table-hover table-bordered" >
            <%--width="100%" border="100" cellSpacing=1    style="border: 1pt dashed; font-size: 15pt; background-color: #99bbbb;" height="31">--%>
            <tr>
                <td>
                    标题
                </td>
                <td>
                    链接
                </td>
                <td>
                    浏览量
                </td>
            </tr>
            <%
                response.setCharacterEncoding("UTF-8");
                request.setCharacterEncoding("UTF-8");
//                Page pager = (Page) request.getAttribute("pager");
                List<ruisibean> subResult = (List<ruisibean>) request
                        .getAttribute("alldata");
                if (!subResult.isEmpty()) {
                    for (int i = 0; i < subResult.size(); i++) {
                        ruisibean st = subResult.get(i);
                        out.print("<tr>");
                        out.print("<td>" + st.getTitle() + "</td>");
                        out.print("<td><a href=" + st.getUrl() + ">详情</a></td>");
                        out.print("<td>" + st.getNum() + "</td>");
            %>
            <%--<td>--%>
            <%--<a href="AllServlet?id=<%=st.getViewNum()%>&methodName=<%=2%>"--%>
            <%--onclick="return confirmdialog()">删除</a>--%>
            <%--</td>--%>

            <%--<td>--%>
            <%--<a--%>
            <%--href="AllServlet?id=<%=st.getViewNum()%>&name=<%=""%>&methodName=<%=4%>">修改</a>--%>
            <%--</td>--%>
            <%
                        out.print("</tr>");
                    }
                }
            %>
        </table>
        <br>
    </div>
    <br>
</div>

</body>

</html>
