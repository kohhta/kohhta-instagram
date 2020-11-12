// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")



import $ from 'jquery'
import axios from 'axios'
import { csrfToken } from 'rails-ujs'
axios.defaults.headers.common['X-CSRF-Token'] = csrfToken()



// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// プロフィールのアバター画像変更

document.addEventListener('DOMContentLoaded', () => {
  const reader = new FileReader();
  const imageUpload = document.getElementById("post_img");

imageUpload.onchange = function() {
  var file = $('input[type="file"]').prop('files')[0];

  if(!file) {
    window.alert('画像を選択してください')
  } else {
    reader.readAsDataURL(file);
    reader.onload = function (e) {

      $('#avatar_img_prev').attr('src', e.target.result);
      axios.put(`/profile/edit`)
      
        .then((res) => {
          window.alert('成功！')

          $('#avatar_img_prev').removeClass('hidden');
          $('.avatar_present_img').remove();
        })

        .catch((e) => {
          
        })
    }
  }
}

$('.avatar_present_img').on('click', () => {
  $('#post_img').click()
})
});