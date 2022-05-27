window.onload = function () {
  var formReference = document.querySelector("form");
  var valueReference = document.getElementById("value");
  var dueDateReference = document.getElementById("dueDate");
  var billingTypeReference = document.getElementById("method");
  var payerReference = document.getElementById("payerId");
  var todayDate = new Date();
  var zeroValue = 0;

  formReference.addEventListener("submit", (event) => {
    event.preventDefault();
    checkInput();
  });

  valueReference.addEventListener("focusout", (event) => {
    checkValue();
  });

  dueDateReference.addEventListener("focusout", (event) => {
    checkDueDate();
  });

  billingTypeReference.addEventListener("focusout", (event) => {
    checkBillingType();
  });

  payerReference.addEventListener("focusout", (event) => {
    checkPayer();
  });

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

  function checkInput() {
    checkValue();
    checkDueDate();
    checkBillingType();
    checkPayer();

    let formControls = formReference.querySelectorAll(".form-control");
    let formIsValid = [...formControls].every((formControl) => {
      return formControl.className === "form-control success";
    });

    if (!formIsValid) {
      return;
    }
    let infosCustomer = {};
    let data = new FormData(formReference);
    data.forEach(function (value, key) {
      infosCustomer[key] = value;
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
};
