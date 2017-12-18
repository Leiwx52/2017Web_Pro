<%@ page language="java" import="java.util.*,java.sql.*" 
         contentType="text/html; charset=utf-8"%>
<%
    request.setCharacterEncoding("utf-8");
	  String name_or_login = (String)session.getAttribute("pname");
	  String name = "" ;
	  String checkme = request.getParameter("p_flag");
    String delete_me = request.getParameter("delete_me");
    String delete_all = request.getParameter("delete_all");
    String delete_id = request.getParameter("delete_id");
	  Boolean f = true;
		if(name_or_login==null) {
			name_or_login="登录";
			response.sendRedirect("login.jsp?p_hint=needtologin");
		}
		else{
			name = name_or_login ;
			name_or_login="Hi,"+name_or_login;
		}
		
    String connectString = "jdbc:mysql://172.18.187.230:53306/test"
                    + "?autoReconnect=true&useUnicode=true"
                    + "&characterEncoding=UTF-8"; 
    StringBuilder comment = new StringBuilder("");
    StringBuilder page_c = new StringBuilder("");
    String msg ="";
    String key = request.getParameter("key");
    String comment_cla = "inner_comment";
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection(connectString, "user", "123");
    Statement stmt=con.createStatement();
    Integer pgno = 0;
    Integer pgcnt = 4;
    String param = request.getParameter("pgno");
    if(param!=null && !param.isEmpty()){
      pgno = Integer.parseInt(param);
    }
    param = request.getParameter("pgcnt");
    if(param!=null && !param.isEmpty()){
      pgcnt = Integer.parseInt(param);
    }
    int pgprev = (pgno>0)?pgno-1:0;
    int pgnext = pgno+1;

    if(delete_me!=null){
      int cnt = stmt.executeUpdate("delete from sta_table where id='"+delete_id+"';");
      try{
          ResultSet rs=stmt.executeQuery("select * from sta_table where author=\'" +name+ "\';");
          rs.last();
          if(rs.getRow()!=0){
            comment.append("<div align=\"center\" style=\"margin-left:20px\">查找到"+rs.getRow()+"条我的攻略</div>");
          }
          else{comment.append("<div align=\"center\" style=\"margin-left:20px\">还没有属于自己的攻略</div>");}
          rs.beforeFirst();
          while(rs.next()) {
          comment.append(String.format("<div class=\"%s\"><p><i class=\"fa fa-user-circle-o\"></i> %s<a style=\"float:right;text-decoration:none;font-size:20px\" href=\"wanzhuan.jsp?delete_me=true&delete_id=%s\">删除</a><a style=\"float:right;text-decoration:none;font-size:20px;margin-right:20px\" href=\"comment.jsp?article_id=%s&pgno="+pgno+"&pgcnt="+pgcnt+"\">评论</a><a style=\"float:right;text-decoration:none;font-size:20px;margin-right:20px\" href=\"edit.jsp?article_id=%s\">修改</a></p><div class=\"comment_img\"><img src=\"%s\" style=\"width:500px;height:300px\"></div><div style=\"margin-right:100px;float:right;width:500px;height:300px;overflow-y:scroll\"><p style=\"word-wrap:break-word;font-size:25px\">%s</p></div></div><br>",comment_cla,rs.getString("author"),rs.getString("id"),rs.getString("id"),rs.getString("id"),rs.getString("pic_path"),rs.getString("content")));
          }
          rs.close();
          stmt.close();
          con.close();
        }
        catch (Exception e){
        msg = e.getMessage();}
    }
    else if(delete_all!=null){
      int cnt = stmt.executeUpdate("delete from sta_table where id='"+delete_id+"';");
      try{
          ResultSet rs=stmt.executeQuery("select * from sta_table;");
          while(rs.next()) {
          comment.append(String.format("<div class=\"%s\"><p><i class=\"fa fa-user-circle-o\"></i> %s<a style=\"float:right;text-decoration:none;font-size:20px\" href=\"wanzhuan.jsp?delete_all=true&delete_id=%s\">删除</a><a style=\"float:right;text-decoration:none;font-size:20px;margin-right:20px\" href=\"comment.jsp?article_id=%s&pgno="+pgno+"&pgcnt="+pgcnt+"\">评论</a></p><div class=\"comment_img\"><img src=\"%s\" style=\"width:500px;height:300px\"></div><div style=\"margin-right:100px;float:right;width:500px;height:300px;overflow-y:scroll\"><p style=\"word-wrap:break-word;font-size:25px\">%s</p></div></div><br>",comment_cla,rs.getString("author"),rs.getString("id"),rs.getString("id"),rs.getString("pic_path"),rs.getString("content")));
          }
          rs.close();
          stmt.close();
          con.close();
        }
        catch (Exception e){
        msg = e.getMessage();}
    }
    if(request.getMethod().equalsIgnoreCase("post")){
        try{
          ResultSet rs=stmt.executeQuery("select * from sta_table where content LIKE '%"+key+"%' or author LIKE '%"+key+"%'");
          rs.last();
          if(rs.getRow()!=0){
            comment.append("<div align=\"center\" style=\"margin-left:20px\">查找到"+rs.getRow()+"条相关攻略</div>");
          }
          else{comment.append("<div align=\"center\" style=\"margin-left:20px\">没有找到相关的攻略</div>");}
          rs.beforeFirst();
          while(rs.next()) {
          if(name.equals("Admin")){
            comment.append(String.format("<div class=\"%s\"><p><i class=\"fa fa-user-circle-o\"></i> %s<a style=\"float:right;text-decoration:none;font-size:20px\" href=\"wanzhuan.jsp?delete_all=true&delete_id=%s\">删除</a><a style=\"float:right;text-decoration:none;font-size:20px;margin-right:20px\" href=\"comment.jsp?article_id=%s&pgno="+pgno+"&pgcnt="+pgcnt+"\">评论</a></p><div class=\"comment_img\"><img src=\"%s\" style=\"width:500px;height:300px\"></div><div style=\"margin-right:100px;float:right;width:500px;height:300px;overflow-y:scroll\"><p style=\"word-wrap:break-word;font-size:25px\">%s</p></div></div><br>",comment_cla,rs.getString("author"),rs.getString("id"),rs.getString("id"),rs.getString("pic_path"),rs.getString("content")));
          }
          else{
            comment.append(String.format("<div class=\"%s\"><p><i class=\"fa fa-user-circle-o\"></i> %s<a style=\"float:right;text-decoration:none;font-size:20px;margin-right:20px\" href=\"comment.jsp?article_id=%s&pgno="+pgno+"&pgcnt="+pgcnt+"\">评论</a></p><div class=\"comment_img\"><img src=\"%s\" style=\"width:500px;height:300px\"></div><div style=\"margin-right:100px;float:right;width:500px;height:300px;overflow-y:scroll\"><p style=\"word-wrap:break-word;font-size:25px\">%s</p></div></div><br>",comment_cla,rs.getString("author"),rs.getString("id"),rs.getString("pic_path"),rs.getString("content")));
          }
        }
          rs.close();
          stmt.close();
          con.close();
        }
        catch (Exception e){
        msg = e.getMessage();}
    }
    else if(checkme!=null){
        try{
          ResultSet rs=stmt.executeQuery("select * from sta_table where author=\'" +name+ "\';");
          rs.last();
          if(rs.getRow()!=0){
            comment.append("<div align=\"center\" style=\"margin-left:20px\">查找到"+rs.getRow()+"条我的攻略</div>");
          }
          else{comment.append("<div align=\"center\" style=\"margin-left:20px\">还没有属于自己的攻略</div>");}
          rs.beforeFirst();
          while(rs.next()) {
          comment.append(String.format("<div class=\"%s\"><p><i class=\"fa fa-user-circle-o\"></i> %s<a style=\"float:right;text-decoration:none;font-size:20px\" href=\"wanzhuan.jsp?delete_me=true&delete_id=%s\">删除</a><a style=\"float:right;text-decoration:none;font-size:20px;margin-right:20px\" href=\"comment.jsp?article_id=%s&pgno="+pgno+"&pgcnt="+pgcnt+"\">评论</a><a style=\"float:right;text-decoration:none;font-size:20px;margin-right:20px\" href=\"edit.jsp?article_id=%s\">修改</a></p><div class=\"comment_img\"><img src=\"%s\" style=\"width:500px;height:300px\"></div><div style=\"margin-right:100px;float:right;width:500px;height:300px;overflow-y:scroll\"><p style=\"word-wrap:break-word;font-size:25px\">%s</p></div></div><br>",comment_cla,rs.getString("author"),rs.getString("id"),rs.getString("id"),rs.getString("id"),rs.getString("pic_path"),rs.getString("content")));
          }
          rs.close();
          stmt.close();
          con.close();
        }
        catch (Exception e){
        msg = e.getMessage();}
    }
    else{      
      try{
        ResultSet rs=stmt.executeQuery("select * from sta_table limit "+pgno*pgcnt+","+pgcnt+";");
        while(rs.next()) {
          if(name.equals("Admin")){
            comment.append(String.format("<div class=\"%s\"><p><i class=\"fa fa-user-circle-o\"></i> %s<a style=\"float:right;text-decoration:none;font-size:20px\" href=\"wanzhuan.jsp?delete_all=true&delete_id=%s\">删除</a><a style=\"float:right;text-decoration:none;font-size:20px;margin-right:20px\" href=\"comment.jsp?article_id=%s&pgno="+pgno+"&pgcnt="+pgcnt+"\">评论</a></p><div class=\"comment_img\"><img src=\"%s\" style=\"width:500px;height:300px\"></div><div style=\"margin-right:100px;float:right;width:500px;height:300px;overflow-y:scroll\"><p style=\"word-wrap:break-word;font-size:25px\">%s</p></div></div><br>",comment_cla,rs.getString("author"),rs.getString("id"),rs.getString("id"),rs.getString("pic_path"),rs.getString("content")));
          }
          else{
            comment.append(String.format("<div class=\"%s\"><p><i class=\"fa fa-user-circle-o\"></i> %s<a style=\"float:right;text-decoration:none;font-size:20px;margin-right:20px\" href=\"comment.jsp?article_id=%s&pgno="+pgno+"&pgcnt="+pgcnt+"\">评论</a></p><div class=\"comment_img\"><img src=\"%s\" style=\"width:500px;height:300px\"></div><div style=\"margin-right:100px;float:right;width:500px;height:300px;overflow-y:scroll\"><p style=\"word-wrap:break-word;font-size:25px\">%s</p></div></div><br>",comment_cla,rs.getString("author"),rs.getString("id"),rs.getString("pic_path"),rs.getString("content")));
          }
        }
        rs.close();
        stmt.close();
        con.close();
      }
      catch (Exception e){
        msg = e.getMessage();}
      page_c.append("<div class=\"change_page\" align=\"center\"><a href=\"wanzhuan.jsp?pgno=" +pgprev+ "&pgcnt=" +pgcnt+ "\">上一页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href=\"wanzhuan.jsp?pgno=" +pgnext+ "&pgcnt=" + pgcnt+ "\">下一页</a></div>");
    }
    
%>

<!DOCTYPE HTML>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="css/font-awesome.css"/>

    <title>玩转苏州</title>

    <style>
        body{background:rgb(245,245,245); margin:0;}
        a{text-decoration:none;font-family:楷体;font-size:20px;font-weight:bold;}
        #header{background-color:rgba(185,185,185,0.6); position:fixed;right:0px;left:0px;top:0px;}
        #header_inner{margin:10px 40px;	margin-right:50px;}
  		  .nav_menu{display: inline-block;}
  		  .nav_login{float:right; margin:20px 0px;}
    		li{list-style-type:none; float:left; text-align:center; padding:6px 15px; vertical-align:center; }
    		#header a{color:white; text-shadow:-2px -2px 5px grey; font-family:楷体; font-weight:bold; font-size:30px;
    			transition-duration:0.5s;transition-property:all;text-decoration:none;}
    		#header a:hover{color:brown;}
    		#header .fa{color:white;font-size:23px;margin-right:5px}
        .comment{padding:10px;font-family:楷体; font-weight:bold; font-size:30px;}
        .inner_comment{margin:20px; background-image:url('img/logohead.png');background-size: cover;padding:15px 30px; box-shadow: -6px 8px 14px #808080, inset -6px 8px 14px rgb(245,245,245);}
        .comment_img{height:300px; width:500px;display:inline-block;}
        .search{height:30px;}
        .search_inner{margin:15px 60px 0px 80px;padding-top:10px}
        form{float:left;font-family:楷体;font-size:20px;font-weight:bold;}
        .change_page{margin:-10px 50px 20px 0px;float:right}

        /* 页脚样式 */
        #footer_outer{background-color:rgba(100,100,100,0.5); color:white; padding:1rem 0 1rem;}
        #footer{padding:0 0; font-size:15px; text-align:center}
        #footer div {}
    </style>

</head>
<body>
    <div id="header">
        <div id="header_inner">
            <img src="img/logo.png">
            <div class="nav_menu">
            	<ul class="wrapper">
            		<li><a href="faxian.jsp">发现苏州</a></li>
            		<li><a href="tuwen.jsp">图文苏州</a></li>
                <li><a href="wanzhuan.jsp">玩转苏州</a></li>
            	</ul>
            </div>
            <div class="nav_login">
            	<i class="fa fa-user-o"></i>
            	<a href="login.jsp"><%=name_or_login%></a>
            </div>
        </div>
    </div>
    <div align="center">
        <img src="img/tim.jpg" style="width:100%">
        <div class="search">
          <div class="search_inner">
            <form action="wanzhuan.jsp" method="post" name="f">
              查找攻略: <input id="key" name="key" type="text">
                        <input type="submit" name="sub" value="查找">
            </form>
            <a href="edit.jsp" style="float:right;margin-right:10px">添加攻略</a>
			      <a href="wanzhuan.jsp?p_flag=checkme" style="float:right;margin-right:20px">查看我的攻略</a>            
          </div>
        </div>
    </div>
    <div class="comment">
        <%=comment%>
    </div>
    <%=page_c%>

    <div style="clear:both;"></div>

    <!-- 引脚 -->
    <div id="footer_outer">
        <div id="footer">
      <div>
        <p>队名: 26262</p>
      </div>
      <div>
        <p>成员</p>
        <span>15352142 黄宇阳</span>
        <span>15352152 孔智锋</span>
        <span>15352153 赖灵犀</span>
        <span>15352156 雷伟贤</span>
      </div>
      <div>
        <p>地址: 中山大学数据与计算机学院</p>
      </div>
      <div>
        <span>All right reserved &copy; 2017 "发现苏州"</span>
        <span>隐私保护</span>
        <span>Create by 26262</span>
      </div>
      <div class="clear"></div>
        </div>
    </div>
</body>
</html>
