


//검색어 입력
$("#searchinsite").click(function(){
		if($("#searchinsite-text").val()==''){
			swal({
				  title: "검색어를 입력해주세요",
				  text: "",
				  type: "warning",
				  confirmButtonClass: "btn-danger",
				  confirmButtonText: "OK",
				  showCancelButton: false
				})
		}else{
			 $.ajax(
						{
				    url : "../etc/selectSearchSite.json",
				    type : "get",
				    data : {"keyword":$("#searchinsite-text").val(),
				    		"subjectCategory":$('#subject-category option:selected').val(),
				    		"boundary":$('input[name="demo-priority"]:checked').val()
				    },
				    dataType : 'json',
				    success : function(data){
				    		 var search = "";
					          	if(data!=null) {
					          		$.each(data, function(key, value){
					          			$("#searchList").empty();
					          			search+='<div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">';
					          			search+='<div class="text-center noteDiv" id="'+value.noteNum+'">';
					          			search+='	<!-- a HTML (to Trigger Modal) -->';
					          			search+='<a data-toggle="modal"';
					          			search+='href="../note/noteDetail.htm?noteNum='+value.noteNum+'"';
					          			search+='data-target="#modal-testNew" role="button" data-backdrop="static">';
					          			search+='<div class="item">';
					          			search+='<img class="img-rounded"';
					          			search+='src="'+value.noteThumnail+'"';
					          			search+='alt="'+value.noteTitle+'" width="100%">';
					          			search+='<div class="caption">';
					          			search+='<i class="fa fa-plus" aria-hidden="true"></i>';
					          			search+='</div>';
					          			search+='</div>';
					          			search+='<div>';
					          			search+='<h4>'+value.noteTitle+'</h4>';
					          			search+='<strong>'+value.userEmail+'</strong><span>'+value.noteDate+'</span>';
					          			search+='</div>';
					          			search+='</a>';
					          			search+='</div>';
					          			search+='</div>';
					          				
					          		})
					          	}
					          	
					          	if(data.length == 0){
					          		$("#searchList").empty();
					          		search += "<div class='text-center noteDiv'>";
					          		search += "<h3>검색된 결과가 없습니다.</h3>";
					          		search += "</div>";
								}
					          	
					          	$("#searchList").html(search);	
				    	
				          	
				    },
				    error : function(){
				    	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				    }
						})
		}
		
	});



