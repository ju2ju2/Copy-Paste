$(function() {
		var leftNoteWriteNavDiv = $('#writeNoteNavDiv');
		var writeNoteNavSizeBtn = $('.writeNoteNavSizeBtn');

		$('.searchBtn').click(
				function() {
					if (leftNoteWriteNavDiv.hasClass('col-sm-3')) {
						leftNoteWriteNavDiv.removeClass('col-sm-3').addClass(
								'col-sm-10');
						writeNoteNavSizeBtn
								.removeClass('fa-angle-double-right').addClass(
										'fa-angle-double-left');
						$('#portalSearch').css('width', '1120px');
						$('#inSiteSearch').css('width', '1120px');
					} else {
						leftNoteWriteNavDiv.removeClass('col-sm-10').addClass(
								'col-sm-3');
						writeNoteNavSizeBtn.removeClass('fa-angle-double-left')
								.addClass('fa-angle-double-right');
						$('#portalSearch').css('width', '');
						$('#inSiteSearch').css('width', '');
					}
				});

		$('.writeNoteNavBtn').click(
				function() {
					if (leftNoteWriteNavDiv.hasClass('col-sm-10')) {
						leftNoteWriteNavDiv.removeClass('col-sm-10').addClass(
								'col-sm-3');
						writeNoteNavSizeBtn.removeClass('fa-angle-double-left')
								.addClass('fa-angle-double-right');
						$('#portalSearch').css('width', '');
						$('#inSiteSearch').css('width', '');
					}
				});
	})