//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require jquery.turbolinks
//= require_tree .
//
//= require bootstrap-sprockets
//= require bootstrap
//= require moment
//= require bootstrap-datetimepicker

jQuery(document).ready(function($) {
    $(".clickable-row").click(function() {
        window.document.location = $(this).data("href");
    });
});
