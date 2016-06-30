ready = ->
  $(".day.today, .day.future").on "click", ->
    date = $(this).data('full-date')
    window.location.href="/events/new?date=#{date}"


$(document).ready(ready)
$(document).on('page:load', ready)
