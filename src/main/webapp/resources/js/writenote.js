/*
@JS : writenote.js
@Date : 2018.10.29
@Author : 문지은
@Desc : writenote 드래그js  */


var params = {
		   "keyword": "",
		   "dragNum" : "",
		   "sortCategory" : ""
			}

//드래그 마크 중요표시 
function setDragMark(dragNum){
url ="../drag/setDragMark.json"
params.dragNum =dragNum
makeAsideDragList(url, params); 
};	
//드래그 마크 중요표시 삭제
function removeDragMark(dragNum) {
url ="../drag/removeDragMark.json",
params.dragNum =dragNum
makeAsideDragList(url, params); 
};
// 노트  드래그로 삭제
function deleteDrag(dragNum) {
var dragNum = dragNum;
swal({
title: "정말 삭제하시겠습니까?",
text: "삭제 후에는 다시 복구 할 수 없습니다.",
type: 'warning',
showCancelButton: true,
confirmButtonClass : "btn-danger btn-sm",
cancelButtonClass: "btn btn-sm",
confirmButtonText: '확인',
cancelButtonText: "아니요!",
closeOnConfirm: false
},
function(isConfirm){
if(isConfirm){
$.ajax({
	url:"../drag/deleteDrag.json",
	dataType:"json",
	data: {"dragNum":dragNum},
	type: "POST"
	}).done(function (result){
			swal({type: "success",
				  title: '성공적으로 삭제되었습니다.',
	              confirmButtonClass : "btn-danger",
				  closeOnConfirm: true
			},function(){
				    url ="../drag/selectAllDrag.json";
				    makeAsideDragList(url); 
			})
	});
}
}
);
}	


//드래그목록
function makeAsideDragList(url, params){

$.ajax({
url: url, // url_pettern 
type:"POST",
dataType:"json",//서버에서 응답하는 데이터 타입(xml,json,script,html)
data : params,
success:function(data){
var a = "";
if(data != null) {
	$.each(data, function(key, value){
		$('#dragList').empty();
 	a += '<div class="text-center dragDiv mt-10 dragDiv" id="'+value.dragNum+'">';
 	a += '<blockquote class="grapefruit">';
 	
 	a += '<!-- 별 아이콘 -->';
 	a += '<div class="icon-right starDiv">	<br>';
 	if(value.dragMark==1){   
			a += '<br> <i class="fas fa-star icon-size" id="starDrag" onclick=removeDragMark("'+value.dragNum+'");></i>';
		}else{	setDragMark
			a += '<br> <i class="far fa-star icon-size" id="starDrag" onclick=setDragMark("'+value.dragNum+'");></i>';
		}
 	a += '</div>';
		a += '<!-- 모달 창 -->';
		a += '<div class="dragContent">';
 	a += '<div class="drag-a">';
 	a += '<div class="mt-10" class="dragText" id="dragText">'+value.dragText+'</div> <code>';
 	a += ' <span class="Cgrapefruit" id="dragOrigin">출처 : '+value.dragOrigin+'</span> ';
 	a += '<span id="dragDate">'+value.dragDate+'</span>';
 	a += '</code>';
 	a += '</div>';
 	a += '</blockquote>';
 	a += '</div>';		
	})
}

if (data.length == 0) {
	a += "<div class='text-center'>";
	a += "<h6>등록된 드래그가 없습니다.</h6>";
	a += "</div>";
}
$("#dragList").html(a);
$('.dragDiv').draggable({
	 revert: true, 
	 revertDuration: 200,
	 snapMode: "inner",
	 scroll: true,
	 scrollSensitivity: 100 ,
	 scrollSpeed: 100
	 
	 
	 
})

$("#droppable").droppable({
	  activeClass:"ui-state-active",
	  accept:".dragDiv",
	  drop: function(event,ui) {
		  console.log("드랍이세끼;")
		  var dragNum = ui.draggable.prop("id")
		  deleteDrag(dragNum)
	  }     
});  

// 드래그 클릭시 텍스트 에디터기에 추가
$('.dragDiv').on("click",function(){
	var editor = tinyMCE.activeEditor;
	var dragText = $(this).find('#dragText').text();
	editor.dom.add(editor.getBody(), 'p', {}, dragText+ "<br>");
			})
			
		   }
		 })
		}



//페이지 로딩시 요청
$("document").ready(function(){
var url="";
url ="../drag/selectAllDrag.json";
makeAsideDragList(url);



//드래그 키워드 검색
$('#search').click(function(e) {
url ="../drag/selectByKeyDrag.json"
params.keyword = $('#search-Text').val()
makeAsideDragList(url, params);
})

//드래그 정렬 
$('#sort-category').change(function(e) {
url ="../drag/selectOrderbyDrag.json"
params.sortCategory = $('#sort-category option:selected').val()
makeAsideDragList(url, params);
})



//끝
});

	











