$(function() {
	var subjectxAxis = [];
	var subjectyAxis = [];
	var memberxAxis = [];
	var memberyAxis = [];
	var joinMemberxAxis = [];
	var joinMemberyAxis = [];
	
	
	function subject() {
		$.ajax({
			url:"../etc/stateNoteSubject.json",
			dataType:"json",
			success:function(responsedata){
				$.each(responsedata, function(index, obj) {
					console.log(obj);
					subjectxAxis[index] = obj.subjectxAxis;
					subjectyAxis[index] = obj.subjectyAxis;
				})
			
				Highcharts.chart('chartDiv', {
					chart: { type: 'column' },
					title: { text: '주제 별 노트 개수' },
					xAxis: { categories: subjectxAxis },
					yAxis : { title : false, allowDecimals: false },
					colors: ['#f56a6a'],
					legend: false,
					series : [ {
						name : '등록된 게시글 수',
						data : subjectyAxis
					} ]	
				});
			
			
			
			}
		});
		
	}
	
		function makeChart() {
			$.ajax({
				url:"../etc/stateMember.json",
				dataType:"json",
				success:function(responsedata){
					$.each(responsedata, function(index, obj) {
						console.log(obj);
						memberxAxis[index] = obj.memberxAxis;
						memberyAxis[index] = obj.memberyAxis;
					})
					
					Highcharts.chart('chartDiv', {
						title : {
							text : '월별 가입한 회원 수',
						},
						xAxis : {
							categories : memberxAxis
						},
						yAxis : { title : false, min: 0, allowDecimals: false },
						legend : false,
						plotOptions : {
							series : {
								label : false,
							}
						},
						colors: ['#f56a6a'],
						series : [ {
							name : '가입한 회원 수',
							data : memberyAxis
						} ],

						responsive : {
							rules : [ {
								condition : {
									maxWidth : 500
								},
								chartOptions : {
									legend : {
										layout : 'horizontal',
										align : 'center',
										verticalAlign : 'bottom'
									}
								}
							} ]
						}
					});
					
				}
			});
			
			
		}
		
		
		function joinMemberChart() {
			$.ajax({
				url:"../etc/stateJoinMember.json",
				dataType:"json",
				success:function(responsedata){
					$.each(responsedata, function(index, obj) {
						console.log(obj);
						joinMemberxAxis[index] = obj.joinMemberxAxis;
					    joinMemberyAxis[index] = obj.joinMemberyAxis;
					})
					
					
						Highcharts.chart('chartDiv', {
							chart: { type: 'column' },
							title: { text: '유형별 가입 회원 수' },
							xAxis: { categories: joinMemberxAxis },
							yAxis : { title : false,allowDecimals: false },
							colors: ['#f56a6a'],
							legend: false,
							series : [{
								name : '가입한 회원 수',
								data : joinMemberyAxis
							}]	
						});
					
					}
				});
				
			}
					
			
		
		
		
		
	
		
		$('#joinStatistic').click(function(){
			joinMemberChart();
		});
		
		$('#memberStatistic').click(function() {
			makeChart();
		});
		
		$('#noteStatistic').click(function() {
			subject();
		});
		
		makeChart();
		
	})