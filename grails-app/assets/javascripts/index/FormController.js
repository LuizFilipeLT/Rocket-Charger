const form = document.querySelector("form");
const customerName = document.getElementById("customerName");
const cpfCnpj = document.getElementById("cpfCnpj");
const cellphone = document.getElementById("cellphone");
const postalCode = document.getElementById("postalCode");
const email = document.getElementById("email");
const address = document.getElementById("address");
const houseNumber = document.getElementById("houseNumber");
const birthDate = document.getElementById("birthDate");
const complement = document.getElementById("complement");
const province = document.getElementById("province");
const city = document.getElementById("city");
const state = document.getElementById("state");
const correctCpfLength = 11;
const correctCnpjLength = 14;
const correctCellphoneLength = 11;
const correctPostalCodeLength = 8;

form.addEventListener("submit", (event) => {
  event.preventDefault();
  checkInput();
});

customerName.addEventListener("input", (event) => {
  checkName();
});

cpfCnpj.addEventListener("input", (event) => {
  let cpfCnpjValue = cpfCnpj.value;
  if (cpfCnpjValue.length == correctCpfLength) {
    checkCpf();
  } else {
    checkCnpj();
  }
});

cellphone.addEventListener("input", (event) => {
  checkCellphone();
});

postalCode.addEventListener("input", (event) => {
  checkPostalCode();
  checkAddress();
});

houseNumber.addEventListener("input", (event) => {
  checkHouseNumber();
});

email.addEventListener("input", (event) => {
  checkEmail();
});

function checkName() {
  const customerNameValue = customerName.value;
  if (!customerNameValue) {
    setErrorFor(customerName, "O seu nome é obrigatório!");
  } else {
    setSucessFor(customerName);
  }
}

function checkCpf() {
  let cpfCnpjValue = cpfCnpj.value;
  if (!cpfCnpjValue) {
    setErrorFor(cpfCnpj, "Preencha seu CPF");
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
    setErrorFor(cpfCnpj, "O cpf informado é inválido");
  } else {
    setSucessFor(cpfCnpj);
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
    setErrorFor(cpfCnpj, "O CNPJ informado é inválido");
  } else {
    setSucessFor(cpfCnpj);
  }
}

function checkEmail() {
  let emailValue = email.value;
  if (!emailValue) {
    setErrorFor(email, "O email é obrigatório");
  } else {
    setSucessFor(email);
  }
}

function checkCellphone() {
  let cellphoneValue = cellphone.value;
  if (!cellphoneValue) {
    setErrorFor(cellphone, "Digite seu número de telefone");
  } else if (cellphoneValue.length !== correctCellphoneLength) {
    setErrorFor(cellphone, "Número inválido");
  } else {
    setSucessFor(cellphone);
  }
}

function checkPostalCode() {
  let postalCodeValue = postalCode.value;
  if (!postalCodeValue) {
    setErrorFor(postalCode, "Favor informar o CEP!");
  } else if (postalCodeValue.length !== correctPostalCodeLength) {
    setErrorFor(postalCode, "O CEP informado está incorreto");
  } else {
    setSucessFor(postalCode);
  }
}
function checkHouseNumber() {
  let houseNumberValue = houseNumber.value;
  if (!houseNumberValue) {
    setErrorFor(houseNumber, "Favor informar número da residência");
  } else {
    setSucessFor(houseNumber);
  }
}

function checkInput() {
  let cpfCnpjValue = cpfCnpj.value;
  checkName();
  if (cpfCnpjValue.length == correctCpfLength) {
    checkCpf();
  } else {
    checkCnpj();
  }
  checkCellphone();
  checkPostalCode();
  checkHouseNumber();
  checkEmail();

  let formControls = form.querySelectorAll(".form-control");
  let formIsValid = [...formControls].every((formControl) => {
    return formControl.className === "form-control success";
  });

  if (formIsValid) {
    let infosCustomer = {};
    let data = new FormData(form);
    data.forEach(function (value, key) {
      infosCustomer[key] = value;
    });
    alert("Formulário enviado!");
    console.log("O formulário foi enviado");
    console.log(infosCustomer);
    form.reset();
    customerName.focus();
  }
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
