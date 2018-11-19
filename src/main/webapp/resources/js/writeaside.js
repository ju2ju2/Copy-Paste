//params json 객체 파라미터 넘기는 값. VO역할
		var params = {  "subjectCategory": "",
							"boundary" :  "",
							"keyword": "",
							"page": 0
					  }



//폴더 리스트
function folderList(){
$.ajax({
   url: "../folder/selectAllFolder.json", // url_pettern 
   type:"POST",
   dataType:"json",//서버에서 응답하는 데이터 타입(xml,json,script,html)
   success:function(data){
	var unclassified = "";
   	var scrap="";
   	var folder="";

       if(data != null) {
         $.each(data, function(key, value){
            if(value.folderName.trim()=='스크랩'){
            	$('#scrap').empty();
            	scrap += '<div class="row" class="accordion" alt="'+value.folderName.trim()+'"><div class="col-xs-10 pt">'
            	scrap += '<span class="f-count" style="font-weight:700;">'+value.count+'</span>'
            	scrap += '<span class="f-name"><h5 class="accordion asideFolderName" id="writeAsideFolderName">'+value.folderName+'</h5></span>'
            	scrap += '</div><div class="col-xs-2 panel-margin">' 
            	scrap += '<i class="fas fa-bookmark icon-size" style="visibility:hidden; margin-top:0px; margin-bottom:23px"></i>'
            	scrap += '</div><div class="row"><div id="asideNoteList" style="padding:30px;"></div></div></div>';
            	$('#scrap').append(scrap);
            	scrap="";
            }else if(value.folderName.trim()=='미분류')
            {
            	$('#unclassified').empty();
            	unclassified += '<div class="row" class="accordion" alt="'+value.folderName.trim()+'"><div class="col-xs-10 pt">'
            	unclassified += '<span class="f-count" style="font-weight:700;">'+value.count+'</span>'
            	unclassified += '<span class="f-name"><h5 class="accordion asideFolderName" id="writeAsideFolderName">'+value.folderName+'</h5></span>'
            	unclassified += '</div><div class="col-xs-2 panel-margin">' 
            	if(value.defaultFolder==1){
            		unclassified += '<i class="fas fa-bookmark icon-size" style="margin-top:0px; margin-bottom:23px" onclick=setDefaultFolder(this,"'+value.folderName+'","'+value.count+'"></i>'
            		unclassified += '<span class="f-name" id="bookmarkO" style="display:none;">'+value.folderName+'</span>'
                   }else{
                	unclassified += '<i class="far fa-bookmark icon-size" style="margin-top:0px; margin-bottom:23px" id="bookmarkX" onclick=setDefaultFolder(this,"'+value.folderName+'")></i>'
                	unclassified += '<span class="f-name" id="fname" style="display:none;">'+value.folderName+'</span>'
                   }
            	unclassified += '</div><div class="row"><div id="asideNoteList" style="padding-left:30px;"></div></div></div>';
            	$('#unclassified').append(unclassified);
            	unclassified="";
            }else{
            	$('#folder').empty();
            	folder += '<div class="row" class="accordion" alt="'+value.folderName.trim()+'"><div class="col-xs-10 pt">'
            	folder += '<span class="f-count" style="font-weight:700;">'+value.count+'</span>'
            	folder += '<span class="f-name"><h5 class="accordion asideFolderName" id="writeAsideFolderName">'+value.folderName+'</h5></span>'
            	folder += '</div><div class="col-xs-2 panel-margin">' 
                if(value.defaultFolder==1){
                	folder += '<i class="fas fa-bookmark icon-size" style="margin-top:0px; margin-bottom:23px" onclick=setDefaultFolder(this,"'+value.folderName+'","'+value.count+'"></i>'
                	folder += '<span class="f-name" id="bookmarkO" style="display:none;">'+value.folderName+'</span>'
                }else{
                	folder += '<i class="far fa-bookmark icon-size" style="margin-top:0px; margin-bottom:23px" id="bookmarkX" onclick=setDefaultFolder(this,"'+value.folderName+'")></i>'
                	folder += '<span class="f-name" id="fname" style="display:none;">'+value.folderName+'</span>'
                }
            	folder += '</div><div class="row"><div id="asideNoteList" style="padding-left:30px;"></div></div></div>';
            	
            }
            
         
         });
      }
       $('#folder').append(folder);
   	   folder = "";
      
      /* 확장된 폴더 클릭시 목록 삭제 */
	    $(".asideFolderName").on("click",function(){
	      if ($(this).hasClass("activefolder")){
	         $(this).removeClass("activefolder");
	         $(this).closest('div').siblings('.row').children('#asideNoteList').empty(); 
	      }else{
	    	  $(this).addClass("activefolder");
	    	  var folderName = $(this).text();
	    	  folderNoteList(folderName);
	      } 
	    }); 
	    

	   /* 기본폴더 북마크 토글  */
	   $('.fa-bookmark').click(function() {
	      if ($(this).hasClass("far")) {
	         $('.fa-bookmark').removeClass("fas").addClass("far");
	         $(this).removeClass("far").addClass("fas");
	      }
	   })
    }
 })
}

/* 디폴트폴더 설정 */
		function setDefaultFolder(bookmark, folderName){
		$.ajax(
				{
		    url : "../folder/setDefaultFolder.json",
		    DataType :"text",
		    type : "post",
		    data : {"beforefolderName": $('#bookmarkO').text(),
		    		"folderName" : folderName},
		    success : function(data){
		    	folderList();
		    },
		    error : function(){
				swal({
		    		  title: "폴더 설정에 실패했습니다.",
					  text: "",
					  type: "info",
					  confirmButtonClass: "btn-danger btn-sm",
					  confirmButtonText: "확인",
					  showCancelButton: false
					});
				}
			});	 			
		}





//폴더안의 노트 리스트
function folderNoteList(folderName){
    $.ajax({
        url: "../note/selectByFolderNote.json", // url_pettern 
        type:"POST",
        data: {'folderName':folderName},
        dataType:"json",
        success:function(data){
            if(data != null) {
              var folderNoteList = "";
              $('#asideNoteList').empty(); 
              $.each(data, function(key, value){
                 folderNoteList="";
                 folderNoteList+='<div class="col-xs-11 asideNoteDiv">'
                 folderNoteList+='<div class="text-center asideNoteDiv">'
                 folderNoteList+='<!-- a HTML (to Trigger Modal) -->'
               	 folderNoteList+='<a data-toggle="modal"'
             	 folderNoteList+='href="../note/noteDetail.htm?noteNum='+value.noteNum+'&write=y"'
                 folderNoteList+='data-target="#modal-testNew" role="button" data-backdrop="static">'
                 folderNoteList+='<div class="item">'
                 folderNoteList+='<img class="img-rounded"'
                 folderNoteList+='src="'+value.noteThumnail+'"'
                 folderNoteList+='alt="'+value.noteTitle+'" width="100%">'
                 folderNoteList+='<div class="caption">'
                 folderNoteList+='<i class="fa fa-plus" aria-hidden="true"></i>'
                 folderNoteList+='</div>'
                 folderNoteList+='</div>'
                 folderNoteList+='<div>'
                 folderNoteList+='<h4 class="noteTitle" >'+value.noteTitle+'</h4>'
                 folderNoteList+='<strong>'+value.userNick+'</strong><span>'+value.noteDate+'</span>'
                 folderNoteList+='</div>'
                 folderNoteList+='</a>'
                 folderNoteList+='</div>'
                 folderNoteList+='</div>'
                 $("div[alt='"+value.folderName+"']").find("#asideNoteList").append(folderNoteList);
              });

           }
        

            
         }
      })
	
	
}



//노트검색
function searchNoteList(){

	$.ajax({
		  
		    type : "get",
		    url : "../etc/selectSearchSite.json",
		    data : params, 
		    dataType : 'json',
		    success : function(data){
		    		 var aa = "";
			          	if(data!=null) {
			          		$.each(data, function(key, value){
			          			 $('#searchList').empty();   
		                         aa+='<div class="col-xs-12 searchNoteDiv">'
		                         aa+='<div class="text-center">'
		                         aa+='<!-- a HTML (to Trigger Modal) -->'
		                         aa+='<a data-toggle="modal"'
		                         aa+='href="../note/noteDetail.htm?noteNum='+value.noteNum+'&write=y"'
		                         aa+='data-target="#modal-testNew1" role="button" data-backdrop="static">'
		                         aa+='<div class="item">'
		                         aa+='<img class="img-rounded"'
		                         aa+='src="'+value.noteThumnail+'"'
		                         aa+='alt="'+value.noteTitle+'" width="100%">'
		                         aa+='<div class="caption">'
		                         aa+='<i class="fa fa-plus" aria-hidden="true"></i>'
		                         aa+='</div>'
		                         aa+='</div>'
		                         aa+='<div>'
		                         aa+='<h4  class="noteTitle">'+value.noteTitle+'</h4>'
		                         aa+='<strong>'+value.userNick+'</strong><span>'+value.noteDate+'</span>'
		                         aa+='</div>'
		                         aa+='</a>'
		                         aa+='</div>'
		                         aa+='</div>'
		                         $("div[alt='"+value.folderName+"']").find("#searchList").html(aa);
			          		})
			          	}
			          	
			          	else{
			          		aa ="";
			          		aa += "<div class='text-center noteDiv'>";
			          		aa += "<h5>검색된 결과가 없습니다.</h5>";
			          		aa += "</div>";
						}
			          	
			          	$("#searchList").append(aa);	
		    	
		          	
		    }
	})
}


//스크롤이벤트 위치지정
var lastScrollTop = 0;
//스크롤 발생시 추가적인 리스트 생성

function moreAsideNoteList(e,url,params){
	e.stopPropagation() 
 
	// ① 스크롤 이벤트 최초 발생
	var currentScrollTop = $(window).scrollTop();

	if( currentScrollTop - lastScrollTop > 0 ){
		if ($(window).scrollTop() >= ($(document).height() - $(window).height()) ){ 
			params.page += 12;
			searchNoteList(url,params)
			
		}
	}
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
	
	$( "#search-text-write" ).autocomplete({
	      source: uniquekeywords
	});
}


//로딩시 실행
$(document).ready(function() {

		//wite aside 노트탭 클릭시 폴더목록 표시
		folderList()
	

		
//사이트내 검색 탭 클릭시 
	    $("#writeSearch").click(function(){
		var url="";
		url ="../etc/selectSearchSite.json";
		params.keyword=$("#search-text-write").val()
		params.subjectCategory=$('#subject-category option:selected').val()
		params.boundary=$('input[name="boundary"]:checked').val()
		params.page=0
		searchNoteList(url,params);
		autoComplete(params.subjectCategory);
		$(window).scroll(function(e) { moreAsideNoteList(e,url, params)})
		})
		
		//검색어 입력 사이트 내 검색 탭
		$("#searchWriteSite").click(function(){
			if($("#search-text-write").val()==''){
				swal({
					title: "검색어를 입력해주세요",
					text: "",
					type: "warning",
					confirmButtonClass: "btn-danger",
					confirmButtonText: "OK",
					showCancelButton: false
				})
			}else{
				var url="";
				url ="../etc/selectSearchSite.json";
				params.keyword=$("#search-text-write").val()
				params.subjectCategory=$('#subject-category option:selected').val()
				params.boundary=$('input[name="boundary"]:checked').val()
				params.page=0
				searchNoteList(url,params);
				autoComplete(params.subjectCategory);
				$(window).scroll(function(e) { moreAsideNoteList(e,url, params)})
			}
		});

	    //주제별 검색

		 $('#subject-category').on("change",function(e) {
			url ="../etc/selectSearchSite.json";
			params.keyword=$("#search-text-write").val()
			params.subjectCategory = $('#subject-category option:selected').val()
			params.boundary=$('input[name="boundary"]:checked').val()
			params.page=0
			searchNoteList(url, params);
			autoComplete(params.subjectCategory);
		    $(window).scroll(function(e) {moreAsideNoteList(e,url, params)})
		 })
		 
			
		
			
		 //스크롤에 따라 위로가기 버튼 표시 
		 var inner = $(".inner")
		 $(inner).scroll(function() {
		   if (inner.scrollTop() > 50 || inner.scrollTop() > 50) {
		    	 $(".topBtn").css("display", "block");
		    } else {
		    	$(".topBtn").css("display", "none");
		    }
		 });

		//위로가기 버튼 클릭시
		$('.topBtn').click(function(){
			document.body.scrollTop = 0;
			document.documentElement.scrollTop = 0; 
			
			var scrollTop = $(this).scrollTop();
			var inner = $(".inner")
			
			inner.animate({
				"scrollTop":0
			}, 0);
		})
            
		
//끝		
})	




