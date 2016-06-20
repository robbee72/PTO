   $(document).ready ->
      $(".day.today, .day.future").on "click", ->
        alert "hello"
        date = $(this).data('full-date')

        window.location.href="/events/new?date=#{date}"
