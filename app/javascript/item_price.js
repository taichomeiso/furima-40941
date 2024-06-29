document.addEventListener('turbo:load', () => {
  const priceInput = document.getElementById("item-price");

  if (priceInput) {
    priceInput.addEventListener("input", () => {
      const inputValue = priceInput.value; 
      const addTaxDom = document.getElementById("add-tax-price");
      const salesProfit = document.getElementById("profit");

      if (inputValue && !isNaN(inputValue)) { 
        const taxValue = Math.floor(inputValue * 0.1); 
        addTaxDom.innerHTML = taxValue; 

        const totalProfit = Math.floor(inputValue - taxValue);
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












