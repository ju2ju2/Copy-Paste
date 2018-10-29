$(function() {
	$("#searchinsite").click(function(){
		 $.ajax(
					{
			    url : "../etc/selectSearchSite.json",
			    type : "get",
			    data : {"keyword":$("#searchinsite-text").val()},
			    dataType : 'json',
			    success : function(data){
			    		 var search = "";
				          	if(data!=null) {
				          		$.each(data, function(key, value){
				          			$("#searchList").empty();
				          			search+='<div class="col-xs-12 col-sm-6 col-md-6 col-lg-3 ">';
				          			search+='<div class="text-center noteDiv" id="'+value.noteNum+'">';
				          			search+='	<!-- a HTML (to Trigger Modal) -->';
				          			search+='	<a data-toggle="modal"';
				          			search+='		href="../note/noteDetail.htm?noteNum='+value.noteNum+'&cmd=mynote"';
				          			search+='		data-target="#modal-testNew" role="button" data-backdrop="static">';
				          			search+='		<div class="item">';
				          			search+='			<img class="img-rounded"';
				          			search+='				src="'+value.noteThumnail+'"';
				          			search+='					alt="${noteList.noteTitle}" width="100%">';
				          			search+='			 <div class="caption">';
				          			search+='				<i class="fa fa-plus" aria-hidden="true"></i>';
				          			search+='			</div> ';
				          			search+='		</div>';
				          			search+='		<div>';
				          			search+='		<input type="hidden" id="noteNum" class="noteNum" value="'+value.noteNum+'">';
				          			search+='			<h4>'+value.noteTitle+'</h4>';
				          			search+='			<strong>'+value.userEmail+'</strong> <span> '+value.noteDate+'</span>';
				          			search+='	</div>';
				          			search+='	</a>';
				          			search+='	</div>';
				          			search+='</div>';
				          			$("#searchList").html(search);		
				          		})
				    }
			    	
			    	
			          	
			    },
			    error : function(){
			    	alert("검색 실패");
			    }
					})
	});
	})