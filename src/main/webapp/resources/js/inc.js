/*
@JSP : inc.js
@Date : 2018.10.11
@Author : 우나연
@Desc : 페이지 전체에 들어가는 js (드래그 저장,로딩, 모달 초기화)
 */


var contextUrl= "http://" + location.host + "/copyNpaste/";

//모달 내용 초기화
/*$('documnet').on('hidden.bs.modal', '.modal', function() {
	$(this).removeData('bs.modal');
});

*/
$(document).on('hidden.bs.modal', '.modal', function (e) {
	  var modalData = $(this).data('bs.modal');
	  if (modalData && modalData.options.remote) {
	    $(this).removeData('bs.modal');
	    $(this).find(".modal-content").empty();
	    $(e.target).removeData("bs.modal").find(".modal-content").empty();
	  }
});

$('#modal-testNew').on('shown.bs.modal', function() {
	$(document).off('focusin.modal');
});

//이전 드래그 텍스트
var prevText;

// 드래그 저장
/*var inputtag= $(":input")
if()
*/
$(document).mouseup(function(event){
    
    if (!$(event.target).is(":input")) {
        // code
    
	
	
	event.preventDefault(); 
	event.stopPropagation(); 
	
     var selection = window.getSelection();
	 var text = selection.toString();
	 
	 // 드래그 텍스트 공백인지 앞의 드래그와 중복되는지 체크
	 if (text !='' && text.length > 1 && $.trim(text).length != 0 && prevText != text) {
		 // 드래그 저장
		var dragfd = new FormData();
		var dragOriginLink = window.location.protocol + "//" + window.location.host + "/" + window.location.pathname;
		dragfd.append("dragOriginLink",dragOriginLink);
		dragfd.append("dragOrigin","copyNpaste");
		dragfd.append("dragText", text);

		$.ajax({
			url : contextUrl+"/drag/insertDrag.json",
			type:"POST",
			data :dragfd,
			dataType : "json",
			processData: false,
			contentType:false
		})
		.done(function (result) {
			swal({
				type : "success",
				title : '드래그가 저장되었습니다.',
				confirmButtonClass : "btn-danger",
				closeOnConfirm : true
			}, function() {
				
			});
			
			prevText = text;
		})
		
		return false;
	 }	
	 
	 
    }
 });

//로딩
$.ajaxSetup({
	beforeSend: function () {
	    var width = 0;
	    var height = 0;
	    var left = 0;
	    var top = 0;
	    width = 80;
	    height = 80;
	    top = ( $(window).height() - height ) / 2 + $(window).scrollTop();
	    left = ( $(window).width() - width ) / 2 + $(window).scrollLeft();
	
	
	
	    if($("#div_ajax_load_image").length != 0) {
	           $("#div_ajax_load_image").css({
	                  "top": top+"px",
	                  "left": left+"px"
	           });
	           $("#div_ajax_load_image").show();
	           $(".wrap-loading").css({
	                  "position": "fixed",
	                  "z-index": "99999999999",
	                  "left": "0", 
	                  "right": "0",
	                  "top": "0",
	                  "bottom": "0",
	                  "background": "rgba(0,0,0,0.2)",
	                  "filter": "progid:DXImageTransform.Microsoft.Gradient(startColorstr='#20000000', endColorstr='#20000000');"
	           });
	           $(".wrap-loading").show();
	           
	        
	    }
	    else {
	           $('body').append(
	        		   '<div class="wrap-loading display-none">'
		        		   +'<div id="div_ajax_load_image" style="position:absolute; top:' 
		        		   + top + 'px; left:' + left + 'px; width:' + width 
		        		   + 'px; height:' + height + 'px; z-index:9999; background:#fff;'
		        		   +' filter:alpha(opacity=50); opacity:alpha*0.5; margin:auto; padding:0; border-radius: 50%;">'
		        		   +'<img src="'+contextUrl+'/resources/image/loading.gif" style="width:80px; height:80px;"></div>'
		        	   +'</div>'   
	           );
	    }
	
	}
	,complete: function () {
			   $(".wrap-loading").hide();
	           $("#div_ajax_load_image").hide();
	}
	,success: function () {
		       $(".wrap-loading").hide();
	           $("#div_ajax_load_image").hide();
	},error:function(request,status,error){
		    console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	}



})
