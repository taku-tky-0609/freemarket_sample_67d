$(function(){


  $(".hidden-field").on('change', function(e){
    var files = e.target.files;

    //画像ファイル以外の場合は何もしない
    // if(file.type.indexOf("image") < 0){
    //   return false;
    // }
    
    // var d = (new $.Deferred()).resolve();
    $.each(files,function(i,file){
      
      //画像ファイル以外の場合は何もしない
      if(file.type.indexOf("image") < 0){
        alert('画像を選択してください');
          return false;
        }
      return previewImage(file);
    });
  })
  var previewImage = function(imageFile){
   
    var reader = new FileReader();
    // var img = new Image();
    
    reader.onload = function(e){

      //画像のhtml要素を作成
      var preview = `<li class="item-pic">
                      
                        <img class="item-pic__image" src= ${e.target.result}>
                      
                      <div class="item-pic__button">
                        <a class="item-pic__button-edit" href="#" style= "color:#333333;" >編集</a>
                        <a class="item-pic__button-delete" href="#" style= "color:#333333;" >削除</a>
                      </div>
                    </li>`;
      
      
      
      
      // `<li class= "item-pic"><img class="item-pic__image" src = ${e.target.result} ></li>`

     //画像をフォームの隣に出力
     $('.pre-content').prepend(preview);

    //フォームのリサイズ
      $(".label-content").resize('width', "calc(800px - ($('.item-pic').length * 20%" )
    
      // 画像が一つ以上ある場合ボックスの文字を写真マークに変更
    if ($(".item-pic").length > 1){
      
      //画像が一枚出力されたら、文字をカメラマークに変更
      $(".text1").replaceWith("<i class='fas fa-camera'></i>");
      

    }

    if ($(".item-pic").length > 4){
      //画像が五枚の場合はフォームを削除
      $(".label-content").hide();
      // cloned = $(".label-content").clone(ture);
      
      //新しいフォームを追加
      // $(".post__drop__box__container2").show();

    }

    // $('.pre-content2').prepend(preview);
    // ($(".item-pic:gt(6)").prepend)
    //   $('.pre-content2 ').prepend(preview);
      
    // }
    //   console.log($(".item-pic").length);
      
    };
    reader.readAsDataURL(imageFile);
    
  }
})
