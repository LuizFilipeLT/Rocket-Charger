function FormUtilsController() {
  this.init = function () {
    bindFormSubmit();
    bindHideButtonAndEditForm();
    validateRequiredsInputs();
  };

  function bindFormSubmit() {
    $("form").on("submit", function (e) {
      e.preventDefault();
    });
  }

  function validateRequiredsInputs() {
    let cpfCnpjValue = cpfCnpj.value;
    validateName();
    if (cpfCnpjValue.length == correctCpfLength) {
      validateCpf();
    } else {
      validateCnpj();
    }
    validatePostal();
    validateEmail();
    validateForm();
  }

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
