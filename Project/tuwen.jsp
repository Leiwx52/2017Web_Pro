<!DOCTYPE HTML>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="css/font-awesome.css"/>

    <title>图文苏州</title>
    <style>
        body{background:rgb(250,240,230);}
        body{background:linear-gradient(to bottom, rgb(240,190,170) 0% ,rgb(250,240,230) 20%,rgb(250,240,230) 100%);}
        #header{background-color:rgba(185,185,185,0.6); position:fixed;right:0px;left:0px;top:0px;z-index:100}
        #header_inner{margin:10px 40px;	margin-right:50px;}
		.nav_menu{display: inline-block;}
		.nav_login{float:right; margin:20px 0px;}
		li{list-style-type:none; float:left; text-align:center; padding:6px 15px; vertical-align:center; }
		#header a{color:white; text-shadow:-2px -2px 5px grey; font-family:楷体; font-weight:bold; font-size:30px;
			transition-duration:0.5s;transition-property:all;text-decoration:none;}
		#header a:hover{color:brown;}
		#header .fa{color:white;font-size:23px;margin-right:5px}
        #inner {width:80%; margin: 0px auto;}
        #top>img{width:100%;}
        p{text-align: center; font-family:楷体; font-size:20px}
        #item{width:26%; border:1px rgb(220,220,220) solid; padding:10px; background: rgb(250,250,250); position:relative; float:left; margin: 25px; box-shadow: 3px 4px 12px rgb(100,100,100); height:280px}
        .item_pic{width:100%}
        #item_cover{position:absolute;top:0px;left:0px;background:rgba(50,50,50,0.8);width:100%;height:100%;color:white;opacity:0;transition-property:opacity; transition-duration:0.8s;}
        #item_cover:hover{opacity:1}
        #item_title{padding-top:20px;font-weight:bold;font-size:30px}
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
    <div id="top">
        <img src="img/tuwen.jpg">
    </div>
    <div id="inner">
        <p><img src="img/tuwensuzhou.PNG" style="width:50%"></p>
        <div id="item" align="center">
            <div style="border-radius:10px; overflow:hidden;height:160px;">
                <img src="img/tuwen1.jpg" class="item_pic">
            </div>
            <div id="item_content">
                <p id="item_title">小桥流水</p>
            </div>
            <div id="item_cover">
                <div style="padding-top:50px">
                    <p>桥是江南水乡停住的梦，桥文化从这里荡漾而来。那曼妙的姿态是妇人在轻舞，那奇巧的身姿是飞虹在涧边饮水，那斑斑锈迹是历史的沉淀。历久弥坚的而永存，柔情的坚强在鼎立。</p>
                </div>
            </div>
        </div>
        <div id="item" align="center">
            <div style="border-radius:10px; overflow:hidden;height:160px;">
                <img src="img/tuwen2.jpg" class="item_pic">
            </div>
            <div id="item_content">
                <p id="item_title">古巷</p>
            </div>
            <div id="item_cover">
                <div style="padding-top:40px">
                    <p>古巷里的诗意穿梭时空又梦幻般地存在，如梦如醉。那一个个青涩的幻影，曾经爱过，便被温存了下来。也许会遇到一个白发苍苍的老婆婆，对你微笑，唤你“小囡”，《桃花扇》《长生殿》的曲调在她心中回旋也在小巷中流连，没有都市的喧嚣，有的只是风中那浅浅的吟唱。</p>
                </div>
            </div>
        </div>
        <div id="item" align="center">
            <div style="border-radius:10px; overflow:hidden;height:160px;">
                <img src="img/tuwen3.jpg" class="item_pic">
            </div>
            <div id="item_content">
                <p id="item_title">拙政园</p>
            </div>
            <div id="item_cover">
                <div style="padding-top:40px">
                    <p>拙政园位于苏州城东北隅，全园以水为中心，山水萦绕，厅榭精美，花木繁茂，具有浓郁的江南水乡特色。花园分为东、中、西三部分，东花园开阔疏朗，中花园是全园精华所在，西花园建筑精美，各具特色。园南为住宅区，体现典型江南地区传统民居多进的格局。</p>
                </div>
            </div>
        </div>
        <div id="item" align="center">
            <div style="border-radius:10px; overflow:hidden;height:160px;">
                <img src="img/tuwen4.jpg" class="item_pic">
            </div>
            <div id="item_content">
                <p id="item_title">锦溪古镇</p>
            </div>
            <div id="item_cover">
                <div style="padding-top:50px">
                    <p>锦溪古镇是一个拥有两千多年历史的江南水乡古镇，素有“中国民间博物馆之乡”的美誉，留存诸多人文景观、古迹名胜和无数独具明、清特色的建筑。著名的景点有通神御院，陈妃水冢，莲池禅院等。</p>
                </div>
            </div>
        </div>
        <div id="item" align="center">
            <div style="border-radius:10px; overflow:hidden;height:160px;">
                <img src="img/tuwen5.jpg" class="item_pic">
            </div>
            <div id="item_content">
                <p id="item_title">同里古镇</p>
            </div>
            <div id="item_cover">
                <div style="padding-top:10px">
                    <p>镇上最富有神话色彩的古桥是富观桥。在此桥的龙门石上，有一幅惟妙惟肖的"桃花浪里鱼化石"的石雕。传说这条鲤鱼在三月桃花水发的时候，乘风破浪奋力跳跃，想跳过龙门脱去凡胎而进入仙界，可就在它奋力跃出水面的时候，桥上走来一为如花似玉的姑娘，鲤鱼凡心一动，结果已跳过龙门的头部变成了龙头，而龙门外的半身仍旧保留了鱼身。</p>
                </div>
            </div>
        </div>
        <div id="item" align="center">
            <div style="border-radius:10px; overflow:hidden;height:160px;">
                <img src="img/tuwen6.jpg" class="item_pic">
            </div>
            <div id="item_content">
                <p id="item_title">虎丘</p>
            </div>
            <div id="item_cover">
                <div style="padding-top:50px">
                    <p>虎丘，原名海涌山，据《史记》载吴王阖闾葬于此，传说葬后三日有“白虎蹲其上”，故名。虎丘占地虽仅三百余亩，山高仅三十多米，但却有“江左丘壑之表”的风范，绝岩耸壑，气象万千，并有三绝九宜十八景之胜。</p>
                </div>
            </div>
        </div>
        <div id="item" align="center">
            <div style="border-radius:10px; overflow:hidden;height:160px;">
                <img src="img/tuwen7.jpg" class="item_pic">
            </div>
            <div id="item_content">
                <p id="item_title">寒山寺</p>
            </div>
            <div id="item_cover">
                <div style="padding-top:50px">
                    <p>“姑苏城外寒山寺，夜半钟声到客船。”，始于佛教盛行之梁天监年间，唐贞观中寒山曾至此而得名。梵宇历劫，屡毁屡建，佛子之心可鉴；千五百年，几经沧桑，沿革当理分明。</p>
                </div>
            </div>
        </div>
        <div id="item" align="center">
            <div style="border-radius:10px; overflow:hidden;height:160px;">
                <img src="img/tuwen8.jpg" class="item_pic">
            </div>
            <div id="item_content">
                <p id="item_title">狮子林</p>
            </div>
            <div id="item_cover">
                <div style="padding-top:50px">
                    <p>林园几经兴衰变化，寺、园、宅分而又合，传统造园手法与佛教思想相互融合，以及近代贝氏家族把西洋造园手法和家祠引入园中，使其成为融禅宗之理、园林之乐于一体的寺庙园林。</p>
                </div>
            </div>
        </div>
        <div id="item" align="center">
            <div style="border-radius:10px; overflow:hidden;height:160px;">
                <img src="img/tuwen9.jpg" class="item_pic">
            </div>
            <div id="item_content">
                <p id="item_title">沧浪亭</p>
            </div>
            <div id="item_cover">
                <div style="padding-top:50px">
                    <p>沧浪亭位于苏州城南三元坊，是现存历史最为悠久的江南园林。与狮子林、拙政园、留园并称为苏州宋、元、明、清四大园林，代表着宋朝的艺术风格。沧浪亭占地面积1.08公顷，园内有一泓清水贯穿，波光倒影，景象万千。</p>
                </div>
            </div>
        </div>
        <div id="item" align="center">
            <div style="border-radius:10px; overflow:hidden;height:160px;">
                <img src="img/tuwen10.jpg" class="item_pic">
            </div>
            <div id="item_content">
                <p id="item_title">盘门</p>
            </div>
            <div id="item_cover">
                <div style="padding-top:10px">
                    <p>盘门座落于苏州古城区西南隅的盘门景区，拥有久负盛名的瑞光古塔、绝无仅有的水陆城门、享誉海内外的吴门古桥，盘门具有传统古典园林“一池三山”格局的中央庭院及古建精品、水乡风情、山池亭榭、湖光山影为一体，显得雄健、舒张、大气，使盘门景区既不失苏州古朴沧桑的历史感，又具豪放、明快的现代气息。</p>
                </div>
            </div>
        </div>
        <div id="item" align="center">
            <div style="border-radius:10px; overflow:hidden;height:160px;">
                <img src="img/tuwen11.jpg" class="item_pic">
            </div>
            <div id="item_content">
                <p id="item_title">金鸡湖</p>
            </div>
            <div id="item_cover">
                <div style="padding-top:50px">
                    <p>金鸡湖整个景观分为八个区，依次为“湖滨大道”、“城市广场”、“水巷邻里”、“望湖角”、“金姬墩”、“文化水廊”、“玲珑湾”、“波心岛”。传说中一起在金鸡湖边走过的恋人，可以相伴走过一辈子。</p>
                </div>
            </div>
        </div>
        <div id="item" align="center">
            <div style="border-radius:10px; overflow:hidden;height:160px;">
                <img src="img/tuwen12.jpg" class="item_pic">
            </div>
            <div id="item_content">
                <p id="item_title">七里山塘</p>
            </div>
            <div id="item_cover">
                <div style="padding-top:0px">
                    <p>自古山塘街有“姑苏第一名街”之称。清乾隆帝游江南，到七里山塘曾御笔书写“山塘寻胜”；虽然往日的繁华难以复制，但几座弯月般的石桥，和两岸各一片白墙灰瓦的古宅仍保留完好。河边的宅院都依次挂出红灯笼，红色的灯火同拱桥的身影一起映照在河水里，轻轻地荡漾着，让你不由得一声轻叹：这就是苏州。</p>
                </div>
            </div>
        </div>
        <div id="item" align="center">
            <div style="border-radius:10px; overflow:hidden;height:160px;">
                <img src="img/tuwen13.jpg" class="item_pic">
            </div>
            <div id="item_content">
                <p id="item_title">平江路</p>
            </div>
            <div id="item_cover">
                <div style="padding-top:20px">
                    <p>平江路是苏州的一条历史老街，是一条沿河的小路，其河名为平江河。平江路历史街区是苏州古城迄今为止保存最为完整的一个区域，堪称古城缩影。对照南宋《平江图》及明末《苏州府城内水道总图》，平江路基本延续了唐宋以来的城坊格局，并至今保持着活力。</p>
                </div>
            </div>
        </div>
        <div id="item" align="center">
            <div style="border-radius:10px; overflow:hidden;height:160px;">
                <img src="img/tuwen14.jpg" class="item_pic">
            </div>
            <div id="item_content">
                <p id="item_title">木渎古镇</p>
            </div>
            <div id="item_cover">
                <div style="padding-top:0px">
                    <p>木渎古镇位于苏州西郊灵岩山麓，依山而筑，傍水而居，其独特的格局为江南诸多古镇少有。木渎更是江南唯一的园林古镇。明清时有私家园林30多处，现已修复严家花园，虹饮山房、古松园、榜眼府第，盘隐草堂等，其深厚的文化蕴积，幽雅的园林环境，脍炙人口的历史传说，为现代都市人提供了一个放松身心、陶冶情操的旅游休闲的好去处。</p>
                </div>
            </div>
        </div>
        <div id="item" align="center">
            <div style="border-radius:10px; overflow:hidden;height:160px;">
                <img src="img/tuwen15.jpg" class="item_pic">
            </div>
            <div id="item_content">
                <p id="item_title">古运河</p>
            </div>
            <div id="item_cover">
                <div style="padding-top:50px">
                    <p>古城苏州，因京杭运河而成为万商云集的天堂。古运河沿途有苏州古城墙遗址、盘门、古胥门、觅渡桥等美丽景点相伴。运河两岸一边建有高楼大厦，一边是典型仿古建筑，古今相映，景致和谐，让人感受到了不同时代的苏州城韵味。</p>
                </div>
            </div>
        </div>
    </div>
    <div style="clear:both"></div> 

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
