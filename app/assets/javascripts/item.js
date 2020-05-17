$(function () {
  var id = 1;
  $('body').on('change', '#upload_file', function(e){
    var filesArray = $('.item_images_hidden').val().split(',');
    var target = e.target;
    if (filesArray[0] === "") {
      filesArray.splice(0, 1);
    }
    var reader = new FileReader();
    
    reader.onload = function(e){
      $(target).closest('.prepend_area').prepend(`
      <div class="select_image" data-id=${id-1} data-lightbox="abc">
        <a href="${e.target.result}" data-lightbox="group">
          <img src=${e.target.result} id="image_preview" width="300">
        </a>
        <p><a href="#">編集</a></p>
        <p><a class="remove_image">削除</a></p>
    </div>
  `);
      var imagesLength = $('.select_image').length;
      
      $(target).closest('.pre-content').css('width', `calc(100% - ${20 * (imagesLength % 5)}%)`);
    }
    reader.readAsDataURL(target.files[0]);
    
    $(target).closest('.pre-content').append(`<input id="upload_file" class="upload_files", accept="image/png, image/jpeg, image/gif" type="file" name="item[images][]" data-id="${id + 1}">`);
    $(target).css('width', '0px');

    filesArray.push(id);
    $('.item_images_hidden').val(filesArray);
    
    var filesArray = $('.item_images_hidden').val().split(',');
    var imagesLength = $('.select_image').length;
    // $(document).on('DOMSubtreeModified propertychange', function(){

    //   if (imagesLength + 1 === 4) {
    //     $('.pre-content').children('p').html('<i class="fas fa-camera"></i>');
    //   } else if (imagesLength + 1 === 5) {
    //     $(target).closest('.pre-content').css('display', 'none');
    //   } else{
    //     $('.pre-content').children('p').html('<p>クリックをしてアップロード</p>');
    //   }
    // }


    switch (imagesLength + 1 ) {
      
      case 4: $('.pre-content').children('p').html('<i class="fas fa-camera"></i>');
      break;

      case 5: $(target).closest('.pre-content').css('display', 'none');
              // $('.under_area .image_file_area').css('display', 'block');
              // $('.under_area .image_file_area').css('width', '100%');
              // $('.under_area .image_file_area').append(`<input multiple="multiple" id="upload_file" class="upload_files", accept="image/png, image/jpeg, image/gif" type="file" name="item[images][]" data-id="${id + 1}">`);
      //   break;
      // case 10: $(target).closest('.image_file_area').css('display', 'none');     
        break;
    }
    $('body').on('click', '.remove_image', function(){
      if (imagesLength + 1  < 4){
        $('.pre-content').children('p').html('<p>クリックをしてアップロード</p>');
      };
    })


  id++;
  
  });

  $('body').on('click', '.remove_image', function () {
    // if ($('.select_image').length  < 4){
    //   $('.pre-content').children('p').html('<p>クリックをしてアップロード</p>');
    // };
    var filesArray = $('.item_images_hidden').val().split(',');
    var id = $(this).closest('.select_image').data('id');

    // 選択されたidとfilesArrayの要素が一致すればfilesArrayから削除
    $.each(filesArray, function (index, file) {
      if(id === Number(file)){
        filesArray.splice(index, 1);
      };
      // .item_images_hiddenのval()を更新
      $('.item_images_hidden').val(filesArray);
    });


    // 選択されたidを持つinput[type="file"]を削除
    $('.upload_files').each(function (index, element) {
      if(!$(element).data('id')){
       return true;
      }     
      if($(element).data('id') === Number(id)) {
        $(element).remove();
      }
    });

    // .select_imageを削除
    $(this).closest('.select_image').remove();

    var filesArray = $('.item_images_hidden').val().split(',');
    var imagesLength = $('.select_image').length;
    // .image_file_areaの幅を調整
    if(imagesLength == 5) {
      // $('.pre-content').css('dispplay', "hidden");
      if (imagesLength === 4) {
        var fileField = $('.upload_files');
        fileField.remove();
        $('.pre-content:first').append(fileField);

      }
      $('.prec-ontent:last').css('display', 'none');
      $('.pre-content:first').css('display', 'block').css('width', `calc(100% - ${20 * (imagesLength % 5)}%)`);
    } else {
      var width = $('.pre-content:last').css('width');
      
      $('.pre-content:last').css('display', 'block').css('width', `calc(100% - ${20 * (imagesLength % 5)}%)`);
    }
    
  });
});
