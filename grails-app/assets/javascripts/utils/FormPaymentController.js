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
    var formReference = $("form");
    var url = formReference.data("url");
    var params = formReference.serialize();

    $.post(url, params, function (response) {
      if (!response.success) {
        alert(`Erro ao realizar requisição, contate o administrador..`);
        return;
      }
      window.location.href = formReference.data("redirect");
    });
  }
}

var formPaymentController;

$(document).ready(function () {
  formPaymentController = new FormPaymentController();
  formPaymentController.init();
});
