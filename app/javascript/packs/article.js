import $ from 'jquery'
import axios from 'axios'
import { csrfToken } from 'rails-ujs'
import {
  listenActiveHeartEvent,
  listenInactiveHeartEvent
}from 'modules/handle_heart'

axios.defaults.headers.common['X-CSRF-Token'] = csrfToken()

const handleHeartDisplay = (hasLiked) => {
  if (hasLiked) {
    $('.active-heart').removeClass('hidden')
  } else {
    $('.inactive-heart').removeClass('hidden')
  }
}

const handleCommentForm = () => {
  $('.show-comment-form').on('click', () => {
    $('.show-comment-form').addClass('hidden')
    $('.comment-text-area').removeClass('hidden')
  })
}

// コメント追加内容

const appendNewComment = (comment) => {
  $('.comments-container').append(
    `<div class="article_comment">
    <div class="article_comment_image">
      <img class='article_comment_image' src='${comment.user.avatar_comment_image}'>
    </div>
      <p>@${comment.user.username}</p>
      <p>${comment.content}</p>
    </div>`

  )
  }

// 非同期コメント処理

document.addEventListener('DOMContentLoaded', () => {
  const dataset = $('#article-show').data()
  const articleId = dataset.articleId

  axios.get(`/articles/${articleId}/comments`)
    .then((response) => {
      
      const comments = response.data
      comments.forEach((comment) => {
        appendNewComment(comment)
      })
    })

    handleCommentForm()


  $('.add-comment-button').on('click', () => {
    const content = $('#comment_content').val()
    if (!content) {
      window.alert('コメントを入力してください')
    } else {
      axios.post(`/articles/${articleId}/comments`, {
        comment: {content: content}
      })
        .then((res) => {
          const comment = res.data
          appendNewComment(comment)

          $('#comment_content').val('')
        })
    }
  })

  axios.get(`/articles/${articleId}/like`)
    .then((response) => {
      const hasLiked = response.data.hasLiked
      handleHeartDisplay(hasLiked)
    })

    listenActiveHeartEvent(articleId)
    listenInactiveHeartEvent(articleId)
})

