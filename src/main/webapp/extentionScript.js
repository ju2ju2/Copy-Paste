var ip="192.168.0.141";
// 로그아웃 동적쿼리 임포트
function dynamicallyLoadScript() {
    var script = document.createElement("script"); 
    script.src = "https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js";
    document.head.appendChild(script);  
	}  

// 로그아웃
  document.querySelector("#logoutBtn").onclick = function () {
    localStorage.clear();
    document.querySelector("#afterLogin").style.display = "none";
    document.querySelector("#loginForm").style.display = "block";
    stopDrag();
  }

  // 로그인
  document.querySelector("#loginBtn").onclick = function () {
    var userEmail = document.querySelector("#userEmail").value;
    var userPwd = document.querySelector("#userPwd").value;

    var xhr = new XMLHttpRequest();

    xhr.onreadystatechange = function () {
      if (xhr.readyState == 4) {
        if (xhr.status == 200) {
          var result = JSON.parse(xhr.responseText);
          if(result.loginChk == 'true') {
            document.querySelector("#afterLogin").style.display = "block";
            document.querySelector("#loginForm").style.display = "none";
            document.querySelector("#welcome").innerHTML = result.userNick +"님 환영합니다.";
            localStorage.setItem("userEmail", result.userEmail);
            localStorage.setItem("userNick", result.userNick);
            localStorage.setItem("userPhoto", result.userPhoto);
            allowDrag();
          } else {
            alert("로그인 정보를 확인해주세요");
            return false;
          }
        }
      }
    };
    xhr.open("POST", "http://"+ip+":10030/login?userEmail="+userEmail+"&userPwd="+userPwd, true);
    xhr.send();
  }

  // 팝업킬때 준비동작
  window.onload = function () {
    if(localStorage.getItem("userEmail") != null) {
    document.querySelector("#afterLogin").style.display = "block";
    document.querySelector("#loginForm").style.display = "none";
    document.querySelector("#welcome").innerHTML = localStorage.getItem("userNick") +"님 환영합니다.";
    allowDrag();
    dynamicallyLoadScript();
    }
  }

  // 드래그 저장 코드 주입
  function allowDrag() {
    chrome.tabs.executeScript({
      code: 'var prevText; document.querySelector("body").onmouseup = function(){'
       + 'var selectedText = "";'
       + 'if (typeof window.getSelection != "undefined") {'
       + '  var sel = window.getSelection();'
       + '  if (sel.rangeCount) {'
       + '    var container = document.createElement("div");'
       + '    for (var i = 0, len = sel.rangeCount; i < len; ++i) {'
       + '      container.appendChild(sel.getRangeAt(i).cloneContents());'
       + '    }'
       + '    selectedText = container.innerHTML;'/*.replace(/&/g, "amp;")*/
       + '  }'
       + '} else if (typeof document.selection != "undefined") {'
       + '  if (document.selection.type == "Text") {'
       + '    selectedText = document.selection.createRange().htmlText;'/*.replace(/&/g, "amp;")*/
       + '  }'
       + '}'
       + 'var dragOriginLink = window.location.href;'/*.replace(/&/g, "amp;").replace(/=/g, "nun;")*/
       + 'var dragOrigin = document.getElementsByTagName("title")[0].innerHTML;'/*.replace(/&/g, "amp;")*/
       + 'console.log(selectedText + " / " + dragOriginLink);'
       + 'var datatosend = "dragText=" + selectedText + "&dragOriginLink=" + dragOriginLink + "&dragOrigin=" + dragOrigin +"&userEmail='+localStorage.getItem("userEmail")+'";'
       + 'var xhrr = new XMLHttpRequest();'
       + 'xhrr.onreadystatechange = function () {'
       + 'if (xhrr.readyState == 4) {'
       + 'if (xhrr.status == 200) {'
       + 'alert("드래그 저장 완료 :)");'
       + 'prevText = selectedText;'
       + 'window.getSelection().removeAllRanges();'
       + '}	}	};'
       + 'if(selectedText !="" && selectedText.length > 0 && selectedText.trim().length != 0 && prevText != selectedText){'
       + 'if (confirm("드래그를 저장하시겠어요?")) {'
       + 'xhrr.open("POST", "http://'+ip+':10020/drag", true);'
       + 'xhrr.setRequestHeader("Content-type","application/x-www-form-urlencoded");'
       + 'xhrr.send(datatosend);}}'
       + '}'
    }, function (result) {
      // 위의 코드가 실행된 후에 이 함수를 호출해주세요. 그 때 result에 담아주세요.
      //이 문서에서 body  태그 아래에 있는 모든 텍스를 가져온다. 그 결과를 bodyText라는 변수에 담는다.
      console.log("good:)");
    });
 }

 // 드래그 저장 코드 없애기.
 function stopDrag() {
   chrome.tabs.executeScript({
     code: 'document.querySelector("body").onmouseup = function(){console.log("end")}'
   }, function (result) {
     // 위의 코드가 실행된 후에 이 함수를 호출해주세요. 그 때 result에 담아주세요.
     //이 문서에서 body  태그 아래에 있는 모든 텍스를 가져온다. 그 결과를 bodyText라는 변수에 담는다.
     console.log("good:)");
   });
}

 // 홈페이지로 이동
 document.querySelector(".homeOpenBtn").onclick = function () {
   window.open("http://"+ip+":8090/copyNpaste/", "_blank");
 }
