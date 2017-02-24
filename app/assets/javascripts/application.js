//= require jquery
// require jquery.turbolinks
//= require jquery_ujs
//= require_tree .
//
//= require bootstrap-sprockets
//= require bootstrap
//= require moment
//= require bootstrap-datetimepicker
// require turbolinks

jQuery(document).ready(function($) {
    $(".clickable-row").click(function() {
        window.document.location = $(this).data("href");
    });
});
