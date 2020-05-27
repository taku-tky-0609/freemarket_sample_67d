$(function (){
  function buildFileField(index) {
    html = `<div class="new_item_page_container_main_label" data-index="${index}">
              <input class= "js-file" type= "file"name="item[item_images_attributes][${index}][src]" id="item_item_images_attributes_${index}_src">
              <div class="js-remove">削除</div>
            </div>`;  
    return html;
  };
  const buildImg = (index, url)=> {
    const html = `<img data-index="${index}" src="${url}" width="20%" height="160px">`;
    return html;
  };
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
  lastIndex = $('.new_item_page_container_main_label').data('index');
  fileIndex.splice(0, lastIndex);

  $(document).on('change', '.js-file', function(e){
    const targetIndex = $(this).parent().data('index')
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);
    $('.prepend_area').prepend(buildImg(targetIndex, blobUrl));
    $(".prepend_area").append(buildFileField(fileIndex[0]));
    fileIndex.shift();
    fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
  })

  $(document).on("click", '.js-remove', function(){
    const targetIndex = $(this).parent().data('index');
    $(this).parent().remove();
    if ($('.js-file').length == 0) $('.pre-content').append(buildFileField(fileIndex[0]));
    $(`img[data-index="${targetIndex}"]`).remove();
  });
})