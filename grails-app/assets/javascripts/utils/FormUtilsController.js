function FormUtilsController() {
  this.init = function () {
    bindHideButtonAndEditForm();
  };

  function bindHideButtonAndEditForm() {
    let inputsReferenceList = $("input");
    $(".js-edit").on("click", function (e) {
      e.preventDefault();
      $(this).hide();
      $(".js-send-button").removeClass("hide");
      inputsReferenceList.each(function (index, input) {
        $(input).removeAttr("readonly").focus();
      });
    });
  }
}

var formUtilsController;

$(document).ready(function () {
  formUtilsController = new FormUtilsController();
  formUtilsController.init();
});
