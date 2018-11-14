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
					chart: { type: 'bar' },
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
						joinMemberxAxis[index] = obj.joinMemberxAxis;
					    joinMemberyAxis[index] = obj.joinMemberyAxis;
					})
					Highcharts.chart('chartDiv', {
					    chart: {
					        plotBackgroundColor: null,
					        plotBorderWidth: 0,
					        plotShadow: false
					    },
					    title: {
					        text: '유형 별<br>회원가입 통계<br>2018',
					        align: 'center',
					        verticalAlign: 'middle',
					        y: 40
					    },
					    colors: {color : (Highcharts.theme && Highcharts.theme.contrastTextColor) || '#f56a6a'},
					    tooltip: {
					        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
					    },
					    plotOptions: {
					        pie: {
					            dataLabels: {
					                enabled: true,
					                distance: -50,
					                style: {
					                    fontWeight: 'bold',
					                    color: 'white'
					                }
					            },
					            startAngle: -90,
					            endAngle: 90,
					            center: ['50%', '75%'],
					            size: '110%'
					        }
					    },
					    colors: ['#f56a6a', '#fcce00', '#3ec729', '#4285f4', '#1aadce',
					        '#492970', '#f28f43', '#77a1e5', '#c42525', '#a6c96a'],
					    series: [{
					        type: 'pie',
					        name: 'Browser share',
					        innerSize: '50%',
					        data: [
					            ['일반회원', joinMemberyAxis[0]],
					            ['Kakao', joinMemberyAxis[1]],
					            ['Naver', joinMemberyAxis[2]],
					            ['Google', joinMemberyAxis[3]]
					        ]
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