$(function() {

      $('.searchBtn').click(
            function() {
               if ($('#sidebar').css('width') == '400px') {
                  $('#sidebar').css('width', '1120px');
                  $('#sidebar').addClass('col-sm-10');
                  $('.writeNoteNavSizeBtn').removeClass('fa-angle-double-right').addClass(
                              'fa-angle-double-left');
               } else {
                  $('#sidebar').css('width', '400px');
                  $('#sidebar').removeClass('col-sm-10');
                  $('.writeNoteNavSizeBtn').removeClass('fa-angle-double-left')
                        .addClass('fa-angle-double-right');
               }
            });

      $('.writeNoteNavBtn').click(
            function() {
               $('#sidebar').css('width', '400px');
               $('#sidebar').removeClass('col-sm-10');
               $('.writeNoteNavSizeBtn').removeClass('fa-angle-double-left')
                        .addClass('fa-angle-double-right');
            });
   })