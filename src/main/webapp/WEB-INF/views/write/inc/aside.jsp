<!-- 
* @ jsp : aside.jsp (write)
* @ Date : 2018.10.11
* @ Author : 고은아, 임효진(aside(탭 제외))
* @ Desc : 노트 작성을 위해 들어오는 페이지 내 좌측 네브
 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Sidebar -->
<nav class="sidebarfixed">
	<div id="sidebar">
		<div class="inner">

			<!-- 탭 -->
			<ul class="nav nav-tabs nav-justified" id="writeNoteNavUl">
				<li class="active"><a data-toggle="tab" href="#drag"
					class="writeNoteNavBtn"> <i
						class="fas fa-mouse-pointer icon-li"></i></a></li>
				<li><a data-toggle="tab" href="#myNote" class="writeNoteNavBtn">
						<i class="fas fa-sticky-note icon-li"></i>
				</a></li>
				<li><a data-toggle="tab" href="#inSiteSearch"
					class="writeNoteNavBtn"> <i class="fas fa-search icon-li"></i></a></li>
				<li><a data-toggle="tab" href="#portalSearch"
					class="writeNoteNavBtn"> <i class="fab fa-google icon-li"></i></a></li>
			</ul>
			<div class="mb"></div>
			<!-- 탭 내용 -->
			<div class="tab-content">
				<!-- 1. 드래그 목록 -->
				<div id="drag" class="tab-pane fade in active">
					<div class="row">
						<div class="form-group">
							<!-- 드래그정렬 -->
							<div class="col-xs-12">
								<select name="sort-category" id="sort-category">
									<option value="">- 정렬 분류 -</option>
									<option value="1">최신순</option>
									<option value="1">오래된 순</option>
									<option value="1">중요표시 있는 순</option>
									<option value="1">전체보기</option>
								</select>
							</div>
							<!-- 드래그검색 -->
							<section id="subject-search" class="alt">
								<div class="col-xs-12">
									<form method="post" action="#">
										<input type="text" id="search-text" placeholder="검색" /> <a
											href="#"><i id="search" class="fas fa-search icon-size"
											style="padding-top: 15px"></i></a>
									</form>
								</div>
							</section>
						</div>
					</div>
					<section>
						<br>
						<header class="major">
							<h2>
								드래그 목록<i class="fas fa-trash icon-size"></i>
							</h2>
						</header>
						<!-- 드래그목록 -->
						<div class="mini-posts" id="dragList"></div>
					</section>
				</div>

				<!-- 2. 마이노트 -->
				<div id="myNote" class="tab-pane fade">
					<div class="row">
						<div class="form-group">
							<!-- 노트정렬 -->
							<div class="col-xs-12">
								<select name="sort-category" id="sort-category" class="w-90">
									<option value="">- 정렬 분류 -</option>
									<option value="1">최신순</option>
									<option value="1">오래된 순</option>
									<option value="1">중요표시 있는 순</option>
									<option value="1">전체보기</option>
								</select>
							</div>
							<!-- 노트검색 -->
							<section id="subject-search" class="alt">
								<div class="col-xs-12">
									<form method="post" action="#">
										<input type="text" id="search-text" placeholder="검색" /> <a
											href="#"><i id="search" class="fas fa-search icon-size"
											style="padding-top: 15px"></i></a>
									</form>
								</div>
							</section>
						</div>
					</div>
					<section>
						<br>
						<header class="major">
							<h2>
								노트 폴더 목록
							</h2>
						</header>

						<!-- 폴더목록,노트목록 -->	
						<div id="asideFolderList"></div>
	
					<!-- 노트상세보기 모달 -->
					<div id="modal-testNew" class="modal fade text-center overlay"
						 role="dialog">
						<div class="modal-dialog">
							<div class="modal-content">Content will be loaded here from
								"note/noteDetail.htm" file</div>
						</div>
					</div>

					</section>
				</div>
				<!-- 3. 사이트 검색 -->
				<div id="inSiteSearch" class="tab-pane fade searchDiv">
					<div class="row">
						<div class="form-group">
							<!-- Search -->
							<section id="subject-search" class="alt">
								<div class="col-xs-12">
									<form method="post" action="#">
										<input type="text" id="search-text" placeholder="검색" /> <a
											href="#"><i id="search" class="fas fa-search icon-size"
											style="padding-top: 15px"></i></a>
									</form>
								</div>
							</section>
						</div>
					</div>
					<button type="button" class="btn btn-secondary searchBtn">
						<i class="fas fa-angle-double-right writeNoteNavSizeBtn"></i>
					</button>
				</div>

				<!-- 4. 포털 검색 -->
				<div id="portalSearch" class="tab-pane fade searchDiv">
					<div class="row">
						<div class="form-group">
							<!-- Search -->
							<section id="subject-search" class="alt">
								<div class="col-xs-12">
									<form method="post" action="#">
										<input type="text" id="search-text" placeholder="검색" /> <a
											href="#"><i id="search" class="fas fa-search icon-size"
											style="padding-top: 15px"></i></a>
									</form>
								</div>
							</section>

						</div>
					</div>
					<button type="button" class="btn btn-secondary searchBtn">
						<i class="fas fa-angle-double-right writeNoteNavSizeBtn icon-size"></i>
					</button>
				</div>
			</div>
		</div>
	</div>
</nav>

<script>

	/* 폴더 아코디언 */
	var acc = document.getElementsByClassName("accordion");
	var i;

	for (i = 0; i < acc.length; i++) {
		acc[i].addEventListener("click", function() {
			this.classList.toggle("a-active");
			var panel = this.nextElementSibling;
			if (panel.style.maxHeight) {
				panel.style.maxHeight = null;
			} else {
				panel.style.maxHeight = panel.scrollHeight + "px";
			}
		});
	}

	/* 스크랩 아이콘 토글  */
	$('.fa-bookmark').click(function() {
		if ($(this).hasClass("far")) {
			$('.fa-bookmark').removeClass("fas").addClass("far");
			$(this).removeClass("far").addClass("fas");
		}
	})
	
	<!-- 별 아이콘 토글 -->
	$('.fa-star').click(function(){
		if($(this).hasClass('far')){
			$(this).removeClass('far').addClass('fas');
		} else {
			$(this).removeClass('fas').addClass('far');
		}
	})

	
	<!--드래그목록-->
	$.ajax({
		      url: "${pageContext.request.contextPath}/drag/selectAllDrag.json", // url_pettern 
		      type:"POST",
		      dataType:"json",//서버에서 응답하는 데이터 타입(xml,json,script,html)
		      success:function(data){
		    	  var a = "";
		        	if(data != null) {
		        		$.each(data, function(key, value){
		        			$('#dragList').empty();
		                	a += '<div class="text-center dragDiv mt-10" id="dragDiv">';
		                	a += '<blockquote class="grapefruit">';
		                	a += '<div class="dragContent">';
		                	a += '<!-- 별 아이콘 -->';
		                	a += '<div class="icon-right starDiv">	<br>';
		                	a += '<i class="far fa-star icon-size"></i>';
		                	a += '</div>';
		            		a += '<!-- 모달 창 -->';
		                	a += '<div class="drag-a">';
		                	a += '<p class="mt-10" class="dragText" id="dragText">'+value.dragText+'</p> <code>';
		                	a += '&lt;출처 : <span class="Cgrapefruit">'+value.dragOrigin+'</span>&gt; ';
		                	a += '<span>'+value.dragDate+'</span>';
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
		            
		            <!-- 드래그 클릭시 텍스트 에디터기에 추가-->
		        	$('.dragDiv').on("click",function(){
		        		var editor = tinyMCE.activeEditor;
		    			var dragText = $(this).find('#dragText').text();
		    			editor.dom.add(editor.getBody(), 'p', {}, dragText+ "<br>");
		    		})
		      }
		 })

		 
	//노트 드래그 가능, 마우스로 끌고 다니기 가능하고 드롭 가능 영역 외 위치가 되면 제자리로 돌아온다.
    $('.asideNoteDiv').draggable({
    	revert: true, 
    	 revertDuration: 200,
    	 snapMode: "inner",
    	 scroll: true,
    	 scrollSensitivity: 100 ,
    	 scrollSpeed: 100
    	});
	
		 
	//노트 탭 폴더목록 추가 //노트 리스트 
	$.ajax({
      url: "${pageContext.request.contextPath}/folder/selectAllFolder.json", // url_pettern 
      type:"POST",
      dataType:"json",//서버에서 응답하는 데이터 타입(xml,json,script,html)
      success:function(data){
    	 var a = "";
      	 if(data != null) {
      		$.each(data, function(key, value){
      			$('#asideFolderList').empty();	
      			a += '<div class="row" class="accordion" alt="'+value.folderName+'"><div class="col-xs-10 pt"> <h5 class="accordion asideFolderName" id="asideFolderName">'+value.folderName+'</h5>'
      			a += '</div><div class="col-xs-2 panel-margin">	<i class="far fa-bookmark icon-size"></i>'
      			a += '</div><div class="row"><div id="asideNoteList"></div></div></div>';
      		});
      	}
			$("#asideFolderList").html(a);
       }
    }).done(function (result) {
    	$('.asideFolderName').click(function(){
    		$.ajax({
    		      url: "${pageContext.request.contextPath}/note/selectByFolderNote.json", // url_pettern 
    		      type:"POST",
    		      data: {'folderName':$(this).text()},
    		      dataType:"json",
    		      success:function(data){
    		    	 console.log(data)
    		      	 if(data != null) {
    		      		var aa = "";
    		      		$.each(data, function(key, value){
    		      			$('#asideNoteList').empty();	
    		      			aa+='<div class="col-xs-12 asideNoteDiv">'
    		      			aa+='<div class="text-center asideNoteDiv">'
    		      			aa+='<!-- a HTML (to Trigger Modal) -->'
    		      			aa+='<a data-toggle="modal"'
    		      			aa+='href="${pageContext.request.contextPath}/note/noteDetail.htm?noteNum='+value.noteNum+'&cmd=mynote"'
    		      			aa+='data-target="#modal-testNew" role="button" data-backdrop="static">'
    		      			aa+='<div class="item">'
    		      			aa+='<img class="img-rounded"'
    		      			aa+='src="'+value.noteThumnail+'"'
    		      			aa+='alt="'+value.noteTitle+'" width="100%">'
    		      			aa+='<div class="caption">'
    		      			aa+='<i class="fa fa-plus" aria-hidden="true"></i>'
    		      			aa+='</div>'
    		      			aa+='</div>'
    		      			aa+='<div>'
    		      			aa+='<h4>'+value.noteTitle+'</h4>'
    		      			aa+='<strong>'+value.userNick+'</strong><span>'+value.noteDate+'</span>'
    		      			aa+='</div>'
    		      			aa+='</a>'
    		      			aa+='</div>'
    		      			aa+='</div>'
    		      			$("div[alt='"+value.folderName+"']").find("#asideNoteList").html(aa);
    		      		});

    		      	}
    		      
    		       }
    		    })
    	}) 
    	
	}) 
	
	<!-- 폴더명 클릭시 노트 조회 -->

	
	
		 
		 
</script>