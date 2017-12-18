<!DOCTYPE HTML>
<html>
<head>
    <meta content="text/html; charset=utf-8">
    <link rel="stylesheet" type="text/css" href="css/font-awesome.css"/>
    
    <title>发现苏州</title>
    <style>
    	/* 全局样式 */ 
		body {margin:0; background-color:rgb(250,240,230)}
		.clear {clear:both}
		
		/* nav样式 */
		#nav_outer {background-color:rgba(185,185,185,0.5); position:fixed;right:0px;left:0px;top:0px; z-index:100;}
		#nav {margin:10px 40px;	margin-right:50px;}
		.nav_menu {display: inline-block;}
		.nav_login {float:right; margin:20px 0px;}
		#nav li {list-style-type:none; float:left; text-align:center; padding:6px 15px; vertical-align:center;}
		#nav_outer a {color:white; text-shadow:-2px -2px 5px grey; font-family:楷体; font-weight:bold; font-size:30px;
			transition-duration:0.5s;transition-property:all;text-decoration:none;}
		#nav_outer a:hover {color:brown;}
		#nav_outer .fa{color:white;font-size:23px;margin-right:5px}
		
		/* 轮播图样式 */
		#slides_outer {width:100%; height:854px; overflow:hidden; position:relative;}
		#slides {position:relative; width:100%; height:854px; margin:0 auto}
		.slide {width:100%; height:854px; position:absolute; left:0px; top:0px; transition-property: opacity;transition-duration: 2s;}
		#lastSlideIcon {width:50px; height: 854px; position:absolute; left:60px;top:0px; z-index:10; cursor:pointer}
		#lastSlideIcon img {position:absolute; left:0px;top:400px;}
		#nextSlideIcon {width:50px; height: 854px; position:absolute; right:60px;top:0px; z-index:10; cursor:pointer}
		#nextSlideIcon img {position:absolute; right:0px;top:400px;}
		#slideBtn {position:absolute; left:600px;top:700px; z-index:10;}
		#slideBtn li {float:left; font-size:50px; cursor:pointer}
		
		/* 正文 */
		#mian_outer{padding:60px 0;}
		#main{width:1280px; margin:0 auto; padding-bottom:100px; font-size:24px; font-family:楷体;}
		
		/* 正文简介样式 */
		.introduce_title{text-align:center;}
		.introduce_txt{padding:0px 5em 20px 5em;}
		.introduce_txt p{text-align:center; margin-bottom:2rem; text-indent:2em; font-size:1.5rem;}
		.introduce_btn{text-align:center; margin-top:1rem;}
		.introduce_btn a{text-decoration:none; padding:1rem 4rem; font-size:20px; line-height:20px; font-weight:300; color:#a79d85;
			background-color:rgba(0,0,0,0); border:0.5px solid #a79d85; transition:color 0.3s, background-color 0.3s;}
		.introduce_btn a:hover{background-color:rgba(145,133,104,1); color:white; font-weight:10;}
		
		/* 正文视频样式 */ 
		.video_title{text-align:center; padding:2rem 0 0;}
		.video_txt{width:500px; float:left; margin-top:-30px}
		.video_txt p{padding:0 50px; color:#555857;}
		.video_play{padding: 10px 50px; float:right; margin-top:-30px}
		
		/* 正文内容样式 */
		.content_title{text-align:center; padding:1rem 0 0;}
		.content_photo1{float:left;}
		.content_photo1 img{width:600px; padding:30px 0 0 10px}
		.content_txt{float:right; width:600px; padding:0 30px 0 0}
		.content_txt span{color:#a79d85;}
		.content_txt h3{margin:16px 0;}
		
		/* 页脚样式 */
		#footer_outer{background-color:rgba(100,100,100,0.5); color:white; padding:1rem 0 1rem;}
		#footer{padding:0 0; font-size:15px; text-align:center}
		#footer div {}
    </style>
</head>

<body>
	<%
		String name_or_login = (String)session.getAttribute("pname");
		Boolean f = true;
		if(name_or_login==null) {
			name_or_login="登录";
		}else{name_or_login="Hi,"+name_or_login;}
		
	%>
	<!-- 导航栏 --> 
	<div id="nav_outer">
        <div id="nav">
            <img src="img/logo.png">
            <div class="nav_menu">
            	<ul>
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
	
	
	<!-- 轮播图 -->
	<div id="slides_outer">
		<div id="slides">
			<img class="slide" src="img/bg20.jpg" style="opacity:1; z-index:3">
			<img class="slide" src="img/bg40.jpg" style="opacity:1; z-index:2">
			<img class="slide" src="img/bg50.jpg" style="opacity:1; z-index:1">
			<img class="slide" src="img/bg60.jpg" style="opacity:1; z-index:0">
		</div>
		<div id="lastSlideIcon" onclick="simClick(-1)"><img src="img/icon_left.png"></div>
		<div id="nextSlideIcon" onclick="simClick(1)"><img src="img/icon_right.png"></div>
		<ul id="slideBtn" type="disc">
			<li id="slideBtn0" style="color:red" onclick="switchSlide(0)">&nbsp;&nbsp;&nbsp;</li>
			<li id="slideBtn1" style="color:rgb(220,220,220)" onclick="switchSlide(1)">&nbsp;&nbsp;&nbsp;</li>
			<li id="slideBtn2" style="color:rgb(220,220,220)" onclick="switchSlide(2)">&nbsp;&nbsp;&nbsp;</li>
			<li id="slideBtn3" style="color:rgb(220,220,220)" onclick="switchSlide(3)">&nbsp;&nbsp;&nbsp;</li>
		</ul>
	</div>
    
	
	<!-- 正文 -->
    <div id="main_outer">
		<div id="main">
			<!-- 简介 -->
			<div id="introduce">
				<h1 class="introduce_title"><img src="img/introduce_title.png"></h1>
				<div class="introduce_txt">
					<p>
						苏州，古称吴，简称为苏，又称姑苏、平江等，是国家历史文化名城和风景旅游城市，国家高新技术产业基地，长江三角洲城市群重要的中心城市之一 。位于江苏省东南部，长江三角洲中部，是江苏长江经济带重要组成部分。东临上海，南接嘉兴，西抱太湖，北依长江。苏州属亚热带季风海洋性气候，四季分明，雨量充沛。种植水稻、小麦、油菜，出产棉花、蚕桑、林果，特产有碧螺春茶叶、长江刀鱼、太湖银鱼、阳澄湖大闸蟹等。苏州是中国首批24座国家历史文化名城之一，有近2500年历史，是吴文化的发祥地。苏州人多属江浙民系，使用吴语。苏州园林是中国私家园林的代表，被联合国教科文组织列为世界文化遗产。中国大运河苏州段入选世界遗产名录。
					</p>
					<p>
						截至2017年，苏州下辖5个市辖区、代管4个县级市，全市面积8488.42平方公里。地处东经119°55′～121°20′，北纬30°47′～32°02′之间。全市地势低平，平原占总面积的54.8%，海拔4米左右。丘陵占总面积的2.7%。
					</p>
					<p>
						商末，我国西北地区姬姓周氏族首领古公亶父之子泰伯、仲雍，避位让贤，从陕西歧山下的周原，千里南奔，来到长江下游南岸的梅里（今江苏梅村），与当地土著居民结合，建立了带有部落性质的“勾吴之国”。这是苏州一带称吴的最早记载。
					</p>
					<p>
						苏州素来以山水秀丽、园林典雅而闻名天下，有“江南园林甲天下，苏州园林甲江南”的美称，又因其小桥流水人家的水乡古城特色，有“东方水都”之称。
					</p>
				</div>
				<div class="introduce_btn">
					<a href="tuwen.jsp" target="_blank">走进苏州</a>
				</div>
			</div>
            
            
			<!-- 视频 -->
			<div id="video">
				<h1 class="video_title"><img src="img/video_title.png"></h1>
				<div class="video_txt">
					<p>
						苏州古城14.2平方公里。苏州古城和苏州园林为世界文化遗产和世界非物质文化遗产"双遗产"集一身，昆曲、阳澄湖大闸蟹、周庄是三张国际级品牌。苏州园林甲天下，为中国十大名胜古迹之一，九座园林被列入世界文化遗产名录；“吴中第一名胜”虎丘深厚的文化积淀，使其成为游客来苏州的必游之地。苏州现有2个国家历史文化名城（苏州、常熟）、12个中国历史文化名镇（如昆山周庄、吴江同里、吴江震泽、吴江黎里），保存较好的古镇（如吴江的黎里、盛泽、平望，太仓浏河等）、中国历史文化名村（吴中陆巷古村、明月湾），中国首批十大历史文化名街之二的平江路、山塘街。
					</p>
				</div>
				
				<div class="video_play">
					<video width="658" height="444" src="http://200004664.vod.myqcloud.com/200004664_626bfe289cb811e694a34983ad9d2cb1.f20.mp4" poster="img/video_poster.png"
						preload="none" controls="controls">
					</video>
				</div>
				<div class="clear"></div>
			</div>
			
			
			<!-- 相关内容 -->
			<div id="content">
				<h1 class="content_title"><img src="img/content_title.png"></h1>
				<div class="content_photo1"><img src="img/content_photo1.jpg"></div>
				<div class="content_txt">
					<span>“姑苏台上乌栖时，吴王宫里醉西施”</span>
					<h3>水城——苏州</h3>
					<div>
						<p>
							&nbsp; &nbsp; &nbsp; &nbsp; 苏州话以优雅著称，所谓吴侬软语就是由此而来。苏州话语调平和而不失抑扬，语速适中而不失顿挫，苏州话的发音有些低吟浅唱的感觉。
						</p>
						<p>
							&nbsp;  &nbsp; &nbsp; &nbsp; 苏州是东部饮食文化中心，是三大饮食文化之一（京式、苏式、广式）——苏式饮食文化的发扬地。苏州小吃是中国四大小吃之一（南京夫子庙小吃、上海城隍庙小吃、苏州玄妙观小吃和湖南长沙火宫殿小吃并称为中国四大小吃）
						</p> 
						<p>
							&nbsp;  &nbsp; &nbsp; &nbsp; 具有2500多年历史的苏州，无疑是吴地文化的主体。吴地绘画历史源远流长。从五六千年良渚文化的玉、物上刻画和描绘的装饰图案开始，到明代以吴门命名的“吴门画派”，无不散发着艺术的光辉
						</p>
					</div>
				</div>
				<div class="clear"></div>
			</div>
			
		</div>
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
			<div class="clear"></div>
        </div>
    </div>
</body>
</html>


<!-- 轮播图JS -->
<script type="text/javascript">
	//当前slide(全局变量)
	current_slide = 0;
	
	//flag为1时表示模拟点击下一个slide按钮，flag为-1时表示模拟点击上一个slide按钮 
	function simClick(flag) {
		current_slide = (4+current_slide+flag) % 4;
		
		var btn = document.getElementById("slideBtn"+current_slide);
    	btn.click();
	}
	
	//slide切换函数 
	function switchSlide(buttonId) {
		current_slide = buttonId;
		
		var slides = document.getElementsByClassName("slide");
		for(var i=0; i<4; i++) {
			var btn = document.getElementById("slideBtn"+i);
			
			if(i != buttonId) {
				slides[i].style.opacity = 0;
				btn.style.color = "rgb(220,220,220)";
			}
			else {
				slides[i].style.opacity = 1;
				btn.style.color = "red";
			}
		}
	}
	
	//每6s自动切换到下一张（即每6s模拟点击下一个slide按钮） 
	window.setInterval("simClick(1)", 6000);
</script>