function FormPaymentValidationsController() {
  this.init = function () {
    bindSubmitForm();
    bindInputValue();
    bindInputDueDate();
    bindInputBillingType();
    bindSelectPayer();
  };

  var formReference = document.querySelector("form");
  var valueReference = document.getElementById("value");
  var dueDateReference = document.getElementById("dueDate");
  var billingTypeReference = document.getElementById("method");
  var payerReference = document.getElementById("payerId");
  var todayDate = new Date();
  var zeroValue = 0;

  function bindSubmitForm() {
    formReference.addEventListener("submit", (event) => {
      checkSuccessInputs();
    });
  }

  function bindInputValue() {
    valueReference.addEventListener("focusout", (event) => {
      checkValue();
    });
  }

  function bindInputDueDate() {
    dueDateReference.addEventListener("focusout", (event) => {
      checkDueDate();
    });
  }

  function bindInputBillingType() {
    billingTypeReference.addEventListener("focusout", (event) => {
      checkBillingType();
    });
  }

  function bindSelectPayer() {
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

  function validateDate(dueDate) {
    var date = dueDateReference.value; // pega o valor do input
    date = date.replace(/\//g, "-"); // substitui eventuais barras (ex. IE) "/" por hífen "-"
    var dateArray = date.split("-"); // quebra a date em array
    var day = dateArray[2];
    var month = dateArray[1];
    var year = dateArray[0];

    // para o IE onde será inserido no formato dd/MM/yyyy
    if (data_array[0].length != 4) {
      day = data_array[0];
      month = data_array[1];
      year = data_array[2];
    }

    var hoje = new Date();
    var d1 = hoje.getDate();
    var m1 = hoje.getMonth() + 1;
    var y1 = hoje.getFullYear();

    var d1 = new Date(y1, m1, d1);
    var d2 = new Date(year, month, day);

    var diff = d2.getTime() - d1.getTime();
    diff = diff / (1000 * 60 * 60 * 24);

    if (diff < zeroValue) {
      setErrorFor(
        dueDateReference,
        "Data selecionada não pode ser anterior ao dia de hoje"
      );
      return;
    }
    if (diff > 30) {
      setErrorFor(
        dueDateReference,
        "Data não pode ser mais do que 30 dias pra frente"
      );
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
