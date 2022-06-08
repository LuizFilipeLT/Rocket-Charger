function FormValidationsController() {
  this.init = function () {
    bindSubmitForm();
    bindInputName();
    bindInputPhone();
    bindInputCpfCnpj();
    bindInputPostalCode();
    bindInputEmail();
    bindInputAddressNumber();
    bindInputAddress()
    bindInputDistrict();
    bindInputCity();
    bindInputState();
  };

  var formReference = document.querySelector("form");
  var nameReference = document.getElementById("name");
  var phoneReference = document.getElementById("phone");
  var cpfCnpjReference = document.getElementById("cpfCnpj");
  var postalCodeReference = document.getElementById("postalCode");
  var emailReference = document.getElementById("email");
  var addressReference = document.getElementById("address");
  var addressNumberReference = document.getElementById("addressNumber");
  var complementReference = document.getElementById("complement");
  var districtReference = document.getElementById("district");
  var cityReference = document.getElementById("city");
  var stateReference = document.getElementById("state");
  var correctPostalCodeLength = 8;
  var correctCpfLength = 11;
  var correctCnpjLength = 14;
  var formatEmail =
    /[A-Za-z0-9_\%\+-]+(\.[A-Za-z0-9_\%\+-]+)*@[A-Za-z0-9-]+(\.[A-Za-z0-9-]+)*(\.[A-Za-z]{2,15})/;

  function validateName() {
    let nameValue = nameReference.value;
    if (!nameValue) {
      setErrorFor(nameReference, "O seu nome é obrigatório");
      return;
    }
    setSucessFor(nameReference);
  }

  function validatePhone() {
    let phoneValue = phoneReference.value;
    if (!phoneValue) {
      setErrorFor(phoneReference, "Número de contato obrigatório");
      return;
    }
    setSucessFor(phoneReference);
  }

  function validateCpf() {
    let cpfCnpjValue = cpfCnpjReference.value;
    if (!cpfCnpjValue) {
      setErrorFor(cpfCnpjReference, "Preencha seu CPF/CNPJ");
      return;
    }
    if (
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
      return;
    }
    setSucessFor(cpfCnpjReference);
  }

  function validateCnpj() {
    let cpfCnpjValue = cpfCnpjReference.value;
    if (!cpfCnpjValue) {
      setErrorFor(cpfCnpjReference, "Preencha seu CPF/CNPJ");
      return;
    }
    if (cpfCnpjValue.length > correctCnpjLength) {
      setErrorFor(cpfCnpjReference, "O CNPJ informado é inválido");
      return;
    }
    if (
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

  function validateEmail() {
    let emailValue = emailReference.value;
    if (!emailValue) {
      setErrorFor(emailReference, "O email é obrigatório");
      return;
    }
    if (validateFormatEmail(emailValue) == false) {
      setErrorFor(emailReference, "Formato incorreto");
      return;
    }
    setSucessFor(emailReference);
  }

  function validateFormatEmail(email) {
    return formatEmail.test(email);
  }

  function validatePostal() {
    let postalCodeValue = postalCodeReference.value;
    if (!postalCodeValue || postalCodeValue.length != correctPostalCodeLength) {
      setErrorFor(postalCodeReference, "Favor verificar o CEP");
      return;
    }
    setSucessFor(postalCodeReference);
  }
  
  function validateAddress() {
    if (!addressReference.value) {
      setErrorFor(addressReference, "Endereço obrigatório");
      return;
    }
    setSucessFor(addressReference);
  }

  function validateDistrict() {
    if (!districtReference.value) {
      setErrorFor(districtReference, "Favor informar o bairro");
      return;
    }
    setSucessFor(districtReference);
  }

  function validateState() {
    if (!stateReference.value) {
      setErrorFor(stateReference, "Favor informar o estado");
      return;
    }
    setSucessFor(stateReference);
  }

  function validateCity() {
    if (!cityReference.value) {
      setErrorFor(cityReference, "Favor informar a cidade");
      return;
    }
    setSucessFor(cityReference);
  }
  
  function validateAddressNumber() {
    if (!addressNumberReference.value) {
      setErrorFor(addressNumberReference, "Número da residência obrigatório");
      return;
    }
    setSucessFor(addressNumberReference);
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
    validateFormIsValid();
  }

  function validateFormIsValid() {
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

  function bindSubmitForm() {
    formReference.addEventListener("submit", (event) => {
      validateRequiredsInputs();
    });
  }

  function bindInputName() {
    nameReference.addEventListener("focusout", (event) => {
      validateName();
    });
  }

  function bindInputPhone() {
    phoneReference.addEventListener("focusout", (event) => {
      validatePhone();
    });
  }

  function bindInputCpfCnpj() {
    cpfCnpjReference.addEventListener("focusout", (event) => {
      let cpfCnpjValue = cpfCnpj.value;
      if (cpfCnpjValue.length == correctCpfLength) {
        validateCpf();
        return;
      }
      validateCnpj();
    });
  }

  function bindInputPostalCode() {
    postalCodeReference.addEventListener("focusout", (event) => {
      validatePostal();
      if (validatePostalCode(this.value)) {
        getPostalCode(this.value, fillAddress);
      }
    });
  }

  function bindInputDistrict() {
    districtReference.addEventListener("focusout", (event) => {
      validateDistrict();
    });
  }

  function bindInputCity() {
    cityReference.addEventListener("focusout", (event) => {
      validateCity();
    });
  }

  function bindInputState() {
    stateReference.addEventListener("focusout", (event) => {
      validateState();
    });
  }

  function bindInputAddress() {
    addressReference.addEventListener("focusout", (event) => {
      validateAddress();
    });
  }

  function bindInputAddressNumber() {
    addressNumberReference.addEventListener("focusout", (event) => {
      validateAddressNumber();
    });
  }

  function bindInputEmail() {
    emailReference.addEventListener("focusout", (event) => {
      validateFormatEmail();
      validateEmail();
    });
  }
}

var formValidationsController;

$(document).ready(function () {
  formValidationsController = new FormValidationsController();
  formValidationsController.init();
});
