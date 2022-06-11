function FormUtilsController() {
  this.init = function () {
    bindHideButtonAndEditForm();
  };

  function bindHideButtonAndEditForm() {
    let nameReference = document.getElementById("name");
    let inputsReferenceList = $("input");
    $(".js-edit").on("click", function (e) {
      e.preventDefault();
      $(this).hide();
      $(".js-send-button").removeClass("hide");
      inputsReferenceList.each(function (index, input) {
        $(input).removeAttr("readonly").focus();
      });
      nameReference.focus();
    });
  }
}

var formUtilsController;

$(document).ready(function () {
  formUtilsController = new FormUtilsController();
  formUtilsController.init();
});
