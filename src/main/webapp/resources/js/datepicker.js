
	$(function() {
		fromDate = $("#fromDate").datepicker({
			dateFormat : "yy-mm-dd",
			defaultDate : "+1w",
			changeMonth : true,
			numberOfMonths : 1
		}).on("change", function() {
			toDate.datepicker("option", "minDate", getDate(this));
		}), toDate = $("#toDate").datepicker({
			dateFormat : "yy-mm-dd",
			defaultDate : "+1w",
			changeMonth : true,
			numberOfMonths : 1
		}).on("change", function() {
			fromDate.datepicker("option", "maxDate", getDate(this));
		});

		function getDate(element) {
			var date;
			try {
				date = $.datepicker.parseDate("yy-mm-dd", element.value);
			} catch (error) {
				date = null;
			}

			return date;
		}
	});
