function FormValidationsController() {
  this.init = function () {
    formListener();
    nameListener();
    cpfCnpjListener();
    postalCodeListener();
    emailListener();
  };

  var formReference = document.querySelector("form");
  var nameReference = document.getElementById("name");
  var cpfCnpjReference = document.getElementById("cpfCnpj");
  var postalCodeReference = document.getElementById("postalCode");
  var emailReference = document.getElementById("email");
  var addressReference = document.getElementById("address");
  var complementReference = document.getElementById("complement");
  var districtReference = document.getElementById("district");
  var cityReference = document.getElementById("city");
  var stateReference = document.getElementById("state");
  var correctCpfLength = 11;
  var correctCnpjLength = 14;

  function checkName() {
    let nameValue = nameReference.value;
    if (!nameValue) {
      setErrorFor(nameReference, "O seu nome é obrigatório!");
      return;
    }
    setSucessFor(nameReference);
  }

  function checkCpf() {
    let cpfCnpjValue = cpfCnpj.value;
    if (cpfCnpjValue.length == correctCpfLength) {
      if (!cpfCnpjValue) {
        setErrorFor(cpfCnpjReference, "Preencha seu CPF");
      } else if (
        cpfCnpjValue.length !== correctCpfLength ||
        cpfCnpjValue == "00000000000" ||
        cpfCnpjValue == "11111111111" ||
        cpfCnpjValue == "22222222222" ||
        cpfCnpjValue == "33333333333" ||
        cpfCnpjValue == "44444444444" ||
        cpfCnpjValue == "55555555555" ||
        cpfCnpjValue == "66666666666" ||
        cpfCnpjValue == "77777777777" ||
        cpfCnpjValue == "88888888888" ||
        cpfCnpjValue == "99999999999"
      ) {
        setErrorFor(cpfCnpjReference, "O cpf informado é inválido");
      } else {
        setSucessFor(cpfCnpjReference);
      }
    }
  }

  function checkCnpj() {
    let cpfCnpjValue = cpfCnpj.value;
    if (
      cpfCnpjValue.length !== correctCnpjLength ||
      cpfCnpjValue == "00000000000000" ||
      cpfCnpjValue == "11111111111111" ||
      cpfCnpjValue == "22222222222222" ||
      cpfCnpjValue == "33333333333333" ||
      cpfCnpjValue == "44444444444444" ||
      cpfCnpjValue == "55555555555555" ||
      cpfCnpjValue == "66666666666666" ||
      cpfCnpjValue == "77777777777777" ||
      cpfCnpjValue == "88888888888888" ||
      cpfCnpjValue == "99999999999999"
    ) {
      setErrorFor(cpfCnpjReference, "O CNPJ informado é inválido");
      return;
    }
    setSucessFor(cpfCnpjReference);
  }

  function checkEmail() {
    let emailValue = emailReference.value;
    if (!emailValue) {
      setErrorFor(emailReference, "O email é obrigatório");
      return;
    }
    setSucessFor(emailReference);
  }

  function checkPostalCode() {
    let postalCodeValue = postalCodeReference.value;
    if (!postalCodeValue) {
      setErrorFor(postalCodeReference, "Favor informar o CEP!");
      return;
    }
    setSucessFor(postalCodeReference);
  }

  function checkSuccessInputs() {
    let cpfCnpjValue = cpfCnpj.value;
    checkName();
    if (cpfCnpjValue.length == correctCpfLength) {
      checkCpf();
    } else {
      checkCnpj();
    }
    checkPostalCode();
    checkEmail();
    checkFormIsValid();
  }

  function checkFormIsValid() {
    let formControls = formReference.querySelectorAll(".form-control");
    let formIsValid = [...formControls].every((formControl) => {
      return formControl.className === "form-control success";
    });
  }

  function fillAddress(data) {
    if (data.erro) {
      setErrorFor(postalCodeReference, "Não foi possível localizar o endereço");
      addressReference.value = "";
      districtReference.value = "";
      stateReference.value = "";
      cityReference.value = "";
      document.querySelector("#address").value = "";
      document.querySelector("#district").value = "";
      document.querySelector("#city").value = "";
      document.querySelector("#state").value = "";
      return;
    }
    setSucessFor(postalCodeReference);
    setSucessFor(addressReference);
    setSucessFor(districtReference);
    setSucessFor(stateReference);
    setSucessFor(cityReference);
    setSucessFor(complementReference);
    document.querySelector("#address").value = data.logradouro;
    document.querySelector("#district").value = data.bairro;
    document.querySelector("#city").value = data.localidade;
    document.querySelector("#state").value = data.uf;
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

  function formListener() {
    formReference.addEventListener("submit", (event) => {
      checkSuccessInputs();
    });
  }

  function nameListener() {
    nameReference.addEventListener("focusout", (event) => {
      checkName();
    });
  }

  function cpfCnpjListener() {
    cpfCnpjReference.addEventListener("focusout", (event) => {
      let cpfCnpjValue = cpfCnpj.value;
      if (cpfCnpjValue.length == correctCpfLength) {
        checkCpf();
        return;
      }
      checkCnpj();
    });
  }

  function postalCodeListener() {
    postalCodeReference.addEventListener("focusout", function () {
      checkPostalCode();
      if (validatePostalCode(this.value)) {
        getPostalCode(this.value, fillAddress);
      }
    });
  }

  function emailListener() {
    emailReference.addEventListener("focusout", (event) => {
      checkEmail();
    });
  }
}

var formValidationsController;

$(document).ready(function () {
  formValidationsController = new FormValidationsController();
  formValidationsController.init();
});