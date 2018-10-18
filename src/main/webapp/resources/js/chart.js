$(function() {
	var subjectxAxis = [];
	var subjectyAxis = [];
	
			$.ajax({
				url:"../etc/stateNoteSubject.json",
				dataType:"json",
				success:function(responsedata){
					$.each(responsedata, function(index, obj) {
						subjectxAxis[index] = obj.xAxis;
						subjectyAxis[index] = obj.yAxis;
					})
				}
			});
		
		function makeChart() {
			Highcharts.chart('chartDiv', {
				title : {
					text : '달별 가입한 회원 수',
				},
				xAxis : {
					categories : [ 'Jan', 'Feb', 'Mar', 'Apr',
							'May', 'Jun', 'Jul', 'Aug', 'Sep',
							'Oct', 'Nov', 'Dec' ]
				},
				yAxis : { title : false },
				legend : false,
				plotOptions : {
					series : {
						label : false,
					}
				},
				colors: ['#f56a6a'],
				series : [ {
					name : '가입한 회원 수',
					data : [ 10, 20, 30, 1, 3, 4, 2, 10, 25, 1, 4, 10 ]
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
		
		makeChart();
	
		$('#memberStatistic').click(function() {
			makeChart();
		});
		
		$('#noteStatistic').click(function() {
			$('#chartDiv').empty();
			Highcharts.chart('chartDiv', {
				chart: { type: 'column' },
				title: { text: '주제 별 노트 개수' },
				xAxis: { categories: subjectxAxis },
				yAxis : { title : false },
				colors: ['#f56a6a'],
				tooltip: {},
				legend: false,
				series : [ {
					name : '등록된 게시글 수',
					data : subjectyAxis
				} ]	
			});
			
		});
		
	})