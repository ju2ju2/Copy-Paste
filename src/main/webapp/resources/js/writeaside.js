
//폴더 리스트
function folderList(){
$.ajax({
   url: "../folder/selectAllFolder.json", // url_pettern 
   type:"POST",
   dataType:"json",//서버에서 응답하는 데이터 타입(xml,json,script,html)
   success:function(data){
     var folderList = "";

       if(data != null) {
         $.each(data, function(key, value){
            $('#asideFolderList').empty();   
            folderList += '<div class="row" class="accordion" alt="'+value.folderName.trim()+'"><div class="col-xs-10 pt"> <h5 class="accordion asideFolderName" id="asideFolderName">'+value.folderName+'</h5>'
            folderList += '</div><div class="col-xs-2 panel-margin">' 
            
            if(value.defaultFolder==1){
            	folderList += '<i class="fas fa-bookmark icon-size"></i>'
            }else{
            	folderList += '<i class="far fa-bookmark icon-size"></i>'
            }
            folderList += '</div><div class="row"><div id="asideNoteList"></div></div></div>';
         
         });
      }
      $("#asideFolderList").append(folderList);
      
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







//폴더안의 노트 리스트
function folderNoteList(folderName){
    $.ajax({
        url: "../note/selectByFolderNote.json", // url_pettern 
        type:"POST",
        data: {'folderName':folderName},
        dataType:"json",
        success:function(data){
        	console.log("folderNoteList")
        	console.log(data)
            if(data != null) {
              var folderNoteList = "";
              $.each(data, function(key, value){
                 $('#asideNoteList').empty();  
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
	 $.ajax(
				{
		    url : "../etc/selectSearchSiteWrite.json",
		    type : "get",
		    data : {"keyword":$("#search-text-write").val(),
		    },
		    dataType : 'json',
		    success : function(data){
		    	      console.log(data);
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
			          	
			          	if(data.length == 0){
			          		$("#searchList").empty();
			          		aa += "<div class='text-center noteDiv'>";
			          		aa += "<h5>검색된 결과가 없습니다.</h5>";
			          		aa += "</div>";
						}
			          	
			          	$("#searchList").html(aa);	
		    	
		          	
		    }
	})
}




//로딩시 실행
$(document).ready(function() {

		//wite aside 노트탭 클릭시 폴더목록 표시
		folderList()
	

  		 // 사이트 내 검색 탭
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
					searchNoteList()
				}
			})
			
		 //스크롤에 따라 위로가기 버튼 표시 
		 var inner = $(".inner")
		 $(inner).scroll(function() {
		   if (inner.scrollTop() > 50 || inner.scrollTop() > 50) {
		    	 document.getElementById("topBtn").style.display = "block";
		    } else {
		    	 document.getElementById("topBtn").style.display = "none";
		    }
		 });

		//위로가기 버튼 클릭시
		$('#topBtn').click(function(){
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




