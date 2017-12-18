<%@ page language="java" import="java.util.*,java.sql.*" 
         contentType="text/html; charset=utf-8"%>

<%
	String sta_id = request.getParameter("article_id");
	String pgno = request.getParameter("pgno");
	String pgcnt = request.getParameter("pgcnt");
	String user = "user" ;
	String pwd = "123" ;
	String msg ="";
	String connectString = "jdbc:mysql://172.18.187.230:53306/test"
					+ "?autoReconnect=true&useUnicode=true"
					+ "&characterEncoding=UTF-8";
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(connectString,user, pwd);
	Statement stmt = con.createStatement();
	
	String text_content = request.getParameter("textarea");
	String name_or_login = (String)session.getAttribute("pname");
	if(request.getMethod().equalsIgnoreCase("post")){
	 	
		try{
		 	String fmt="insert into com_table(article_id,comment_user,content) values('%s', '%s', '%s')";
		 	String sql = String.format(fmt,sta_id,name_or_login,text_content);
		 	int cnt = stmt.executeUpdate(sql);
		}
		catch(Exception e){
			msg = e.getMessage();}
	}

	//显示攻略内容
	StringBuilder author = new StringBuilder("");
	StringBuilder pic_path = new StringBuilder("");
	StringBuilder content = new StringBuilder("");
	try{
		String sql = "select * from sta_table where id='"+sta_id+"';";
		ResultSet rs=stmt.executeQuery(sql);
		if(rs.next()){
			//style implementation
			author.append(rs.getString("author"));
			pic_path.append(rs.getString("pic_path"));
			content.append(rs.getString("content"));
		}
	}catch(Exception e){
		msg = e.getMessage();
	}
	
	//显示评论内容
	StringBuilder ccomment = new StringBuilder("");
	try{
		String sql = "select * from com_table where article_id='"+sta_id+"';";
		ResultSet rs=stmt.executeQuery(sql);
		while(rs.next()){
			ccomment.append(String.format("<div><p><i class=\"fa fa-user-circle-o\"></i><span>%s</span></p><p class=\"content_txt\">%s<p></div>",rs.getString("comment_user"),rs.getString("content")));
		}
		stmt.close();
		con.close();
	}catch(Exception e){
		msg = e.getMessage();
	}	
%>

<!DOCTYPE HTML>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="css/font-awesome.css"/>
    <title>评论</title>

    <style>
        body{background:rgb(245,245,245); margin:0;}
        .clear{clear:both}
        
        /* 导航样式 */
        #header{background-color:rgba(185,185,185,0.6); position:fixed;right:0px;left:0px;top:0px;}
        #header_inner{margin:10px 40px;	margin-right:50px;}
		.nav_menu{display: inline-block;}
		.nav_login{float:right; margin:20px 0px;}
		#header li{list-style-type:none; float:left; text-align:center; padding:6px 15px; vertical-align:center; }
		#header a{color:white; text-shadow:-2px -2px 5px grey; font-family:楷体; font-weight:bold; font-size:30px;
			transition-duration:0.5s;transition-property:all;text-decoration:none;}
		#header a:hover{color:brown;}
		#header .fa{color:white;font-size:23px;margin-right:5px}
		
        /* 攻略内容样式 */
        #strategy_outer {}
		#strategy {margin:0 auto; padding:0 80px 120px 80px; font-family:楷体;}
		.strategy_photo {text-align:center}
		.strategy_txt {text-align:center}
		.strategy_txt p {text-indent:2em; font-size:1.5rem;}
		.strategy_author {float:right}
		.strategy_author p {font-style:italic}
           
		/* 评论样式 */
		#comment_outer {}
		#comment {padding-left:40px; padding-right:40px; font-family:楷体; font-size:1.2rem;}
		.comment_title {font-size:1.5rem; font-weight:600; border-bottom:0.5px solid #AAAAAA; padding-bottom:15px}
		.comment_content {width:1230px; margin:30px;}
		.comment_content div {margin-bottom:50px; padding:10px 10px; box-shadow: -5px 7px 14px #808080, inset -5px 7px 14px rgb(245,245,245);background-image:url('img/timg.jpg');background-position:right}
		.comment_content i{font-size:1.5rem;}
		.comment_content span{}
		.comment_content .content_txt{text-indent:2em;width:600px;font-weight: bold;}
		
		
		/* 发表自己的评论样式 */
		#self_outer {margin:50px 0}
		#self {padding-left:70px; padding-right:50px}
		#self textarea {font-size:1.4em; width:100%}
		#self input {font-size:1.1em; float:right; margin-left:20px}
		
		
        /* 引脚样式 */
        #footer_outer{background-color:rgba(100,100,100,0.5); color:white; padding:1rem 0 1rem;}
        #footer{padding:0 0; font-size:15px; text-align:center}
        #footer div {}
    </style>

</head>
<body>
	<!-- 导航 -->
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
            	<a href="wanzhuan.jsp?pgno=<%=pgno%>&pgcnt=<%=pgcnt%>">返回</a>
            </div>
        </div>
    </div>
    
    
    <!-- 攻略内容 -->
    <div id="strategy_outer">
    	<div id="strategy">
    		<div class="strategy_photo">
    			<img src=<%=pic_path%>>
    		</div>
    		<div class="strategy_txt">
    			<p><%=content%></p>
    		</div>
    		<div class="strategy_author">
    			<p>——作者：<span><%=author%></span></p>
    		</div>
    	</div>
    	<div class="clear"></div>
    </div>
	
	
	<!-- 评论 -->
	<div id="comment_outer">
    	<div id="comment">
    		<div class="comment_title">相关评论</div>
    		<div class="comment_content">
    			<%=ccomment%>
    		</div>
    	</div>
    	<div class="clear"></div>
    </div>
	
	
	<!-- 发表自己的评论 -->
	<div id="self_outer">
    	<div id="self">
			<script type="text/javascript">
				function isEmpty() {
					var ta = document.getElementById("textarea");
					if(ta.value.length == 0){
						alert("评论不能为空"); //弹出提示
						ta.focus();		//定位到评论文本框 
						return false;
					}
					return true;
				}
			</script>
    		
    		<form action="comment.jsp?article_id=<%=sta_id%>&pgno=<%=pgno%>&pgcnt=<%=pgcnt%>" method="post" enctype="application/x-www-form-urlencoded">
				<textarea id="textarea" maxlength="100" rows="7"" name="textarea" 
					placeholder="在这里写下自己的评论，最多300字" ></textarea>
				<p>
					<input type="submit" name="submit" value=" 提交评论 " onclick="return isEmpty();">
					<input type="reset" value=" 清除 ">
				</p>
			</form>
    	</div>
    	<div class="clear"></div>
    </div>
	
	
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
		</div>
		<div class="clear"></div>
	</div>
</body>
</html>