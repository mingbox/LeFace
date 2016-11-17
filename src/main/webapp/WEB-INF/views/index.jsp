<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html lang="en">
<head>
	<title>Strata by HTML5 UP</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<link rel="stylesheet" href="<c:url value='/css/main.css' />" />
	<style type="text/css">
		form > input { margin-right: 15px; }
		#my_camera { margin:auto; }
		#results { margin:20px auto; padding:10px; border:1px solid; background:#ccc; width: 300px;}
		#middle { margin:20px auto; width: 30%;}
	</style>
</head>
<body id="top">
	<!-- Header -->
		<header id="header">
			<div class="inner">
				<a href="#" class="image avatar"><img src="<c:url value='/images/LeEco.png' />" alt="" /></a>
				<h1><strong>LeEco</strong> face recognition<br />
				by open eco San Jose Team.</h1>
			</div>
		</header>

	<!-- Main -->
		<div id="main">

			<!-- One -->
				<section id="one">
					<header class="major">
						<h2>LeEco TV face recognition interface</h2>
					</header>
					<div id="my_camera"></div>
					<!-- <div id="results">Recognition result will appear here...</div> -->
					<div id="middle"><input style="width:100%;" type="button" value="Start Recognition" onClick="startLoop()" /></div>
					<!-- <p>Accumsan orci faucibus id eu lorem semper. Eu ac iaculis ac nunc nisi lorem vulputate lorem neque cubilia ac in adipiscing in curae lobortis tortor primis integer massa adipiscing id nisi accumsan pellentesque commodo blandit enim arcu non at amet id arcu magna. Accumsan orci faucibus id eu lorem semper nunc nisi lorem vulputate lorem neque cubilia.</p> -->
						
				</section>

				<section id="three">
					<h2>Set up your profile</h2>
					<p>Please enter your information and click Start button to begin recording your image.</p>
					<div class="row">
						<div class="8u 12u$(small)">
							<form name="adduserform" id="adduserform" action="<c:url value="/detect" />" method="post">
								<div class="row uniform 50%">
									<input type="hidden" name="img" id="img" value="" />
									<div class="12u$"><input type="text" name="name" id="name" placeholder="Name" /></div>
									<div class="12u$"><input type="email" name="email" id="email" placeholder="Email" /></div>
									<!-- <div class="12u$"><textarea name="message" id="message" placeholder="Message" rows="2"></textarea></div> -->
								</div>
								<br/>
								<ul class="actions">
									<li><input type=button value="Start" onClick="adduser()"/></li>
								</ul>
							</form>		
						</div>
						<div class="4u$ 12u$(small)">
							<ul class="labeled-icons">
								<li>
									<h3 class="icon fa-home"><span class="label">Address</span></h3>
									3553 North 1st Street<br />
									San Jose, CA 95134<br />
									United States
								</li>
								<li>
									<h3 class="icon fa-envelope-o"><span class="label">Email</span></h3>
									<a href="#">mingbo.xu@le.com</a>
								</li>
							</ul>
						</div>
					</div>
				</section>
		</div>

	<!-- Footer -->
		<footer id="footer">
			<div class="inner">
				<ul class="icons">
					<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
					<li><a href="#" class="icon fa-github"><span class="label">Github</span></a></li>
					<li><a href="#" class="icon fa-dribbble"><span class="label">Dribbble</span></a></li>
					<li><a href="#" class="icon fa-envelope-o"><span class="label">Email</span></a></li>
				</ul>
				<ul class="copyright">
					<li>&copy; LeEco</li>
				</ul>
			</div>
		</footer>

	<!-- Scripts -->
		<script src="<c:url value='/js/jquery.min.js' />"></script>
		<script src="<c:url value='/js/jquery.poptrox.min.js' />"></script>
		<script src="<c:url value='/js/skel.min.js' />"></script>
		<script src="<c:url value='/js/util.js' />"></script>
		<script src="<c:url value='/js/main.js' />"></script>
		
		<!-- First, include the Webcam.js JavaScript Library -->
		<script type="text/javascript" src="<c:url value='/js/webcam.js' />"></script>
		
		<!-- Configure a few settings and attach camera -->
		<script language="JavaScript">
			Webcam.set({
				// live preview size
				width: 320,
				height: 240,
				
				// device capture size
				dest_width: 640,
				dest_height: 480,
				
				// final cropped size
				crop_width: 480,
				crop_height: 480,
				
				// format and quality
				image_format: 'jpeg',
				jpeg_quality: 90
			});
			
			Webcam.attach( '#my_camera' );
		</script>
		<!-- Code to handle taking the snapshot and displaying it locally -->
		<script language="JavaScript">
			function take_snapshot() {
				// take snapshot and get image data
				Webcam.snap( function(data_uri) {
					var formData = {};    
					formData['img'] = data_uri;
					$.post('<c:url value="/identify" />', formData).done(function (data) {
				        alert("Hello, "+data);
				    });
					// display results in page
					/* document.getElementById('results').innerHTML = 
						'<h2>Here is your large image:</h2>' + 
						'<img src="'+data_uri+'"/>'; */
				} );
			}
			function adduser() {
				for (i = 0; i < 5; i++) { 
					Webcam.snap( function(data_uri) {
						$('#img').val($('#img').val()+data_uri+"|");
						//alert($('#img').val());
						setTimeout(function(){}, 250);
					} );
				}
				$('#adduserform').submit();
			}
			function startLoop() {
				window.setInterval(function(){take_snapshot();}, 5000);	
			}
		</script>
</body>
</html>
