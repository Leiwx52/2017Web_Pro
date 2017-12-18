<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@ page import="java.io.*, java.util.*,org.apache.commons.io.*"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="org.apache.commons.fileupload.disk.*"%>
<%@ page import="org.apache.commons.fileupload.servlet.*"%>
<%@page language="java" import="java.util.*,java.sql.*"%>
<!DOCTYPE html>
<html>
	<head>
	<link rel="stylesheet" type="text/css" href="css/font-awesome.css"/>
		<meta charset="UTF-8">
		<title>用户登录</title>
		<style type="text/css">
		#header{background-color:rgba(185,185,185,0.5); position:fixed;right:0px;left:0px;top:0px;}
        #header_inner{margin:10px 40px;	margin-right:50px;}
		.nav_menu{display: inline-block;}
		.nav_login{float:right; margin:20px 0px;}
		li{list-style-type:none; float:left; text-align:center; padding:6px 15px; vertical-align:center; }
		#header a{color:white; text-shadow:-2px -2px 5px grey; font-family:楷体; font-weight:bold; font-size:30px;
			transition-duration:0.5s;transition-property:all;text-decoration:none;}
		#header a:hover{color:brown;}
		.fa{color:white;font-size:23px;margin-right:5px}
		
		.outer{background-image:url('img/sunset.jpg');background-repeat:no-repeat;background-size:cover;
				height:500px;width:1180px;position:relative;left:100px;top:100px}
		.inter1{height:400px;width:700px;float:left;position:relative;left:50px;top:50px}
		.inter2{height:400px;width:350px;float:left;position:relative;left:50px;top:50px}
		.form1{font-family:楷体;background-color:rgba(204,204,194,0.5);border:0px solid black;border-radius:8px;font-size:1.5em;margin:5px}
		input,.shuoming{font-family:楷体;margin-left:20px;border-radius:4px;font-size:1em}
		.hint{font-family:楷体;color:red;font-size:1.5em;font-size:bold}
		</style>
	</head>
	

	<body>
	<%  
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");//
	String password = request.getParameter("password");
	String login = request.getParameter("login");
	String register = request.getParameter("register");
	String exit = request.getParameter("exit");
	String hint = "" ;
	String rec = request.getParameter("p_hint");
		if(rec!=null) hint+="请先登录或注册，再查看攻略";
	String alink = "" ;
	Boolean f = true ;
	
	String msg ="";
	String connectString = "jdbc:mysql://172.18.187.230:53306/test"
		+ "?autoReconnect=true&useUnicode=true&characterEncoding=UTF-8";
	String user="user";
	String pwd="123";
	
	if (exit!=null){
		 response.sendRedirect("faxian.jsp");
	}
	else{
		//Database Connection
		//btn login pressed
		if(login!=null){
			if(name!=null&&name.equals("")){
				hint+=" 用户名不能为空！";
				f = false ;
			}
			if(password!=null&&password.equals("")){
				hint+=" 密码不能为空！";
				f = false ;
			}
			if(!f){
				hint+=" 请重新输入！";
			} 
			else{//检查是否可以登录
				try{
					Class.forName("com.mysql.jdbc.Driver");
					Connection con = DriverManager.getConnection(connectString,user,pwd);
					Statement stmt = con.createStatement();
					String sql="select * from USERS where name = '"+name+"';";
					ResultSet rs=stmt.executeQuery(sql);
					if(!rs.next()){			//不存在用户
						hint += "不存在该用户，请重新登录！";
					}else{
						if(rs.getString("password").equals(password)){
							alink = "faxian.jsp?pname=" + name ;
							session.setAttribute("pname",name);
							response.sendRedirect(alink);
						}else{
							hint += "密码错误！请重新登录！";
							
						}
					}
					stmt.close(); con.close();
				}
				catch(Exception e){
					msg = e.getMessage();
				}
			}
		}
		
		//btn register pressed
		if(register!=null){
			if(name!=null&&name.equals("")){
				hint+="用户名不能为空！";
				f = false ;
			}
			if(password!=null&&password.equals("")){
				hint+=" 密码不能为空！";
				f = false ;
			}
			if(!f){
				hint+=" 请重新输入！";
			} 
			else{
				try{
					Class.forName("com.mysql.jdbc.Driver");
					Connection con = DriverManager.getConnection(connectString,user, pwd);
					Statement stmt = con.createStatement();
					String sql="select * from USERS where name = '"+name+"';";
					ResultSet rs=stmt.executeQuery(sql);
					if(rs.next()){
						hint+="用户名已存在，请重新创建！";
						
					}else{
						String fmt="insert into USERS(name,password) values('%s', '%s')";
						sql = String.format(fmt,name,password);
						int cnt = stmt.executeUpdate(sql);
						if(cnt>0){
							hint+="创建用户"+name+"成功，登录更精彩！";
						}
						
					}
					stmt.close(); con.close();
				}
				catch(Exception e){
					msg = e.getMessage();
				}
				
			}
		}
	}
	

%>
				<!--头部导航栏-->
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
            	<a href="#">登录</a>
            </div>
        </div>
    </div>
 
		
		<div class="outer">
			<div class="inter1">
			
			</div>
			<div class="inter2">
				<div>
					<form class="form1" action="login.jsp" method="post" enctype="application/x-www-form-urlencoded">
						<span class="shuoming">用户名：</span>
							<input name="name" type="text" maxlength=10 value="" style="margin-top:20px"><br><br>
						<span class="shuoming">密&nbsp&nbsp码：</span>
							<input name="password" type="password"  value=""><br><br>
						<input name="login" type="submit" value="登录" style="padding:5px;border-radius:8px">&nbsp&nbsp
						<input name="register" type="submit" value="注册" style="padding:5px;border-radius:8px">&nbsp&nbsp
						<input name="exit" type="submit" value="退出" style="padding:5px;margin-bottom:20px;border-radius:8px">
					</form>
				</div>
				<div class="hint"><%=hint%></div>
			</div>
		
		</div>
	
	
	
	</body>
</html>