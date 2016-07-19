ready = ->
  $(".day.today, .day.future").on "click", ->
    date = $(this).data('full-date')
    userId = $(this).data('user-id')
    window.location.href="/users/#{userId}/events/new?date=#{date}"


$(document).ready(ready)
$(document).on('page:load', ready)
