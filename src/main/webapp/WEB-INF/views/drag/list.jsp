<%-- drag>>
@JSP : list.jsp
@Date : 2018.10.09
@Author : 우나연
@Desc : 드래그목록

@Date : 2018.10.12
@Author : 고은아
@Desc : 휴지통, 별 추가
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="d-container">
<div class="d-inner">
	<!-- Section -->	
	<section>	
		<header class="major">				
		<h3>드래그 목록<i class="fas fa-trash"></i></h3>
		</header>
				<div class="mini-posts">
				<article>
				<div class="icon-right"><i class="far fa-star"></i></div>
					<a href="#" class="image img-rounded"><img
						src="https://images.pexels.com/photos/39811/pexels-photo-39811.jpeg?h=350&auto=compress&cs=tinysrgb"
						alt="" /></a>
				</article>
				<article>
				<div class="icon-right"><i class="far fa-star"></i></div>
					<a href="#" class="image img-rounded"><img
						src="https://images.pexels.com/photos/39811/pexels-photo-39811.jpeg?h=350&auto=compress&cs=tinysrgb"
						alt="" /></a>
				</article>
				<article>
				<div class="icon-right"><i class="far fa-star"></i></div>
					<a href="#" class="image img-rounded"><img
						src="https://images.pexels.com/photos/39811/pexels-photo-39811.jpeg?h=350&auto=compress&cs=tinysrgb"
						alt="" /></a>
				</article>
				<article>
				<div class="icon-right"><i class="far fa-star"></i></div>
					<a href="#" class="image img-rounded"><img
						src="https://images.pexels.com/photos/39811/pexels-photo-39811.jpeg?h=350&auto=compress&cs=tinysrgb"
						alt="" /></a>
				</article>
			</div>
		</section>
</div>
</div>




<script type="text/javascript">

	$('#dragTrash').droppable( {
		// 펑션으로 ajax 이용해서 데이터 삭제되고 시각적으로 새로운 데이터 불러오는 식의 처리해야함		
	      } 
	);

	// 드래그 div들 제어, 마우스로 끌고 다니기 가능하고 드롭 가능 영역 외 위치가 되면 제자리로 돌아온다.
	$('.blog').draggable({
		revert: true
	});
	
	<!-- 별 아이콘 토글 -->
	$('.fa-star').click(function(){
		if($(this).hasClass('far')){
			$(this).removeClass('far').addClass('fas');
		} else {
			$(this).removeClass('fas').addClass('far');
		}
	})

</script>
