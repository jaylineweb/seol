<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
 <head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
  <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, maximum-scale=2.0, minimum-scale=1.0, user-scalable=yes" />
  <meta name="keywords" content="">
  <meta name="description" content="">
  <meta property="og:site_name" content="구리시청 설연휴 종합안내">
  <meta property="og:url" content="https://www.guri.go.kr/seol/index.do">
  <meta property="og:title" content="구리시청 설연휴 종합안내">
  <meta property="og:description" content="">
  <meta property="og:type" content="website">
  <link rel="shortcut icon" href="/site/seol/images/favicon.ico">
  <link rel="icon" href="/site/seol/images/favicon.ico">
  <link rel="stylesheet" type="text/css" href="/site/seol/css/main.css" />
  <script type="text/javascript" src="/site/seol/js/jquery-1.11.3.min.js"></script>
  <script type="text/javascript" src="/site/seol/js/jquery.tab.js"></script>
  <script type="text/javascript" src="/site/seol/js/jquery.cookie.js"></script>
  <script type="text/javascript" src="/site/seol/js/main.js"></script>
  <title>${menuInfo.cntntsNm} - 구리시청 설연휴 종합안내</title>
 </head>

 <body id="main">
 <div class="wrap">
 	<header>
		<div class="link">
			<a href="https://www.guri.go.kr/www/index.do" target="_blank" title="구리시청 홈페이지로 이동"><span>구리시청 홈페이지</span></a>
		</div>
		<div class="visual_area">
			<img src="/site/seol/images/visual_title_09.png"	alt="구리시민 여러분, 새해 복 많이 받으세요! 2024 설 연휴 종합 안내. 연휴기간 : 2024.2.9.(금)~2.12.(월), 설:2.10.(토)">		
		</div>
	</header>
					<jsp:include page="/repository/seol/menu/top.jsp" />
	<div id="container">
		<div class="wrap contain_wrap">
			<main id="colgroup" class="colgroup">
				<article>
					<div id="contents" class="cts${key}"><!-- ctsxxx(키번호) -->
						<decorator:body />
					</div><!-- //#contents -->
					<script>
						function getParameterByName(name) {
							name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
							var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
								results = regex.exec(location.search);
							return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
						}
						var menukey = getParameterByName('key');
						/*
						if(menukey){
							$.ajax({
								url : 'contents/'+menukey+'.html',
								async: false,//true면 동기, false 비동기
								success : function (data) {
									$('#contents').attr('class', 'cts'+menukey).append(data);
								},
								error:function(request, status, error){
									console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
								}
							});
						} else{

						}
						*/
					</script>
				</article>
			</main>
		</div>
	</div>
    <!-- //#container -->
	<a href="#body" id="btnTopScroll" title="상단으로 이동" class="top_btn"><img src="/site/seol/images/top_btn.png" alt="TOP"></a>
	
 </div>
 <!-- //#wrap -->
 <footer id="footer">
	<div class="address margin_t_20">
		(우)11954 경기도 구리시 아차산로 439 (교문동) TEL. 031-557-1010 ※ 당직실 : 031-550-2221~2 (평일 18시 ~ 익일 09시, 주말 및 공휴일) FAX. 031-557-8282
	</div>
	<div class="copylight">COPYRIGHT©GURI CITY. ALL RIGHTS RESERVED.</div>
</footer>

<script>
    $(function(){
    	
        var jbOffset = $( '.tab_group' ).offset();
        $( window ).scroll( function() {
            if ( $( document ).scrollTop() >= jbOffset.top ) {
            $( '.tab_group' ).addClass( 'jbFixed' );
            }
            else {
            $( '.tab_group' ).removeClass( 'jbFixed' );
            }
        });

        $("#btnTopScroll").click(function(){
            $("body,html").animate({scrollTop:0},300);
            return false;
        });
        $(window).scroll(function(){
            var scT = $(this).scrollTop();
            if (scT > 1) {
                $("#btnTopScroll").css("display","block");
            }else {
                $("#btnTopScroll").css("display","none");
            }
        });
    });
</script>
  
 </body>
</html>
