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
               class="writeNoteNavBtn"  id="writeSearch"> <i class="fas fa-search icon-li"></i></a></li>
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
                           <option value="dragNumDesc">최신순</option>
                              <option value="dragNumAsc">오래된 순</option>
                              <option value="dragMark">중요표시 있는 순</option>
                                  <option value="binary(dragText)">가나다순</option>
                                <option value="">전체보기</option>
                           </select>
                     </div>
                     <!-- 드래그검색 -->
                     <section id="subject-search" class="alt">
                        <div class="col-xs-12">
                           <form method="post" action="#">
                              <input type="text" id="search-text" placeholder="검색" /> <a
                                 href="#"><i id="searchdrag" class="fas fa-search icon-size"
                                 style="padding-top: 15px"></i></a>
                           </form>
                        </div>
                     </section>
                  </div>
               </div>
               <section>
                  <br>
                  <header class="major" id="droppable">
                     <h2>
                        드래그 목록<i class="fas fa-trash icon-size"></i>
                     </h2>
                  </header>
                  <!-- 드래그목록 -->
                  <div class="mini-posts" id="dragList"></div>
                   <button type="button" class="btn topBtn" >
                    <i class="fas fa-caret-up"  title="Go to top" ></i>
                  </button>
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
                           <form method="get" action="#">
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
               <div id="modal-testNew" class="modal fade text-center overlay" role="dialog">
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
                    
                    <input type="hidden" id="subjectName" value="${subjectName}">
							<div class="col-xs-12">
								<select name="subject-category" id="subject-category">
									<option value="all">- 주제 선택 -</option>
									<option value="기타">기타</option>
									<option value="회사">회사</option>
									<option value="생활">생활</option>
									<option value="교육">교육</option>
								</select>
							</div>
                   		  <!-- Search -->
                        <div class="col-xs-12">
                           <section id="subject-search" class="alt">    
                           <form method="get" action="#">
                              <input type="text" id="search-text-write" placeholder="검색어를 입력해주세요" required /> <a
                                 href="#"><i id="searchWriteSite" class="fas fa-search icon-size"
                                 style="padding-top: 15px"></i></a>
                           </form>
                           </section>
                        </div>
                     
                   </div>
                </div>       
                    
                    	<!-- Radio -->
							<div class="radio">
								<form method="post" action="#" id="radiotag">
									<input type="radio" id="radio-sub" name="boundary" value="제목"
										checked> <label for="radio-sub">제목</label> <input
										type="radio" id="radio-content" value="내용" name="boundary">
									<label for="radio-content">내용</label> <input type="radio"
										id="radio-sub-content" value="제목+내용" name="boundary">
									<label for="radio-sub-content">제목+내용</label>
								</form>
							</div>
					                    
                        
                        <!-- Section -->
						<section id="droppable">
							<header class="major">
								<h3>검색결과</h3>
							</header>
					
                        <!-- 사이트 내 검색결과 보기 리스트 -->
                        <div class="mini-posts" id="searchList"></div>
						 <!-- 노트상세보기 모달 -->
               			<div id="modal-testNew1" class="modal fade text-center overlay" role="dialog">
		                  	<div class="modal-dialog">
		                    <div class="modal-content">Content will be loaded here from "note/noteDetail.htm" file</div>
	                  	   </div>
               			</div> 
               		
               			</section>
   			    
                     
                     <span id="writeNoteNavSizeBtnSpanSeachInSite">
	                 	 <button type="button" class="btn searchBtn">
	                     <i class="fas fa-angle-double-right writeNoteNavSizeBtn "></i>
	               	   </button>
	                 	 <br>
	                   <button type="button" class="btn topBtn" >
	                    <i class="fas fa-caret-up"  title="Go to top" ></i>
	                  </button>
              		 </span>
 
   				</div>
           
           
           
           
           
           
            <!-- 4. 포털 검색 -->
            <div id="portalSearch" class="tab-pane fade searchDiv">
               <div class="row">
                  <div class="form-group">
                     <!-- Search -->
                     <section id="subject-search" class="alt">
                        <div class="col-xs-12">
                         <script>
                                           /* 구글검색 스크립트 */
                           (function() {
								    var cx = '008735657841569968312:-xk9eqqghzs';
								    var gcse = document.createElement('script');
								    gcse.type = 'text/javascript';
								    gcse.async = true;
								    gcse.src = 'https://cse.google.com/cse.js?cx=' + cx;
								    var s = document.getElementsByTagName('script')[0];
								    s.parentNode.insertBefore(gcse, s);
 							     })();
						</script>
						<gcse:search></gcse:search>
                         
                   
                        </div>
                     </section>

                  </div>
               </div>
               <span id="writeNoteNavSizeBtnSpanSeachPortal">
                  <button type="button" class="btn btn-danger searchBtn">
                     <i class="fas fa-angle-double-right writeNoteNavSizeBtn"></i>
                  </button>
                   <button type="button" class="btn topBtn" >
	                    <i class="fas fa-caret-up"  title="Go to top" ></i>
	               </button>
               </span>
            </div>
         </div>
      </div>
   </div>
</nav>

