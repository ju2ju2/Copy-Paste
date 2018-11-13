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
						console.log(obj);
						joinMemberxAxis[index] = obj.joinMemberxAxis;
					    joinMemberyAxis[index] = obj.joinMemberyAxis;
					})
					
					Highcharts.chart('container', {
					    chart: {
					        plotBackgroundColor: null,
					        plotBorderWidth: 0,
					        plotShadow: false
					    },
					    title: {
					        text: 'Browser<br>shares<br>2017',
					        align: 'center',
					        verticalAlign: 'middle',
					        y: 40
					    },
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
					    series: [{
					        type: 'pie',
					        name: 'Browser share',
					        innerSize: '50%',
					        data: [
					            ['Chrome', 58.9],
					            ['Firefox', 13.29],
					            ['Internet Explorer', 13],
					            ['Edge', 3.78],
					            ['Safari', 3.42],
					            {
					                name: 'Other',
					                y: 7.61,
					                dataLabels: {
					                    enabled: false
					                }
					            }
					        ]
					    }]
					});
						/*Highcharts.chart('chartDiv', {
							chart: { type: 'pie' },
							title: { text: '유형별 가입 회원 수' },
							xAxis: { categories: joinMemberxAxis  categories: ['일반회원', '카카오회원', '네이버회원', '구글회원']},
							yAxis : {title : false,allowDecimals: false },
							colors: {color : (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'},
							legend: false,
							series : [{
								name : '가입한 회원 수',
								data : joinMemberyAxis
								
																	
							}]	
						});*/
					
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