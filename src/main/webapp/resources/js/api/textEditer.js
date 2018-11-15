/*
@JS : textEditer.js
@Date : 2018.10.24
@Author : 고은아, 우나연
@Desc : textEditer.js 스크립트
*/

var demoBaseConfig = {
		  selector : "textarea",
		 /*forced_root_block : "",//루트태그 삭제*/
		  branding: false,
		  theme: "modern",
		  resize: false,
		  fontsize_formats: '8pt 10pt 12pt 14pt 18pt 24pt 36pt',
		  automatic_uploads: false,
		  autosave_ask_before_unload: false,
		  paste_data_images: true,
		  content_style: ".wrong {color:red;}",
		  relative_urls : false,//이미지 상대경로 해제
		  remove_script_host : false,//이미지 상대경로 해제
		  powerpaste_allow_local_images:!0,
		  plugins: [
		    " advlist anchor autolink codesample colorpicker fullscreen help image imagetools",
		    " lists link media noneditable preview print ",
		    " searchreplace table textcolor visualblocks wordcount emoticons"
		  ],
		  toolbar:
		    "undo redo | bold italic | fontsizeselect forecolor backcolor codesample | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image | print preview",
		  image_advtab: true,
		  images_upload_base_path: '/resources/upload',
		  document_base_url : '/resources/upload/',
		  images_upload_credentials: true,  
		  file_browser_callback_types: 'file image media',
		  file_picker_callback: function(callback, value, meta) {
		      if (meta.filetype == 'image') {
		        $('#upload').trigger('click');
		        $('#upload').on('change', function() {
		          var file = this.files[0];
		          var reader = new FileReader();
		          reader.onload = function(e) {
		            callback(e.target.result, {
		              alt: ''
		            });
		          };
		          reader.readAsDataURL(file);
		        });
		      }
		    }
		};

	
		tinymce.init(demoBaseConfig);

		