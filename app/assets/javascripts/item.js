$(function (){
  function buildFileField(index) {
    html = `<input class= "js-file" type= "file"name="item[item_images_attributes][${index}][src]" id="item_item_images_attributes_${index}_src">
              <div class="js-remove">削除</div>
            </div>`;  
    return html;
  };
// file_fieldのnameに動的なindexをつける為の配列
let fileIndex = [1,2,3,4,5,6,7,8,9,10];

  $("body").on('change', '.js-file', function(){
    $(".prepend_area").append(buildFileField(fileIndex[0]));
    fileIndex.shift();
    // 末尾の数に1足した数を追加する
    fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
    return false;

  })




})






// $(function () {
//   var id = 1;
//   $('body').on('change', '#upload_file', function(e){
//     var filesArray = $('.item_images_hidden').val().split(',');
//     var target = e.target;
//     if (filesArray[0] === "") {
//       filesArray.splice(0, 1);
//     }
//     var reader = new FileReader();
    
//     reader.onload = function(e){
//       $(target).closest('.prepend_area').prepend(`
//         <div class="select_image" data-id=${id-1} data-lightbox="abc">
//           <a href="${e.target.result}" data-lightbox="group">
//             <img src=${e.target.result} id="image_preview" width="300">
//           </a>
//             <p><a href="#">編集</a></p>
//             <p><a class="remove_image">削除</a></p>
//         </div>
//       `);
//       var imagesLength = $('.select_image').length;
      
//       $(target).closest('.pre-content').css('width', `calc(100% - ${20 * (imagesLength % 5)}%)`);
//     }
//     reader.readAsDataURL(target.files[0]);
    
//     $(target).closest('.pre-content').append(`<input id="upload_file" class="upload_files", accept="image/png, image/jpeg, image/gif" type="file" name="item[images][]" data-id="${id + 1}">`);
//     $(target).css('width', '0px');

//     filesArray.push(id);
//     $('.item_images_hidden').val(filesArray);
    
//     var filesArray = $('.item_images_hidden').val().split(',');
//     var imagesLength = $('.select_image').length;
//     var defualtImageText =  $('.pre-content').children('p').html('<p>クリックをしてアップロード</p>');
    // $(document).on('DOMSubtreeModified propertychange', function(){

    //   if (imagesLength + 1 === 4) {
    //     $('.pre-content').children('p').html('<i class="fas fa-camera"></i>');
    //   } else if (imagesLength + 1 === 5) {
    //     $(target).closest('.pre-content').css('display', 'none');
    //   } else{
    //     $('.pre-content').children('p').html('<p>クリックをしてアップロード</p>');
    //   }
    // }

    // )

    // switch (imagesLength + 1 ) {
      
    //   case 4: $('.pre-content').children('p').html('<i class="fas fa-camera"></i>');
    //   break;

    //   case 5: $(target).closest('.pre-content').css('display', 'none');
              // $('.under_area .image_file_area').css('display', 'block');
              // $('.under_area .image_file_area').css('width', '100%');
              // $('.under_area .image_file_area').append(`<input multiple="multiple" id="upload_file" class="upload_files", accept="image/png, image/jpeg, image/gif" type="file" name="item[images][]" data-id="${id + 1}">`);
      //   break;
      // case 10: $(target).closest('.image_file_area').css('display', 'none');     
  //       break;
  //   }
  //   $('body').on('click', '.remove_image', function(){
  //     if (imagesLength + 1  < 4){
  //       $('.pre-content').children('p').html('<p>クリックをしてアップロード</p>');
  //     };
  //   })


  // id++;
  
  // });

//   $('body').on('click', '.remove_image', function () {
//     // if ($('.select_image').length  < 4){
//     //   $('.pre-content').children('p').html('<p>クリックをしてアップロード</p>');
//     // };
//     var filesArray = $('.item_images_hidden').val().split(',');
//     var id = $(this).closest('.select_image').data('id');

//     // 選択されたidとfilesArrayの要素が一致すればfilesArrayから削除
//     $.each(filesArray, function (index, file) {
//       if(id === Number(file)){
//         filesArray.splice(index, 1);
//       };
//       // .item_images_hiddenのval()を更新
//       $('.item_images_hidden').val(filesArray);
//     });


//     // 選択されたidを持つinput[type="file"]を削除
//     $('.upload_files').each(function (index, element) {
//       if(!$(element).data('id')){
//        return true;
//       }     
//       if($(element).data('id') === Number(id)) {
//         $(element).remove();
//       }
//     });

//     // .select_imageを削除
//     $(this).closest('.select_image').remove();

//     var filesArray = $('.item_images_hidden').val().split(',');
//     var imagesLength = $('.select_image').length;
//     // .image_file_areaの幅を調整
//     if(imagesLength == 5) {
//       // $('.pre-content').css('dispplay', "hidden");
//       if (imagesLength === 4) {
//         var fileField = $('.upload_files');
//         fileField.remove();
//         $('.pre-content:first').append(fileField);

//       }
//       $('.prec-ontent:last').css('display', 'none');
//       $('.pre-content:first').css('display', 'block').css('width', `calc(100% - ${20 * (imagesLength % 5)}%)`);
//     } else {
//       var width = $('.pre-content:last').css('width');
      
//       $('.pre-content:last').css('display', 'block').css('width', `calc(100% - ${20 * (imagesLength % 5)}%)`);
//     }
    
//   });
// });









// // $(function(){
// //   $("form").submit(function(e){
        
// //     if ($(".pre-content").html() == ""){
// //         alert("画像を選択してください");
      
// //         return false;
       
        
// //   //   if ($('input[type="hidden"').attr("value") == deleteSrc){
// //   //   $(this).remove();
// //   // }
// //       };
      
// //       var inputHidden = []
// //       inputHidden.push($('input[type="hidden"]'));
// //       console.log(inputHidden[1])
// //   })

// //   $(".hidden-field").on('change', function(e){
// //     var files = e.target.files;

// //     //画像ファイル以外の場合は何もしない
// //     // if(file.type.indexOf("image") < 0){
// //     //   return false;
// //     // }
// //     // if ($(".pre-content").html() == ""){
// //     //   alert("画像を選択してください");
// //     // }
    
// //     // var d = (new $.Deferred()).resolve();
// //     $.each(files,function(i,file){
      
// //       //画像ファイル以外の場合は何もしない
      
// //       if(file.type.indexOf("image") < 0){
// //         alert('画像を選択してください');
// //           return false;
// //         }
// //       return previewImage(file);
// //     });
// //   })
// //   var previewImage = function(imageFile){
   
// //     var reader = new FileReader();
// //     // var img = new Image();
    
// //     reader.onload = function(e){

// //       //画像のhtml要素を作成
// //       var preview = `<li class="item-pic">
                      
// //                         <img class="item-pic__image" src= ${e.target.result}>
                      
// //                       <div class="item-pic__button">
// //                         <a class="item-pic__button-edit" href="#" style= "color:#333333;" >編集</a>
// //                         <a class="item-pic__button-delete"style= "color:#333333; cursor: pointer" >削除</a>
// //                       </div>
// //                     </li>`;
      
      
// //       // `<li class= "item-pic"><img class="item-pic__image" src = ${e.target.result} ></li>`

// //      //画像をフォームの隣に出力
// //      $('.pre-content').prepend(preview);

// //     //フォームのリサイズ
// //       $(".label-content").resize('width', "calc(800px - ($('.item-pic').length * 20%" );
     
// //       // 画像が一つ以上ある場合ボックスの文字を写真マークに変更
// //     if ($(".item-pic").length > 1){
      
// //       //画像が一枚出力されたら、文字をカメラマークに変更
// //       $(".text1").replaceWith("<i class='fas fa-camera'></i>");
// //     }
// //     if ($(".item-pic").length > 4){
// //       //画像が五枚の場合はフォームを非表示
// //       $(".label-content").hide();
// //     }

// //     $(document).on('click', '.item-pic__button-delete', function(){
// //     //  var hiddenInput = $('input[type="hidden"]').attr("type", "file");
     
// //        var deleteSrc = ($(this).closest('li').children().attr('src'));
// //        $(this).closest('li').remove();
// //       //　file_fieldフォームを削除
// //       // $('input[type="file"]').remove();
// //       });
// //     };
// //     reader.readAsDataURL(imageFile);
// //   };
// // });

//    // cloned = $(".label-content").clone(ture);
      
//       //新しいフォームを追加
//       // $(".post__drop__box__container2").show();
//     // $('.pre-content2').prepend(preview);
//     // ($(".item-pic:gt(6)").prepend)
//     //   $('.pre-content2 ').prepend(preview);
      
//     // }
//     //   console.log($(".item-pic").length);
//         // var inputHidden = $('input[type="hidden"').length
//     // console.log(inputHidden)
//     // if ($('input[type="hidden"').attr("value") == deleteSrc){
//     //   ;
