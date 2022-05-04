$(document).ready(function () {
  let inputsReference = $("input");

  $(".js-edit").on("click", function (e) {
    e.preventDefault();
    $(this).addClass("hiddenBtn");
    $(".js-send-button").removeClass("hiddenBtn");

    inputsReference.each(function (i, input) {
      $(input).removeAttr("readonly");
    });
  });
});