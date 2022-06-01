function FormPaymentController() {
  this.init = function () {
    bindFormSubmit();
  };
  function bindFormSubmit() {
    $("form").on("submit", function (e) {
      e.preventDefault();
      bindPostFormSubmit();
    });
  }

  function bindPostFormSubmit() {
    var data = new FormData(document.querySelector("form"));

    var object = {};
    data.forEach(function (value, key) {
      object[key] = value;
    });

    var url = $("form").prop("action");
    $.post(url, object, function (response) {
      if (!response.success) {
        alert(`Erro ao realizar requisição, contate o administrador..`);
        return;
      }
      window.location.href = $("form").data("redirect-url");
    });
  }
}

var formPaymentController;

$(document).ready(function () {
  formPaymentController = new FormPaymentController();
  formPaymentController.init();
});
