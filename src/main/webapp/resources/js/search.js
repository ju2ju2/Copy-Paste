

//params json 객체 파라미터 넘기는 값. VO역할
		var params = {      "subjectCategory": "",
							"boundary" :  "",
							"keyword": "",
							"page": 0
					  }
		
// 스크롤 내렸을때 top보이고 안내리면 안보임
window.onscroll = function() {scrollFunction()};
function scrollFunction() {
	if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
		document.getElementById("myBtn").style.display = "block";
	} else {
		document.getElementById("myBtn").style.display = "none";
	}
}

// top버튼 눌렀을때 실행
function topFunction() {
	document.body.scrollTop = 0;
	document.documentElement.scrollTop = 0;
}

//사이트내 검색어 자동완성

function autoComplete(subjectName){
	var allkeywords =[];
	var uniquekeywords = [];
	$.ajax({
		type:"get",
		url: "../etc/collectSearchKeywords.json", 
		data: {"subjectName":subjectName},
		dataType:"json",
		success:function(data){
			
    	    $.each(data, function(index,obj){
    		   	allkeywords.push(obj.noteTitle);
    		});	
    	    //배열 중복제거 후 담기
			$.each(allkeywords, function(i, el){
				if($.inArray(el, uniquekeywords) === -1) uniquekeywords.push(el); 
			});
		}
	})
	
	$( "#searchinsite-text" ).autocomplete({
	      source: uniquekeywords
	});
}


//노트목록
function makeNoteList(url, params){
$.ajax({
  type:"get",
  url: url, // url_pettern
  data: params,
  dataType:"json",//서버에서 응답하는 데이터 타입(xml,json,script,html)
  success:function(data){
	  console.log(data)
	  var noteList = "";
    	if(data != null) {
    		$.each(data, function(key, value){
    			noteList="";
    			noteList+='<div class="col-xs-12 col-sm-6 col-md-6 col-lg-3 ">';
    			noteList+='<div class="text-center noteDiv" id="'+value.noteNum+'">';
    			noteList+='	<!-- a HTML (to Trigger Modal) -->';
    			noteList+='	<a data-toggle="modal"';
    			noteList+='		href="../note/noteDetail.htm?noteNum='+value.noteNum+'"';
    			noteList+='		data-target="#modal-testNew" role="button" data-backdrop="static">';
    			noteList+='		<div class="item">';
    			noteList+='			<img class="img-rounded"';
    			noteList+='				src="'+value.noteThumnail+'"';
    			noteList+='					alt="${noteList.noteTitle}" width="100%">';
    			noteList+='				 <div class="caption">';
    			noteList+='					<i class="fa fa-plus" aria-hidden="true"></i>';
    			noteList+='				</div> ';
    			noteList+='			</div>';
    			noteList+='			<div>';
    			noteList+='			<input type="hidden" id="noteNum" class="noteNum" value="'+value.noteNum+'">';
    			noteList+='				<h4 class="noteTitle">'+value.noteTitle+value.noteNum+'</h4>';
    			noteList+='			<strong>'+value.userNick+'</strong> <span> '+value.noteDate+'</span>';
    			noteList+='		</div>';
    			noteList+='		</a>';
    			noteList+='		</div>';
    			noteList+='	</div>';
		
		
    			$("#noteList").append(noteList);
    		})
    		
    	}else{
    		noteList="";
			noteList+='<div class="col-xs-12 text-center"><h4>검색된 결과가 없습니다.</h4></div>';
    		$("#noteList").html(noteList);
    	}
    }
  })
}


// 스크롤이벤트 위치지정
var lastScrollTop = 0;
//스크롤 발생시 추가적인 리스트 생성

function moreNoteList(e,url,params){
	e.stopPropagation() 
 
	// ① 스크롤 이벤트 최초 발생
	var currentScrollTop = $(window).scrollTop();

	if( currentScrollTop - lastScrollTop > 0 ){
		if ($(window).scrollTop() >= ($(document).height() - $(window).height()) ){ 
			params.page += 12;
			console.log(params.page+" 번부터")
			makeNoteList(url,params)
			
		}
	}
}

//페이지 로딩시 요청
$("document").ready(function(){
		//더보기 클릭시 주제 선택된것으로 표시
	    var subjectName=$('#subjectName').val();
		$("#subject-category > option[value="+subjectName+"]").attr("selected", "selected");
	    
		var url="";
		url ="../etc/selectSearchSite.json";
		params.keyword=$("#searchinsite-text").val()
		params.subjectCategory=$('#subject-category option:selected').val()
		params.boundary=$('input[name="boundary"]:checked').val()
		makeNoteList(url,params);
		autoComplete(params.subjectCategory);
		$(window).scroll(function(e) { moreNoteList(e,url, params)})
		
		
		//검색어 입력
		$("#searchinsite").click(function(){
			var url="";
			url ="../etc/selectSearchSite.json";
			params.page=0
			params.keyword=$("#searchinsite-text").val()
			params.subjectCategory=$('#subject-category option:selected').val()
			params.boundary=$('input[name="boundary"]:checked').val()
			$('#noteList').empty();
			makeNoteList(url,params);
			autoComplete(params.subjectCategory);
			$(window).scroll(function(e) { moreNoteList(e,url, params)})
		});

	    //주제별 검색

		 $('#subject-category').on("change",function(e) {
			url ="../etc/selectSearchSite.json";
			params.keyword=$("#searchinsite-text").val()
			params.subjectCategory = $('#subject-category option:selected').val()
			params.boundary=$('input[name="boundary"]:checked').val()
			params.page=0
			$('#noteList').empty();
			makeNoteList(url, params);
			autoComplete(params.subjectCategory);
		    $(window).scroll(function(e) {moreNoteList(e,url, params)})
		 })
		 
	
		
//끝		
})