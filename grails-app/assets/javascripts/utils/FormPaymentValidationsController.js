function FormPaymentValidationsController() {
  this.init = function () {
    formListener();
    valueListener();
    dueDateListener();
    billingTypeListener();
    payerListener();
  };

  var formReference = document.querySelector("form");
  var valueReference = document.getElementById("value");
  var dueDateReference = document.getElementById("dueDate");
  var billingTypeReference = document.getElementById("method");
  var payerReference = document.getElementById("payerId");
  var todayDate = new Date();
  var zeroValue = 0;

  function formListener() {
    formReference.addEventListener("submit", (event) => {
      checkSuccessInputs();
    });
  }

  function valueListener() {
    valueReference.addEventListener("focusout", (event) => {
      checkValue();
    });
  }

  function dueDateListener() {
    dueDateReference.addEventListener("focusout", (event) => {
      checkDueDate();
    });
  }

  function billingTypeListener() {
    billingTypeReference.addEventListener("focusout", (event) => {
      checkBillingType();
    });
  }

  function payerListener() {
    payerReference.addEventListener("focusout", (event) => {
      checkPayer();
    });
  }

  function checkValue() {
    let inputValue = valueReference.value;
    if (!inputValue) {
      setErrorFor(valueReference, "Favor informar o valor.");
      return;
    }
    if (inputValue < zeroValue) {
      setErrorFor(valueReference, "Valor não aceito, favor verificar.");
      return;
    }
    setSucessFor(valueReference);
  }

  function checkDueDate() {
    let dueDateValue = dueDateReference.value;
    if (!dueDateValue) {
      setErrorFor(dueDateReference, "Favor informar a data de vencimento.");
      return;
    }
    if (dueDateValue < todayDate) {
      setErrorFor(dueDateReference, "Informar acima da data de hoje.");
      return;
    }
    setSucessFor(dueDateReference);
  }

  function checkBillingType() {
    let billingTypeValue = billingTypeReference.value;
    if (!billingTypeValue) {
      setErrorFor(billingTypeReference, "Escolha o método de pagamento.");
      return;
    }
    setSucessFor(billingTypeReference);
  }

  function checkPayer() {
    let payerValue = payerReference.value;
    if (!payerValue) {
      setErrorFor(payerReference, "Escolha o pagador desta cobrança.");
      return;
    }
    setSucessFor(payerReference);
  }

  function checkSuccessInputs() {
    checkBillingType();
    checkDueDate();
    checkFormIsValid();
    checkPayer();
    checkValue();
  }

  function checkFormIsValid() {
    let formControls = formReference.querySelectorAll(".form-control");
    let formIsValid = [...formControls].every((formControl) => {
      return formControl.className === "form-control success";
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
