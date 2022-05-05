function getCep() {
  let postalCode = document.getElementById('postalCode').value

  fetch(`https://viacep.com.br/ws/${postalCode}/json`).then(result => result.json()) 
  .then(data => { 
      if (!("erro" in data)) {
          document.querySelector('#address').value = data.logradouro
          document.querySelector('#province').value = data.bairro
          document.querySelector('#city').value = data.localidade
          document.querySelector('#state').value = data.uf
      } else {
          alert("CEP não encontrado");
      }
   })
}

document.getElementById('postalCode').addEventListener('focusout', getCep);


