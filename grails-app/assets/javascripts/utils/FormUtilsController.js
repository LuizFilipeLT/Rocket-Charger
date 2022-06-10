function FormUtilsController() {
  this.init = function () {
    bindHideButtonAndEditForm();
    validateRequiredsInputs();
  };

  function bindHideButtonAndEditForm() {
    let inputsReferenceList = $("input");
    $(".js-edit").on("click", function (e) {
      e.preventDefault();
      $(this).hide();
      $(".js-send-button").removeClass("hide");
      inputsReferenceList.each(function (index, input) {
        $(input).removeAttr("readonly");
      });
    });
  }
}

var formUtilsController;

$(document).ready(function () {
  formUtilsController = new FormUtilsController();
  formUtilsController.init();
});
