<%@ page language="java"  contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,java.sql.*,java.io.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Home page</title>
<link rel="stylesheet" type="text/css" href="css/style.css"/>
<% Connection con; Statement stmt; ResultSet rs;%>
<script LANGUAGE="JavaScript">
function newest_video()
{
x=document.getElementById("nw_str1");
x.innerHTML="TI5 Day 6 Recap";
x.href="https://www.youtube.com/watch?v=qxXu8oiBrno";
x=document.getElementById("nw_pic1");
x.src="images/lp_newvid1.jpg";

x=document.getElementById("nw_str2");
x.innerHTML="TI5 Day 5 Recap";
x.href="https://www.youtube.com/watch?v=ixWg_FsFOzI";
x=document.getElementById("nw_pic2");
x.src="images/lp_newvid2.jpg";

x=document.getElementById("nw_str3");
x.innerHTML="TI5 Road to the Finals:Evil Geniuses";
x.href="https://www.youtube.com/watch?v=VaibusDtFMc";
x=document.getElementById("nw_pic3");
x.src="images/lp_newvid3.jpg";

x=document.getElementById("nw_str4");
x.innerHTML="TI5 Road to the Finals:CDEC";
x.href="https://www.youtube.com/watch?v=ycYM9hVfcOE";
x=document.getElementById("nw_pic4");
x.src="images/lp_newvid4.jpg";
}


function newest_new()
{
x=document.getElementById("nw_str1");
x.innerHTML="Faceless finish the first day of Kiev Major SEA qualifiers without dropping a single game";
x.href="http://www.gosugamers.net/dota2/news/43603-faceless-finish-the-first-day-of-kiev-major-sea-qualifiers-without-dropping-a-single-game";
x=document.getElementById("nw_pic1");
x.src=("images/lp_newnews1.jpg");

x=document.getElementById("nw_str2");
x.innerHTML="NA and SA Kiev Major open qualifiers ended, QO and Jeyo to play in regionals";
x.href="http://www.gosugamers.net/dota2/news/43597-na-and-sa-kiev-major-open-qualifiers-ended-qo-and-jeyo-to-play-in-regionals";
x=document.getElementById("nw_pic2");
x.src="images/lp_newnews2.jpg";

x=document.getElementById("nw_str3");
x.innerHTML="SingSing's pub stack 4beanboys made into the Kiev Major EU Regionals";
x.href="http://www.gosugamers.net/dota2/news/43595-singsing-s-pub-stack-4beanboys-made-into-the-kiev-major-eu-regionals";
x=document.getElementById("nw_pic3");
x.src="images/lp_newnews3.jpg";

x=document.getElementById("nw_str4");
x.innerHTML="Iceberg's brother and his team H1ve advance into the Kiev Major CIS regional qualifiers";
x.href="http://www.gosugamers.net/dota2/news/43592-iceberg-s-brother-and-his-team-h1ve-advance-into-the-kiev-major-cis-regional-qualifiers";
x=document.getElementById("nw_pic4");
x.src="images/lp_newnews4.jpg";
}

function heroclick(name)
{
	
	xmlhttp = new XMLHttpRequest();
	xmlhttp.open("GET","http://localhost:8080/interface/Herodata?name="+name,true);
	xmlhttp.send(null);
	xmlhttp.onreadystatechange = function()
	{
		if(xmlhttp.readyState==4 && xmlhttp.status==200){
			document.getElementById("main_block").innerHTML = xmlhttp.responseText;
		}
	}
}
</script>


</head>
<body>
  <div id="main_block">
  	 <div id="innerblock">
                  
								
					 <!--Top Panel starts here -->
   
			<div id="top_panel">
			
				
					<a href="index.jsp" class="logo"><img src="images/logo.png" width="128" height="36" alt="" /></a><br />
				
				<div class="tp_navbg">
					<a href="index.jsp">Home</a>
					<a href="hero.jsp">Heroes</a>
					<a href="item.jsp">Items</a>
				</div>
				
				<div class="tp_smlgrnbg">
					<span class="tp_sign"><a href="#" class="tp_txt">Sign Up</a>
					<span class="tp_divi">|</span>
					<a href="#" class="tp_txt">Login</a>
					<span class="tp_divi">|</span>
					<a href="#" class="tp_txt">Help</a></span>
				</div>
				
				<div class="tp_barbg">
					<input name="#" type="text" class="tp_barip" />
					<select name="#" class="tp_drp"><option>PlayerID</option></select>
					<a href="#" class="tp_search"><img src="images/tp_search.jpg" width="52" height="24" alt="" /></a>
					<span class="tp_welcum" >Welcome to <br><b>Dota Query</b></br></span>
				
				</div>
				
			</div>
	  
	                   <!--Top Panel ends here -->
					   
					   
					    <!--content Panel starts here -->
						
			<div id="contentpanel">
			
				<div id="lp_padd">
				
					

                    <div>
					<span id= "home" class="lp_newvidit2">HeroData</span>
					<br /><br /><br /><br /><br />
					</div>
					
			<%
				System.out.println("test running");
			    List Li = new ArrayList();
				Iterator lr;
				if (request.getAttribute("heroList") != null
						&& request.getAttribute("heroList") != "") {
					List userList = (ArrayList) request.getAttribute("heroList");
					Iterator itr = userList.iterator();
					while (itr.hasNext()) {
						Li = (ArrayList) itr.next();
						lr = Li.iterator();
						Integer id = (Integer) lr.next();
						String name = (String) lr.next();
						String temptype = (String) lr.next();
						String type;
						if (temptype.equals("S")) type = "strength";
						else if (temptype.equals("I")) type = "intelligence";
						else type = "agility";
						Integer total_win = (Integer) lr.next();
						Integer total_match = (Integer) lr.next();
						Integer push = (Integer) lr.next();
						Integer survive = (Integer) lr.next();
						Integer farm = (Integer) lr.next();
						Integer kda = (Integer) lr.next();
						Integer damage = (Integer) lr.next();
						
			%> 
					
					<img src = 'hero/<%=type %>/<%=name %>.png' width = '600' height = '200' alt = '' class = 'Strength_icon'/ >
					
					<div>
					<span class="lp_newvidit">Hero ID:</span>
					<br />
					<span class="cp_featview"><%=id%><br /></span>
					<br /><br />
					</div>
				
					
					<br /><br />
					<div>
					<span class="lp_newvidit">Name:</span>
					<br />
					<span class="cp_featview"><%=name%><br /></span>
					<br /><br />
					</div>
					
					<br /><br />
					<div>
					<span class="lp_newvidit">Type:</span>
					<br />
					<span class="cp_featview"><%=type%><br /></span>
					<br /><br />
					</div>
					
					<br /><br />
					<div>
					<span class="lp_newvidit">Total Win:</span>
					<br />
					<span class="cp_featview"><%=total_win%><br /></span>
					<br /><br />
					</div>
					<br /><br />
					<div>
					<span class="lp_newvidit">Total Match:</span>
					<br />
					<span class="cp_featview"><%=total_match%><br /></span>
					<br /><br />
					</div>
					<br /><br />
					<div>
					<span class="lp_newvidit">Push:</span>
					<br />
					<span class="cp_featview"><%=push%><br /></span>
					<br /><br />
					</div>
					<br /><br />
					<div>
					<span class="lp_newvidit">Survive:</span>
					<br />
					<span class="cp_featview"><%=survive%><br /></span>
					<br /><br />
					</div>
					<br /><br />
					<div>
					<span class="lp_newvidit">Farm:</span>
					<br />
					<span class="cp_featview"><%=farm%><br /></span>
					<br /><br />
					</div>
					<br /><br />
					<div>
					<span class="lp_newvidit">KDA:</span>
					<br />
					<span class="cp_featview"><%=kda%><br /></span>
					<br /><br />
					</div>
					<br /><br />
					<div>
					<span class="lp_newvidit">Damage:</span>
					<br />
					<span class="cp_featview"><%=damage%><br /></span>
					<br /><br />
					</div>
					
				<%
				}
				}
			%>
				</div>
				
				
				
				
					&nsbp;
					<br /><br /><br/><br/><br/><br/><br/><br/>
				
				<div id="rp_padd">
				
						<img src="images/rp_top.jpg" width="282" height="10" alt="" style="float:left;" />
					<div class="rp_loginpad">
						<span class="rp_titxt">MEMBERS LOGIN</span>
						
						<span class="rp_membrusr">User name:</span>
						<input name="#" type="text" class="rp_usrip" />
							
						<span class="rp_membrpwd">Password:</span>
						<input name="#" type="password" class="rp_pwdrip" />
						<a href="#" class="rp_login"><img src="images/rp_login.jpg" width="39" height="17" alt="" /></a>
									
						<span class="rp_notmem"><a href="#" style="font:11px Arial, Helvetica, sans-serif; color:#FFFFFF;">Forgot your password</a></span>
					
					
					</div>
					
					
					
					
					<img src="images/rp_top.jpg" width="282" height="10" alt="" class="rp_upbgtop"  />
					<div class="rp_loginpad" style="padding-bottom:0px; border-bottom:none;">
						<span class="rp_titxt">VIDEO RANK</span>
					</div>
					
					<span style="float:left;"><img src="images/rp_catarro.jpg" width="5" height="5" alt="" class="rp_catarro" />
					<a href="http://www.gosugamers.net/dota2/news/43595-singsing-s-pub-stack-4beanboys-made-into-the-kiev-major-eu-regionals" class="rp_catxt">fc</a>
					<img src="images/rp_catline.jpg" width="262" height="1" alt="" class="rp_catline" /></span>
					
					<span style="float:left;"><img src="images/rp_catarro.jpg" width="5" height="5" alt="" class="rp_catarro" />
					<a href="#" class="rp_catxt">Advertising</a>
					<img src="images/rp_catline.jpg" width="262" height="1" alt="" class="rp_catline" /></span>
					
					<span style="float:left;"><img src="images/rp_catarro.jpg" width="5" height="5" alt="" class="rp_catarro" />
					<a href="#" class="rp_catxt">Sports</a>
					<img src="images/rp_catline.jpg" width="262" height="1" alt="" class="rp_catline" /></span>
					
					<span style="float:left;"><img src="images/rp_catarro.jpg" width="5" height="5" alt="" class="rp_catarro" />
					<a href="#" class="rp_catxt">Kids</a>
					<img src="images/rp_catline.jpg" width="262" height="1" alt="" class="rp_catline" /></span>
					
					<span style="float:left;"><img src="images/rp_catarro.jpg" width="5" height="5" alt="" class="rp_catarro" />
					<a href="#" class="rp_catxt">Scary Clips</a>
					<img src="images/rp_catline.jpg" width="262" height="1" alt="" class="rp_catline" /></span>
					
					<span style="float:left;"><img src="images/rp_catarro.jpg" width="5" height="5" alt="" class="rp_catarro" />
					<a href="#" class="rp_catxt">News</a>
					<img src="images/rp_catline.jpg" width="262" height="1" alt="" class="rp_catline" /></span>
					
					<span style="float:left;"><img src="images/rp_catarro.jpg" width="5" height="5" alt="" class="rp_catarro" />
					<a href="#" class="rp_catxt">Motorcycles</a>
					<img src="images/rp_catline.jpg" width="262" height="1" alt="" class="rp_catline" /></span>
					
					<span style="float:left;"><img src="images/rp_catarro.jpg" width="5" height="5" alt="" class="rp_catarro" />
					<a href="#" class="rp_catxt">Planes</a>
					<img src="images/rp_catline.jpg" width="262" height="1" alt="" class="rp_catline" /></span>
					
					<span style="float:left;"><img src="images/rp_catarro.jpg" width="5" height="5" alt="" class="rp_catarro" />
					<a href="#" class="rp_catxt">Birds</a>
					<img src="images/rp_catline.jpg" width="262" height="1" alt="" class="rp_catline" /></span>
					
					<span style="float:left;"><img src="images/rp_catarro.jpg" width="5" height="5" alt="" class="rp_catarro" />
					<a href="#" class="rp_catxt">Beautiful Women</a>
					<img src="images/rp_catline.jpg" width="262" height="1" alt="" class="rp_catline" /></span>
					
					<span style="float:left;"><img src="images/rp_catarro.jpg" width="5" height="5" alt="" class="rp_catarro" />
					<a href="#" class="rp_catxt">Pretty Women</a>
					<img src="images/rp_catline.jpg" width="262" height="1" alt="" class="rp_catline" /></span>
					
					<span style="float:left;"><img src="images/rp_catarro.jpg" width="5" height="5" alt="" class="rp_catarro" />
					<a href="#" class="rp_catxt">Cool TV</a>
					<img src="images/rp_catline.jpg" width="262" height="1" alt="" class="rp_catline" /></span>
					
					<span style="float:left;"><img src="images/rp_catarro.jpg" width="5" height="5" alt="" class="rp_catarro" />
					<a href="#" class="rp_catxt">Testing Channel</a>
					<img src="images/rp_catline.jpg" width="262" height="1" alt="" class="rp_catline" /></span>
					
					
					
					<img src="images/rp_top.jpg" width="282" height="10" alt="" class="rp_upbgtop"  />
					<div class="rp_loginpad" style="padding-bottom:0px; border-bottom:none;">
						<span class="rp_titxt">NEWS RANK</span>
					</div>
					
					<span style="float:left;"><img src="images/rp_catarro.jpg" width="5" height="5" alt="" class="rp_catarro" />
					<a href="#" class="rp_catxt">Funny Clips</a>
					<img src="images/rp_catline.jpg" width="262" height="1" alt="" class="rp_catline" /></span>
					
					<span style="float:left;"><img src="images/rp_catarro.jpg" width="5" height="5" alt="" class="rp_catarro" />
					<a href="#" class="rp_catxt">Advertising</a>
					<img src="images/rp_catline.jpg" width="262" height="1" alt="" class="rp_catline" /></span>
					
					<span style="float:left;"><img src="images/rp_catarro.jpg" width="5" height="5" alt="" class="rp_catarro" />
					<a href="#" class="rp_catxt">Sports</a>
					<img src="images/rp_catline.jpg" width="262" height="1" alt="" class="rp_catline" /></span>
					
					<span style="float:left;"><img src="images/rp_catarro.jpg" width="5" height="5" alt="" class="rp_catarro" />
					<a href="#" class="rp_catxt">Kids</a>
					<img src="images/rp_catline.jpg" width="262" height="1" alt="" class="rp_catline" /></span>
					
					<span style="float:left;"><img src="images/rp_catarro.jpg" width="5" height="5" alt="" class="rp_catarro" />
					<a href="#" class="rp_catxt">Scary Clips</a>
					<img src="images/rp_catline.jpg" width="262" height="1" alt="" class="rp_catline" /></span>
					
					<span style="float:left;"><img src="images/rp_catarro.jpg" width="5" height="5" alt="" class="rp_catarro" />
					<a href="#" class="rp_catxt">News</a>
					<img src="images/rp_catline.jpg" width="262" height="1" alt="" class="rp_catline" /></span>
					
					<span style="float:left;"><img src="images/rp_catarro.jpg" width="5" height="5" alt="" class="rp_catarro" />
					<a href="#" class="rp_catxt">Motorcycles</a>
					<img src="images/rp_catline.jpg" width="262" height="1" alt="" class="rp_catline" /></span>
					
					<span style="float:left;"><img src="images/rp_catarro.jpg" width="5" height="5" alt="" class="rp_catarro" />
					<a href="#" class="rp_catxt">Planes</a>
					<img src="images/rp_catline.jpg" width="262" height="1" alt="" class="rp_catline" /></span>
					
					<span style="float:left;"><img src="images/rp_catarro.jpg" width="5" height="5" alt="" class="rp_catarro" />
					<a href="#" class="rp_catxt">Birds</a>
					<img src="images/rp_catline.jpg" width="262" height="1" alt="" class="rp_catline" /></span>
					
					<span style="float:left;"><img src="images/rp_catarro.jpg" width="5" height="5" alt="" class="rp_catarro" />
					<a href="#" class="rp_catxt">Beautiful Women</a>
					<img src="images/rp_catline.jpg" width="262" height="1" alt="" class="rp_catline" /></span>
					
					<span style="float:left;"><img src="images/rp_catarro.jpg" width="5" height="5" alt="" class="rp_catarro" />
					<a href="#" class="rp_catxt">Pretty Women</a>
					<img src="images/rp_catline.jpg" width="262" height="1" alt="" class="rp_catline" /></span>
					
					<span style="float:left;"><img src="images/rp_catarro.jpg" width="5" height="5" alt="" class="rp_catarro" />
					<a href="#" class="rp_catxt">Cool TV</a>
					<img src="images/rp_catline.jpg" width="262" height="1" alt="" class="rp_catline" /></span>
					
					<span style="float:left;"><img src="images/rp_catarro.jpg" width="5" height="5" alt="" class="rp_catarro" />
					<a href="#" class="rp_catxt">Testing Channel</a>
					<img src="images/rp_catline.jpg" width="262" height="1" alt="" class="rp_catline" /></span>
					
					
					
					
					
					
					
				
				
					
				
				
				</div>
				
			</div>	
		 	 		 
					<!--content Panel ends here -->
					
					 <!--footer panel starts here -->
		
		   	
	<div id="ft_padd">
			
			
			
			
				<span class="ft_cpy">&copy;copyrights @ cop5725 DBMS All Rights Reserved.<br /><font color="#F88F05">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Powered by </font>University of Florida</span>
			
			
			</div>	<br />   
 	 
	                     <!--footer panel ends here -->
    </div> 
	 
	      <!--innerblock ends here -->
	 
</div>
	
	      <!--mainblock ends here -->
			
</body>
</html>
