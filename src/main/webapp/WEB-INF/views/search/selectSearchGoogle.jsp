<%-- search>>
@JSP : selectSearchGoogle.jsp
@Date : 2018.10.10
@Author : 우나연
@Desc : 구글 검색 페이지
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
</script>
<body>


<div id="googleBrowser"><script>
  (function() {
    var cx = '008735657841569968312:-xk9eqqghzs';
    var gcse = document.createElement('script');
    gcse.type = 'text/javascript';
    gcse.async = true;
    gcse.src = 'https://cse.google.com/cse.js?cx=' + cx;
    var s = document.getElementsByTagName('script')[0];
    s.parentNode.insertBefore(gcse, s);
  })();
</script>
<gcse:search></gcse:search>
</div>
</body>
