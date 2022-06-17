function FormPaymentValidationsController() {
  this.init = function () {
    bindSubmitForm();
    bindInputValue();
    bindInputDueDate();
    bindInputBillingType();
    bindSelectPayer();
    bindPreventDefaultForm();
  };

  var formReference = document.querySelector("form");
  var valueReference = document.getElementById("value");
  var dueDateReference = document.getElementById("dueDate");
  var billingTypeReference = document.getElementById("method");
  var payerReference = document.getElementById("payerId");
  var todayDate = new Date();
  var zeroValue = 0;
  var minValue = 2;

  function bindPreventDefaultForm() {
    $("form").on("submit", function (e) {
      e.preventDefault();
    });
  }

  function bindSubmitForm() {
    formReference.addEventListener("submit", (event) => {
      validateRequiredsInputs();
    });
  }

  function bindInputValue() {
    valueReference.addEventListener("focusout", (event) => {
      validateValue();
    });
  }

  function bindInputDueDate() {
    dueDateReference.addEventListener("focusout", (event) => {
      validateDueDate();
    });
  }

  function bindInputBillingType() {
    billingTypeReference.addEventListener("focusout", (event) => {
      validateBillingType();
    });
  }

  function bindSelectPayer() {
    payerReference.addEventListener("focusout", (event) => {
      validatePayer();
    });
  }

  function validateValue() {
    let inputValue = valueReference.value;
    if (inputValue < minValue) {
      setErrorFor(
        valueReference,
        "Valor minimo para geração de cobrança de R$ 2,00"
      );
      return;
    }
    if (!inputValue) {
      setErrorFor(valueReference, "Favor informar o valor");
      return;
    }
    if (inputValue < zeroValue) {
      setErrorFor(valueReference, "Valor não aceito, favor verificar");
      return;
    }
    setSucessFor(valueReference);
  }

  function validateDueDate() {
    var dueDateValue = dueDateReference.value;
    if (!dueDateValue) {
      setErrorFor(dueDateReference, "Favor informar a data de vencimento");
      return;
    }
    dueDateValue = dueDateValue.replace(/\//g, "-");
    var dueDateArray = dueDateValue.split("-");
    var day = dueDateArray[2];
    var month = dueDateArray[1];
    var year = dueDateArray[0];

    if (dueDateArray[0].length != 4) {
      day = dueDateArray[0];
      month = dueDateArray[1];
      year = dueDateArray[2];
    }

    var d1 = todayDate.getDate();
    var m1 = todayDate.getMonth() + 1;
    var y1 = todayDate.getFullYear();

    d1 = new Date(y1, m1, d1);
    var d2 = new Date(year, month, day);

    var diff = d2.getTime() - d1.getTime();
    diff = diff / (1000 * 60 * 60 * 24);

    if (diff <= zeroValue) {
      setErrorFor(dueDateReference, "Data não pode ser anterior ou definida para o dia de hoje");
      return;
    }
    setSucessFor(dueDateReference);
  }

  function validateBillingType() {
    let billingTypeValue = billingTypeReference.value;
    if (!billingTypeValue) {
      setErrorFor(billingTypeReference, "Escolha o método de pagamento");
      return;
    }
    setSucessFor(billingTypeReference);
  }

  function validatePayer() {
    let payerValue = payerReference.value;
    if (!payerValue) {
      setErrorFor(payerReference, "Escolha o pagador desta cobrança");
      return;
    }
    setSucessFor(payerReference);
  }

  function validateRequiredsInputs() {
    validateBillingType();
    validateDueDate();
    validatePayer();
    validateValue();
    validateForm();
  }

  function validateForm() {
    var formControls = formReference.querySelectorAll(".form-control");
    var formIsValid = [...formControls].every((formControl) => {
      return formControl.className.includes("success");
    });
    if (!formIsValid) return alert("Favor verificar os campos");
    bindPostFormSubmit();
  }

  function bindPostFormSubmit() {
    var formReference = $("form");
    var url = formReference.data("url");
    var params = formReference.serialize();

    $.post(url, params, function (response) {
      if (!response.success) {
        alert("Erro ao tentar gerar cobrança");
        return;
      }
      window.location.href = formReference.data("redirect");
    });
  }

  function setSucessFor(input) {
    let formControl = input.parentElement;

    $(formControl).addClass("form-control success").removeClass("error");
  }

  function setErrorFor(input, message) {
    let formControl = input.parentElement;
    let smallDisplayError = formControl.querySelector(".js-msg");

    smallDisplayError.innerText = message;
    $(formControl).addClass("form-control error").removeClass("success");
  }
}

var formPaymentValidationsController;

$(document).ready(function () {
  formPaymentValidationsController = new FormPaymentValidationsController();
  formPaymentValidationsController.init();
});
