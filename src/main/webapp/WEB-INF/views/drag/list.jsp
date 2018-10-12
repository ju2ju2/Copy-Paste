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
<script type="text/javascript">
$(function() {
	$('.starSpan').click(function() {
		if($(this).find('i').hasClass("far")){
			$(this).find('i').removeClass("far").addClass("fas");
		} else {
			$(this).find('i').removeClass("fas").addClass("far");
		}
	});
})
</script>


<div class="container"><br/>
	<header class="major">
	<div class="row">
		<h3>드래그 목록 <span id="dragTrash"><i class="fas fa-trash"></i></span></h3>
	</div>
	</header>
	<div class="row">
		<div class="col-sm-3 blog">
			<div class="starDiv"><span class="starSpan" id="starSpan1"><i class="far fa-star"></i></span></div>
			<div class="card text-center">
				<img class="card-img-top img-rounded"
					src="https://images.pexels.com/photos/39811/pexels-photo-39811.jpeg?h=350&auto=compress&cs=tinysrgb"
					alt="" width="100%">
				<div class="card-block">
					<h4>가을에 쓴 편지</h4>
					<span>음담패썰</span> <span>2018.08.30</span>
				</div>
			</div>
		</div>
		<div class="col-sm-3 blog">
		<div class="starDiv"><span class="starSpan" id="starSpan2"><i class="far fa-star"></i></span></div>
			<div class="card text-center">
				<img class="card-img-top img-rounded"
					src="https://images.pexels.com/photos/39811/pexels-photo-39811.jpeg?h=350&auto=compress&cs=tinysrgb"
					alt="" width="100%">
				<div class="card-block">
					<h4>가을에 쓴 편지</h4>
					<span>음담패썰</span> <span>2018.08.30</span>
				</div>
			</div>
		</div>
		<div class="col-sm-3 blog">
		<div class="starDiv"><span class="starSpan" id="starSpan3"><i class="far fa-star"></i></span></div>
			<div class="card text-center">
				<img class="card-img-top img-rounded"
					src="https://images.pexels.com/photos/39811/pexels-photo-39811.jpeg?h=350&auto=compress&cs=tinysrgb"
					alt="" width="100%">
				<div class="card-block">
					<h4>가을에 쓴 편지</h4>
					<span>음담패썰</span> <span>2018.08.30</span>
				</div>
			</div>
		</div>
		<div class="col-sm-3 blog">
		<div class="starDiv"><span class="starSpan" id="starSpan4"><i class="far fa-star"></i></span></div>
			<div class="card text-center">
				<img class="card-img-top img-rounded"
					src="https://images.pexels.com/photos/39811/pexels-photo-39811.jpeg?h=350&auto=compress&cs=tinysrgb"
					alt="" width="100%">
				<div class="card-block">
					<h4>가을에 쓴 편지</h4>
					<span>음담패썰</span> <span>2018.08.30</span>
	</div></div></div>
</div>

	<br>
	<div class="row">
		<div class="col-sm-3 blog">
		<div class="starDiv"><span class="starSpan" id="starSpan5"><i class="far fa-star"></i></span></div>
			<div class="card text-center">
				<img class="card-img-top img-rounded"
					src="https://images.pexels.com/photos/39811/pexels-photo-39811.jpeg?h=350&auto=compress&cs=tinysrgb"
					alt="" width="100%">
				<div class="card-block">
					<h4>가을에 쓴 편지</h4>
					<span>음담패썰</span> <span>2018.08.30</span>
				</div>
			</div>
		</div>
		<div class="col-sm-3 blog">
		<div class="starDiv"><span class="starSpan" id="starSpan6"><i class="far fa-star"></i></span></div>
			<div class="card text-center">
				<img class="card-img-top img-rounded"
					src="https://images.pexels.com/photos/39811/pexels-photo-39811.jpeg?h=350&auto=compress&cs=tinysrgb"
					alt="" width="100%">
				<div class="card-block">
					<h4>가을에 쓴 편지</h4>
					<span>음담패썰</span> <span>2018.08.30</span>
				</div>
			</div>
		</div>
		<div class="col-sm-3 blog">
		<div class="starDiv"><span class="starSpan"><i class="far fa-star"></i></span></div>
			<div class="card text-center">
				<img class="card-img-top img-rounded"
					src="https://images.pexels.com/photos/39811/pexels-photo-39811.jpeg?h=350&auto=compress&cs=tinysrgb"
					alt="" width="100%">
				<div class="card-block">
					<h4>가을에 쓴 편지</h4>
					<span>음담패썰</span> <span>2018.08.30</span>
				</div>
			</div>
		</div>
		<div class="col-sm-3 blog">
		<div class="starDiv"><span class="starSpan"><i class="far fa-star"></i></span></div>
			<div class="card text-center">
				<img class="card-img-top img-rounded"
					src="https://images.pexels.com/photos/39811/pexels-photo-39811.jpeg?h=350&auto=compress&cs=tinysrgb"
					alt="" width="100%">
				<div class="card-block">
					<h4>가을에 쓴 편지</h4>
					<span>음담패썰</span> <span>2018.08.30</span>
				</div>
			</div>
		</div>
</div>
<br>
</div>






