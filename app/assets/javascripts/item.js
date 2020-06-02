$(function (){
  function buildFileField(index) {
    html = `<div class="new_item_page_container_main_label" data-index="${index}">
              <input id = "js-file" class= "js-file" type= "file"name="item[item_images_attributes][${index}][src]" data-index="${index}" id="item_item_images_attributes_${index}_src">
            </div>`;  
    return html;
  };
  const buildImg = (index, url)=> {
    const html = `
    <div class = "image-box" data-index="${index}" data-lightbox="abc">
      <a href="${url}" data-lightbox="group">
        <img data-index="${index}" src="${url}" data-lightbox="group">
      </a>
      <div class="editting-box">
        <i class="fas fa-image"></i>
        <i class="fas fa-trash-alt"></i>
      </div>
    </div>`;
    return html;
  };

if ($(".image-box").length > 0){
  $(".pre-content").css('width', `calc(100% - ${20 * ($(".image-box").length  % 5)}%)`)
  if ($(".image-box").length === 4) {
    $('.text').html('<i class="fas fa-camera"></i>');
  } else if ($(".image-box").length === 5) {
    $('.pre-content').css('display', 'none');
  }
}
// file_fieldのnameに動的なindexをつける為の配列
let fileIndex = [1,2,3,4,5,6,7,8,9,10];
lastIndex = $('.new_item_page_container_main_label:last').data('index');
fileIndex.splice(0, lastIndex);
$('.hidden-destroy').hide();

$(document).on("click", '.fa-image', function(){
  const targetIndex = $(this).parent().parent().data('index');
  
  $(`input[data-index="${targetIndex}"].js-file`).click();
});

  $(document).on('change', '.js-file', function(e){
    const targetIndex = $(this).parent().data('index');
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      
      img.setAttribute('src', blobUrl);
    } 
    else{
      $('.prepend_area').prepend(buildImg(targetIndex, blobUrl));
      $(".form-file").prepend(buildFileField(fileIndex[0]));
      fileIndex.shift();
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
    };
    var imagesLength = $('.image-box').length;
    $('.pre-content').css('width', `calc(100% - ${20 * (imagesLength % 5)}%)`);
    var imagesLength = $('.image-box').length;
    if (imagesLength ===4) {
      $('.text').html('<i class="fas fa-camera"></i>');
    } else if (imagesLength === 5){
      $('.pre-content').css('display', 'none');
      
    };


  })


  $(document).on("click", '.fa-trash-alt', function(){
    const targetIndex = $(this).parent().parent().data('index');
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    if (hiddenCheck) hiddenCheck.prop('checked', true);
    $(`.new_item_page_container_main_label[data-index="${targetIndex}"]`).remove();
    var imagesLength = $('.image-box').length;
    $('.pre-content').css('width', `calc(100% - ${20 * (imagesLength % 5 - 1)}%)`);
    if (imagesLength -1 ===4) {
      $('.pre-content').show().css('width', `calc(100% - ${20 * ((imagesLength - 1 )% 5)}%)`);
      $('.text').html('<i class="fas fa-camera"></i>');
    } else if (imagesLength - 1===3){
      $('.text').html('<p class="text">クリックをしてアップロード</i>');
    };
    if ($('.js-file').length == 0) { $('.pre-content').append(buildFileField(fileIndex[0]));}
    $(`.image-box[data-index="${targetIndex}"]`).remove();
  });

  $('.ProductImages').slick({
    infinite: true, //スライドのループ有効化
    arrows: false, //矢印非表示
    fade: true, //フェードの有効化
    draggable: false, //ドラッグ操作の無効化
  });
  $('.ProductImages-nav').slick({
    infinite: true, //スライドのループ有効化
    slidesToShow: 6, //表示するスライドの数
    slidesToScroll:1,
    focusOnSelect: true, //フォーカスの有効化
    asNavFor: '.ProductImages', //thumbnailクラスのナビゲーション
    prevArrow: '<img src="前への矢印画像のパス" class="slide-arrow prev-arrow">',
    nextArrow: '<img src="次への矢印画像のパス" class="slide-arrow next-arrow">'
  });  

})






