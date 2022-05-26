window.onload = function () {
  var formReference = document.querySelector("form");
  var valueReference = document.getElementById("value");
  var dueDateReference = document.getElementById("dueDate");
  var billingTypeReference = document.getElementById("method");
  var payerReference = document.getElementById("payerId");

  formReference.addEventListener("submit", (event) => {
    event.preventDefault();
    checkInput();
  });

  valueReference.addEventListener("input", (event) => {
    checkValue();
  });

  function checkValue() {
    let inputValue = valueReference.value;
    if (!inputValue) {
      setErrorFor(valueReference, "Favor informar o valor.");
      return;
    }
    setSucessFor(valueReference);
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
