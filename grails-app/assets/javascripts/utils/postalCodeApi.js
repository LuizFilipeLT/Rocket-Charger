var validatePostalCode = function (postalCode) {
  return /^[0-9]{8}$/.test(postalCode);
};

var postalCodeLength = 8;

var getPostalCode = async (postalCode, callbackFunction) => {
  if (postalCode.length !== postalCodeLength) {
    return;
  }
  let url = `https://viacep.com.br/ws/${postalCode}/json`;
  let dados = await fetch(url);
  let data = await dados.json();
  callbackFunction(data);
};
