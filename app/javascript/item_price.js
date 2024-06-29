document.addEventListener('turbo:load', () => {
  const priceInput = document.getElementById("item-price");

  if (priceInput) {
    priceInput.addEventListener("input", () => {
      const inputValue = priceInput.value; 
      const addTaxDom = document.getElementById("add-tax-price");
      const salesProfit = document.getElementById("profit");

      function isNumeric(value) {
        return !isNaN(parseFloat(value)) && isFinite(value);
      }

      if (inputValue && isNumeric(inputValue)) { 
        const taxValue = Math.floor(parseFloat(inputValue) * 0.1); 
        addTaxDom.innerHTML = taxValue; 

        const totalProfit = Math.floor(parseFloat(inputValue) - taxValue);
        salesProfit.innerHTML = totalProfit;
      } else if (inputValue === '') {
        addTaxDom.innerHTML = ""; 
        salesProfit.innerHTML = "";
      } else {
        addTaxDom.innerHTML = "NaN"; 
        salesProfit.innerHTML = "NaN";
      }
    });
  }
});

// gpt先生が修正しまくりました
