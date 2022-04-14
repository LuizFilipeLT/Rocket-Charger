function checkAddress() {
  let postalCode = document.querySelector("#postalCode").value;
  let correctPostalCodeLength = 8;
  if (postalCode.length == correctPostalCodeLength) {
    let url = `https://viacep.com.br/ws/${postalCode}/json/`;

    fetch(url).then(function (response) {
      response.json().then(showAddress);
    });
  }
}

function showAddress(data) {
  let address = document.querySelector("#address");
  let province = document.querySelector("#province");
  let state = document.querySelector("#state");
  let city = document.querySelector("#city");
  let complement = document.getElementById("complement");

  if (!data.erro) {
    setSucessFor(postalCode),
      setSucessFor(address),
      setSucessFor(province),
      setSucessFor(state),
      setSucessFor(city),
      setSucessFor(complement);
    address.value = `${data.logradouro}`;
    province.value = `${data.bairro}`;
    state.value = `${data.uf}`;
    city.value = `${data.localidade}`;
    return;
  }

  setErrorFor(postalCode, "Não foi possível localizar o endereço"),
    (address.value = "");
  province.value = "";
  state.value = "";
  city.value = "";
}
