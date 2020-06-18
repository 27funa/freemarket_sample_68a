// window.onpageshow = function(event) {
// 	if (event.persisted) {
// 		 window.location.reload();
// 	}
// };

$(document).on('turbolinks:load', function() { 



  $('.error_select').on('change', function(){
    var index = $('.error_select').index(this);
    $(".error_select_box").eq(index).find(".laramins").css("display","none")
  });

  //edit 6/18

  const filesize= $(".new__main__post__top__content__upload__camera__label").length
  console.log(filesize)
  let ee_count = 0
  let d_count = 0;
  console.log(d_count - filesize)

  // if ($(".destroy_img_btm").prop('checked')) {
 
    // value値を出力
    $('.destroy_img_btm').prop('checked', false);

    $(".destroy_img_btm").removeAttr('checked').prop('checked', false).change();


  // };

  
    $('#123img_edit').change(function(){
      console.log(filesize)
      console.log(d_count)
      if ( !this.files.length && d_count - filesize == 0 ) {
       $("#image_taken").val('');
       $('#preview').text('');
       let ee_count = 0 
         return;
       }
       $('#preview').text('');
    
       var $files = $(this).prop('files');
       var len = $files.length;
       
   
         if ($files.length > 3 - filesize + d_count ){
           alert("画像は3枚までです。（残り"+(3-filesize)+"）")
           $('input[type=file]').val('');
           if (d_count - filesize == 0){
           $("#image_taken").val("");
            let ee_count = 0 

           }
          //  $("#post_image_taken").val('');
           return false
   
         }
         else{
           $(this).css("display","none")
           $("#image_taken").val("in");
            let eecount = 1
   
   
       for ( var i = 0; i < len; i++ ) {
         var file = $files[i];
         var fr = new FileReader();
   
       
         fr.onload = function(e) {
           var src = e.target.result;
           var img = `<img src= ${src}>`;
           // var img = `<div class='item-image__operetion'><img src= ${src}>
           // <div class='item-image__operetion--delete'>削除</div></div>`;
           $('#preview').append(img);
         }
    
         fr.readAsDataURL(file);
       
     }
   
   
   
   
   }
   
   
   
   
   
    //  console.log($files)
   
   });

   //preview single
  //  $('#post_images_attributes_0_image').on('click', function(){
  //       var imageid = $(this).attr('id')
  //       var image = "#"+imageid
        // console.log(image)
      
    
      $("#post_images_attributes_0_image").change(function(e){
        console.log( $(this).val() );
        //ファイルオブジェクトを取得する
        var file = e.target.files[0];
        var reader = new FileReader();
     
        //画像でない場合は処理終了
        if(file.type.indexOf("image") < 0){
          alert("画像ファイルを指定してください。");
          return false;
        }
     
        //アップロードした画像を設定する
        reader.onload = (function(file){
          return function(e){
            $("#topimage0").attr("src", e.target.result);
            $("#topimage0").attr("title", file.name);
          };
        })(file);
        reader.readAsDataURL(file);
      });
    
      
      // });

      $('#post_images_attributes_1_image').on('click', function(){
        var imageid = $(this).attr('id')
        var image = "#"+imageid
        // console.log(image)
      
    
      $(image).change(function(e){
        //ファイルオブジェクトを取得する
        var file = e.target.files[0];
        var reader = new FileReader();
     
        //画像でない場合は処理終了
        if(file.type.indexOf("image") < 0){
          alert("画像ファイルを指定してください。");
          return false;
        }
     
        //アップロードした画像を設定する
        reader.onload = (function(file){
          return function(e){
            $("#topimage1").attr("src", e.target.result);
            $("#topimage1").attr("title", file.name);
          };
        })(file);
        reader.readAsDataURL(file);
      });
    
      
      });

      $('#post_images_attributes_2_image').on('click', function(){
        var imageid = $(this).attr('id')
        var image = "#"+imageid
        // console.log(image)
      
    
      $(image).change(function(e){
        //ファイルオブジェクトを取得する
        var file = e.target.files[0];
        var reader = new FileReader();
     
        //画像でない場合は処理終了
        if(file.type.indexOf("image") < 0){
          alert("画像ファイルを指定してください。");
          return false;
        }
     
        //アップロードした画像を設定する
        reader.onload = (function(file){
          return function(e){
            $("#topimage2").attr("src", e.target.result);
            $("#topimage2").attr("title", file.name);
          };
        })(file);
        reader.readAsDataURL(file);
      });
    
      
      });
      

   //destroy
   $('.destroy_img_btm').on('change', function(){
    if ($(this).prop('checked')) {
    var nr = $('.destroy_img_btm').index(this)
    $(".123abcdd").eq(nr).css("display","none")
    $(".123abcde").eq(nr).css("display","none")

    
    console.log();
      d_count += 1
      console.log(d_count - filesize-ee_count);

      if( ee_count == 0 && d_count - filesize == 0 ){
        $("#image_taken").val('');
      }
    };
   });
    
  $("#image_taken").css("display","none");

  //  $("#image_taken").val('');
//
  $("#post_image_taken").css("display","none");
  $("#post_image_taken").val('');
  $('#post_image').change(function(){
   if ( !this.files.length ) {
    $("#post_image_taken").val('');
    $('#preview').text('');
      return;
    }
    $('#preview').text('');
 
    var $files = $(this).prop('files');
    var len = $files.length;
    

      if ($files.length > 3){
        alert("画像は3枚までです。")
        $('input[type=file]').val('');
        $("#post_image_taken").val('');
        return false

      }
      else{
        $(this).css("display","none")
       $("#post_image_taken").val("in");



    for ( var i = 0; i < len; i++ ) {
      var file = $files[i];
      var fr = new FileReader();

    
      fr.onload = function(e) {
        var src = e.target.result;
        var img = `<img src= ${src}>`;
        // var img = `<div class='item-image__operetion'><img src= ${src}>
        // <div class='item-image__operetion--delete'>削除</div></div>`;
        $('#preview').append(img);
      }
 
      fr.readAsDataURL(file);
    
  }




}





  console.log($files)

});

// $(document).on("click", '.item-image__operetion--delete', function(){
//   //プレビュー要素を取得
//   var target_image = $('.item-image__operetion--delete').index(this)

//   console.log(target_image)
//   //プレビューを削除
//   var target_delete = $(".item-image__operetion").eq(target_image)
//   var $files = $('#post_image').prop('files');
//   console.log($files[target_image])

//   $('input[type=file]')[0].files[0].val("")

//   // $files[target_image].val("")
//   target_delete.remove()


  // var $files = $('#post_image').prop('files');
  // console.log($files[target_delete])
  //inputタグに入ったファイルを削除
  // $files[0].val""
// })



   



  // $(function(){
    // カテゴリーセレクトボックスのオプションを作成
    function appendOption(category){
      var html = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
      return html;
    }

    // 子カテゴリーの表示作成
    function appendChidrenBox(insertHTML){
      var childSelectHtml = '';
      childSelectHtml = `<div class='listing-select-wrapper__added' id= 'children_wrapper'>
                          <div class='listing-select-wrapper__box'>
                            <select class="listing-select-wrapper__box--select" id="child_category" name="category_id">
                              <option value="---" data-category="---">---</option>
                              ${insertHTML}
                            <select>
                            <i class='fas fa-chevron-down listing-select-wrapper__box--arrow-down'></i>
                          </div>
                        </div>`;
      $('.listing-product-detail__category').append(childSelectHtml);
    }
    // 孫カテゴリーの表示作成
    function appendGrandchidrenBox(insertHTML){
      var grandchildSelectHtml = '';
      grandchildSelectHtml = `<div class='listing-select-wrapper__added' id= 'grandchildren_wrapper'>
                                <div class='listing-select-wrapper__box'>
                                  <select class="listing-select-wrapper__box--select" id="grandchild_category" name="category_id">
                                    <option value="---" data-category="---">---</option>
                                    ${insertHTML}
                                  </select>
                                  
                                </div>
                              </div>`;
      $('.listing-product-detail__category').append(grandchildSelectHtml);
    }
    // 親カテゴリー選択後のイベント
    $('#parent_category').on('change', function(){
      var parentCategory = document.getElementById('parent_category').value; //選択された親カテゴリーの名前を取得
      if (parentCategory != "---"){ //親カテゴリーが初期値でないことを確認
        $.ajax({
          url: '/posts/get_category_children',
          type: 'GET',
          data: { parent_name: parentCategory },
          dataType: 'json'
        })
        .done(function(children){
          $('#children_wrapper').remove(); //親が変更された時、子以下を削除するする
          $('#grandchildren_wrapper').remove();
          $('#size_wrapper').remove();
          $('#brand_wrapper').remove();
          var insertHTML = '';
          children.forEach(function(child){
            insertHTML += appendOption(child);
          });
          appendChidrenBox(insertHTML);
        })
        .fail(function(){
          alert('カテゴリー取得に失敗しました');
        })
      }else{
        $('#children_wrapper').remove(); //親カテゴリーが初期値になった時、子以下を削除するする
        $('#grandchildren_wrapper').remove();
        $('#size_wrapper').remove();
        $('#brand_wrapper').remove();
      }
    });
    // 子カテゴリー選択後のイベント
    $('.listing-product-detail__category').on('change', '#child_category', function(){
      var childId = $('#child_category option:selected').data('category'); //選択された子カテゴリーのidを取得
      if (childId != "---"){ //子カテゴリーが初期値でないことを確認
        $.ajax({
          url: '/posts/get_category_grandchildren',
          type: 'GET',
          data: { child_id: childId },
          dataType: 'json'
        })
        .done(function(grandchildren){
          if (grandchildren.length != 0) {
            $('#grandchildren_wrapper').remove(); //子が変更された時、孫以下を削除するする
            $('#size_wrapper').remove();
            $('#brand_wrapper').remove();
            var insertHTML = '';
            grandchildren.forEach(function(grandchild){
              insertHTML += appendOption(grandchild);
            });
            appendGrandchidrenBox(insertHTML);
          }
        })
        .fail(function(){
          alert('カテゴリー取得に失敗しました');
        })
      }else{
        $('#grandchildren_wrapper').remove(); //子カテゴリーが初期値になった時、孫以下を削除する
        $('#size_wrapper').remove();
        $('#brand_wrapper').remove();
      }
    });
  // });











});