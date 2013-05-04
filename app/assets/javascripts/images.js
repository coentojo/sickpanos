$(function () {
    $('#new_image').fileupload({
        dataType: 'script',
        add: function (e, data) {
	      	types = /(\.|\/)(gif|jpe?g|png)$/i;
	      	file = data.files[0];
			
	      	if (types.test(file.type) || types.test(file.name)) {
            	data.context = 	$('<div class="upload">Uploading '+file.name+'<div class="progress"><div class="bar" style="width: 0%"></div></div></div>').appendTo("#new_image");
            	data.submit();
			}
			else {
				alert(file.name + " is not a gif, jpeg, or png image file.");
			}
        },
        progress: function (e, data) {
        	progress = parseInt(data.loaded / data.total * 100, 10)
        	data.context.find('.bar').css('width', progress + '%')      
		},
		done: function(e, data) {
			data.context.find('.bar').remove();
			data.context.find('.progress').remove();
			data.context.text("Done!");
		}

    });
	
  $("#bg").height(window.innerHeight);

  $("#sudo_click").click(function(){
		$("#hide_input").click();
		$("#sudo_click").text("");
  });

  $("#thumbsup").click(function(){
		alert('like!');
  });

});

