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
		#results { float:right; margin:20px; padding:20px; border:1px solid; background:#ccc; }
	</style>
</head>
<body id="top">
	<!-- Header -->
		<header id="header">
			<div class="inner">
				<a href="#" class="image avatar"><img src="<c:url value='/images/avatar.jpg' />" alt="" /></a>
				<h1><strong>I am Strata</strong>, a super simple<br />
				responsive site template freebie<br />
				crafted by <a href="http://html5up.net">HTML5 UP</a>.</h1>
			</div>
		</header>

	<!-- Main -->
		<div id="main">

			<!-- One -->
				<section id="one">
					<header class="major">
						<h2>Ipsum lorem dolor aliquam ante commodo<br />
						magna sed accumsan arcu neque.</h2>
					</header>
					<p>Accumsan orci faucibus id eu lorem semper. Eu ac iaculis ac nunc nisi lorem vulputate lorem neque cubilia ac in adipiscing in curae lobortis tortor primis integer massa adipiscing id nisi accumsan pellentesque commodo blandit enim arcu non at amet id arcu magna. Accumsan orci faucibus id eu lorem semper nunc nisi lorem vulputate lorem neque cubilia.</p>
					<ul class="actions">
						<li><a href="#" class="button">Learn More</a></li>
					</ul>
				</section>

			<!-- Two -->
				<section id="two">
					<h2>Recent Work</h2>
					<div class="row">
						<article class="6u 12u$(xsmall) work-item">
							<a href="#" class="image fit thumb"><img src="<c:url value='/images/thumbs/01.jpg' />" alt="" /></a>
							<h3>Magna sed consequat tempus</h3>
							<p>Lorem ipsum dolor sit amet nisl sed nullam feugiat.</p>
						</article>
						<article class="6u$ 12u$(xsmall) work-item">
							<a href="#" class="image fit thumb"><img src="<c:url value='/images/thumbs/02.jpg' />" alt="" /></a>
							<h3>Ultricies lacinia interdum</h3>
							<p>Lorem ipsum dolor sit amet nisl sed nullam feugiat.</p>
						</article>
						<article class="6u 12u$(xsmall) work-item">
							<a href="#" class="image fit thumb"><img src="<c:url value='/images/thumbs/03.jpg' />" alt="" /></a>
							<h3>Tortor metus commodo</h3>
							<p>Lorem ipsum dolor sit amet nisl sed nullam feugiat.</p>
						</article>
						<article class="6u$ 12u$(xsmall) work-item">
							<a href="#" class="image fit thumb"><img src="<c:url value='/images/thumbs/04.jpg' />" alt="" /></a>
							<h3>Quam neque phasellus</h3>
							<p>Lorem ipsum dolor sit amet nisl sed nullam feugiat.</p>
						</article>
						<article class="6u 12u$(xsmall) work-item">
							<a href="#" class="image fit thumb"><img src="<c:url value='/images/thumbs/05.jpg' />" alt="" /></a>
							<h3>Nunc enim commodo aliquet</h3>
							<p>Lorem ipsum dolor sit amet nisl sed nullam feugiat.</p>
						</article>
						<article class="6u$ 12u$(xsmall) work-item">
							<a href="#" class="image fit thumb"><img src="<c:url value='/images/thumbs/06.jpg' />" alt="" /></a>
							<h3>Risus ornare lacinia</h3>
							<p>Lorem ipsum dolor sit amet nisl sed nullam feugiat.</p>
						</article>
					</div>
					<ul class="actions">
						<li><a href="#" class="button">Full Portfolio</a></li>
					</ul>
				</section>

			<!-- Three -->
				<section id="three">
					<h2>Get In Touch</h2>
					<p>Accumsan pellentesque commodo blandit enim arcu non at amet id arcu magna. Accumsan orci faucibus id eu lorem semper nunc nisi lorem vulputate lorem neque lorem ipsum dolor.</p>
					<div class="row">
						<div class="8u 12u$(small)">
							<form method="post" action="#">
								<div class="row uniform 50%">
									<div class="6u 12u$(xsmall)"><input type="text" name="name" id="name" placeholder="Name" /></div>
									<div class="6u$ 12u$(xsmall)"><input type="email" name="email" id="email" placeholder="Email" /></div>
									<div class="12u$"><textarea name="message" id="message" placeholder="Message" rows="4"></textarea></div>
								</div>
							</form>
							<ul class="actions">
								<li><input type="submit" value="Send Message" /></li>
							</ul>
						</div>
						<div class="4u$ 12u$(small)">
							<ul class="labeled-icons">
								<li>
									<h3 class="icon fa-home"><span class="label">Address</span></h3>
									1234 Somewhere Rd.<br />
									Nashville, TN 00000<br />
									United States
								</li>
								<li>
									<h3 class="icon fa-mobile"><span class="label">Phone</span></h3>
									000-000-0000
								</li>
								<li>
									<h3 class="icon fa-envelope-o"><span class="label">Email</span></h3>
									<a href="#">hello@untitled.tld</a>
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
					<li>&copy; Untitled</li><li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
				</ul>
			</div>
		</footer>

	<!-- Scripts -->
		<script src="<c:url value='/js/jquery.min.js' />"></script>
		<script src="<c:url value='/js/jquery.poptrox.min.js' />"></script>
		<script src="<c:url value='/js/skel.min.js' />"></script>
		<script src="<c:url value='/js/util.js' />"></script>
		<script src="<c:url value='/js/main.js' />"></script>
</body>

<%-- <body>
	<div id="results">Your captured image will appear here...</div>
	
	<h1>WebcamJS Test Page</h1>
	<h3>Demonstrates 480x480 cropped capture &amp; 240x240 small display</h3>
	
	<div id="my_camera"></div>
	
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
	
	<!-- A button for taking snaps -->
	<form>
		<input type=button value="Take Large Snapshot" onClick="take_snapshot()">
	</form>
	
	<!-- Code to handle taking the snapshot and displaying it locally -->
	<script language="JavaScript">
		function take_snapshot() {
			// take snapshot and get image data
			Webcam.snap( function(data_uri) {
				// display results in page
				document.getElementById('results').innerHTML = 
					'<h2>Here is your large image:</h2>' + 
					'<img src="'+data_uri+'"/>';
			} );
		}
	</script>
	
</body> --%>
</html>
