function FillAddressController() {
  this.init = function() {
    $(document).ready(function () {
      var postalCode = document.getElementById("postalCode");
    
      postalCode.addEventListener("input", function () {
        if (!postalCode) {
          return;
        }
        validatePostalCode(this.value), getPostalCode(this.value, fillAddress);
      });
    
      function fillAddress(data) {
        if (data.erro) {
          alert(`O cep ${postalCode.value} não foi localizado.`);
          return;
        }
        document.querySelector("#address").value = data.logradouro ? data.logradouro : "";
        document.querySelector("#district").value = data.bairro ? data.bairro : "";
        document.querySelector("#city").value = data.localidade ? data.localidade : "";
        document.querySelector("#state").value = data.uf ? data.uf : "";
      }
    });
  }
}
var fillAddressController;

$(document).ready(function() {
    fillAddressController = new FillAddressController();
    fillAddressController.init();
});
