var demoBaseConfig = {
		  selector: "textarea",
		  branding: false,
		  theme: "modern",
		  resize: false,
		  automatic_uploads: false,
		  autosave_ask_before_unload: false,
		  paste_data_images: true,
		  powerpaste_allow_local_images:!0,
		  plugins: [
		    "advcode advlist anchor autolink codesample colorpicker fullscreen help image imagetools",
		    " lists link media noneditable powerpaste preview print ",
		    " searchreplace table textcolor visualblocks wordcount emoticons"
		  ],
		  toolbar:
		    "undo redo | bold italic | forecolor backcolor codesample | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image | print preview",
		  image_advtab: true,
		  images_upload_base_path: '/resources/upload',
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

