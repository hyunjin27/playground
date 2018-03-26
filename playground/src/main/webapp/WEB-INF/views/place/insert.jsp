<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script type="text/javascript">
    
        var openWin;
    
        function openChild()
        {
            // window.name = "부모창 이름"; 
            window.name = "parentForm";
            // window.open("open할 window", "자식창 이름", "팝업창 옵션");
            openWin = window.open("search.play",
                    "childForm", "width=570, height=350, resizable = no, scrollbars = no");    
        }
 
   </script>
<h3>오락실 등록</h3>
<ul>
<form id="parentForm" action="insert.play" method="post">
<li>오락실 명 : <input type="text" size="50" name="name"></li>
<li>오락실 위치코드 : <input id="code" type="text" size="20" name="addr"><input type="button" value="주소로 위치코드 찾기" onclick="openChild()"></li>
<li>설명 : <textarea name="detail" cols="20" rows="5"></textarea></li>
<li><input type="submit"></li>
</ul>
</form>