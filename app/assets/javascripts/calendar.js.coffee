  $(document).ready ->
    $(".day.today, .day.future").on "click", ->
      date = $(this).date("date")
      window.location.href="/events/new?=#{date}"
  # /* LESS Variables */
  # /* -------------- */
  #
  # /* General */
  # @general-spacer: 20px;
  # @h4-size: 22px;
  #
  # /* Button Bar */
  # @button-bar-width: 200px;
  # @button-bar-bg-color: #ededed;
  #
  # /* Button */
  # @button-bg-color: #0d5287;
  # @button-bg-hover-color: #0585e8;
  # @button-text-padding: 14px;
  # @button-text-color: white;
  # @button-height: 22px;
  # @button-text-size: 14px;
  #
  # /* Elements */
  # /* -------- */
  # html {
  #   line-height: 1.5;
  #   text-align: center;
  # }
  #
  # h1 { text-size: @h1-size; }
  # a { text-decoration: none; }
  #
  # /* Layout */
  # /* ------ */
  # h1.welcome, .button-bar {
  #   margin: @general-spacer auto;
  #   height: auto;
  # }
  #
  # .button-bar {
  #   background: @button-bar-bg-color;
  #   padding: @general-spacer * 2;
  # }
  #
  # /* General Button */
  # /* -------------- */
  # .button {
  #   position: relative;
  #   margin: 0;
  #   padding-left: @button-text-padding;
  #   padding-right: @button-text-padding;
  #   padding-top: (@button-text-padding / 5);
  #   padding-bottom: (@button-text-padding / 5);
  #   background: @button-bg-color;
  #   color: @button-text-color;
  #   font-size: @button-text-size;
  # }
  #
  # .button::after {
  #   content: '';
  #   position: absolute;
  #   top: 0;
  #   width: 0;
  #   height: 0;
  # }
  #
  # .button:hover { background: @button-bg-hover-color; }
  #
  # /* Arrow Buttons */
  # /* ------------- */
  # .next::after, .prev::after { border-style: solid; }
  #
  # /* Next Button */
  # /* ----------- */
  # .next::after {
  #   right: -@button-height;
  #   border-width: @button-height / 2;
  #   border-color: transparent transparent transparent @button-bg-color;
  # }
  #
  # .next:hover::after {
  #   border-left-color: @button-bg-hover-color;
  # }
  #
  # /* Prev Button */
  # /* ----------- */
  # .prev::after {
  #   left: -@button-height;
  #   border-color: transparent @button-bg-color transparent transparent;
  #   border-width: @button-height / 2;
  # }
  #
  # .prev:hover::after {
  #   border-right-color: @button-bg-hover-color;
  # }
