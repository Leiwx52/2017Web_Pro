<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@ page import="java.io.*, java.util.*,org.apache.commons.io.*"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="org.apache.commons.fileupload.disk.*"%>
<%@ page import="org.apache.commons.fileupload.servlet.*"%>
<%@ page language="java" import="java.util.*,java.sql.*"%>
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="css/font-awesome.css"/>
		<meta charset="UTF-8">
		<title>编辑我的攻略</title>
		<style>
		*{font-family:楷体;font-size:1em}
			#header{background-color:rgba(185,185,185,0.5); position:fixed;right:0px;left:0px;top:0px;}
			#header_inner{margin:10px 40px;	margin-right:50px;}
			.nav_menu{display: inline-block;}
			.nav_login{float:right; margin:20px 0px;}
			li{list-style-type:none; float:left; text-align:center; padding:6px 15px; vertical-align:center; }
			#header a{color:white; text-shadow:-2px -2px 5px grey; font-family:楷体; font-weight:bold; font-size:30px;
			transition-duration:0.5s;transition-property:all;text-decoration:none;}
			#header a:hover{color:brown;}
			.fa{color:white;font-size:23px;margin-right:5px}
		</style>
	</head>
	<body>
	<%request.setCharacterEncoding("utf-8");%>
	<%
	
		String setContent = "" ;
		String f = "";
		String user_name = "";
		String name_or_login = (String)session.getAttribute("pname");
		String article_id = request.getParameter("article_id");
		
		if(name_or_login==null) {
			name_or_login="登录";
		}else{
			user_name = name_or_login ;
			name_or_login="Hi,"+name_or_login+" 编辑攻略";
		}
		
		if(article_id!=null){
			String msg ="";
			String connectString = "jdbc:mysql://172.18.187.230:53306/test"
							+ "?autoReconnect=true&useUnicode=true"
							+ "&characterEncoding=UTF-8"; 
			try{
			  Class.forName("com.mysql.jdbc.Driver");
			  Connection con=DriverManager.getConnection(connectString, "user", "123");
			  Statement stmt=con.createStatement();
			  String fmt="insert into sta_table(author,pic_path,content) values('%s','%s','%s')";
			  String sql = "select * from sta_table where id='"+article_id+"';";
			  ResultSet rs=stmt.executeQuery(sql);
			  if(rs.next()){		
				setContent = "(在此处修改内容)"+rs.getString("content");
			  }
				stmt.close();
				con.close();
			}
			  catch (Exception e){
			  msg = e.getMessage();
			  out.print(msg);
			}
			
		}
		
		String title_ = "";
		String content_ = "";
	
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		if(isMultipart){
			FileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			List items = upload.parseRequest(request);
			String tmp = "";
			
			FileItem fi0 = (FileItem)items.get(0);//title
			FileItem fi1 = (FileItem)items.get(1);//file
			FileItem fi2 = (FileItem)items.get(2);//content
			FileItem fi3 = (FileItem)items.get(3);//submit
			title_ = fi0.getString("utf-8");
			content_ = fi2.getString("utf-8");	
			DiskFileItem dfi = (DiskFileItem)fi1;
		
			if(fi3.getString("utf-8").equals("取消"))
				response.sendRedirect("wanzhuan.jsp");
			
			else{
				if(!dfi.getName().trim().equals("")){
					String fileName = application.getRealPath("/file")
					+System.getProperty("file.separator")
					+user_name+"_"+title_+"_"
					+FilenameUtils.getName(dfi.getName());
					f = "file/"+user_name+"_"+title_+"_"+FilenameUtils.getName(dfi.getName());
					dfi.write(new File(fileName));
					
					//database
					String msg ="";
					String connectString = "jdbc:mysql://172.18.187.230:53306/test"
									+ "?autoReconnect=true&useUnicode=true"
									+ "&characterEncoding=UTF-8"; 
					try{
					  Class.forName("com.mysql.jdbc.Driver");
					  Connection con=DriverManager.getConnection(connectString, "user", "123");
					  Statement stmt=con.createStatement();
					  String fmt="insert into sta_table(author,pic_path,content) values('%s','%s','%s')";
					  String sql = String.format(fmt,user_name,f,content_);
					  stmt.executeUpdate(sql);
					  stmt.close();
					  con.close();
					}
					catch (Exception e){
					  msg = e.getMessage();
					  out.print(msg);
					}	
					response.sendRedirect("wanzhuan.jsp");
				}
				
				else if(article_id!=null){
					String msg ="";
					String connectString = "jdbc:mysql://172.18.187.230:53306/test"
									+ "?autoReconnect=true&useUnicode=true"
									+ "&characterEncoding=UTF-8"; 
					try{
						Class.forName("com.mysql.jdbc.Driver");
						Connection con=DriverManager.getConnection(connectString, "user", "123");
						Statement stmt=con.createStatement();
						String sql = "update sta_table set content='"+content_+"' where id="+article_id+";";
						out.print(sql);
						stmt.executeUpdate(sql);			 
						stmt.close();
						con.close();
					}
					catch (Exception e){
					  msg = e.getMessage();
					  out.print(msg);
					}	
					response.sendRedirect("wanzhuan.jsp");
				}
				
				
			}
			
			
		}
		
		
	%>
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
					<a href="#"><%=name_or_login%></a>
				</div>
			</div>
		</div>
		
		<div style="position:relative;left:100px;top:100px">
			<form class="formEdit" action="edit.jsp?article_id=<%=article_id%>" method="POST" enctype="multipart/form-data"
				>
				<span class="shuoming">标题：</span>
					<input name="title" type="text" maxlength=20 value="" style="margin-top:20px"><br><br>
					<p>文件名：<input type="file" name="file" size=24></p>
				<span class="content" style="vertical-align:top;">内容：</span>
					<textarea name="content" id="content" placeholder="在这里输入内容" 
					style="width:600px;height:300px;"><%=setContent%></textarea><br><br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
				<input name="login" type="submit" value="提交" style="padding:5px;border-radius:8px" onclick="return isEmpty()">&nbsp&nbsp
				<input name="exit" type="submit" value="取消" style="padding:5px;margin-bottom:20px;border-radius:8px">
			</form>	
		</div>
		<div></div>
	</body>
</html>

<script type="text/javascript">
	function isEmpty() {
		var ta = document.getElementById("content");
		if(ta.value.length == 0){
			alert("攻略内容不能为空"); //弹出提示
			ta.focus();		//定位到评论文本框 
			return false;
		}
		return true;
	}
</script>