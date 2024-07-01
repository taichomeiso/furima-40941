function updatePriceCalculations() {
  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const salesProfit = document.getElementById("profit");

  if (priceInput) {
    priceInput.addEventListener("input", () => {
      const inputValue = priceInput.value.trim();

      if (inputValue && !isNaN(inputValue)) {
        const price = parseFloat(inputValue);
        const taxValue = Math.floor(price * 0.1);
        const totalProfit = Math.floor(price - taxValue);

        addTaxDom.textContent = taxValue;
        salesProfit.textContent = totalProfit;
      } else {
        addTaxDom.textContent = inputValue === '' ? '' : "NaN";
        salesProfit.textContent = inputValue === '' ? '' : "NaN";
      }
    });
  }
}

// 最初のページ読み込み時に実行
document.addEventListener('turbo:load', updatePriceCalculations);

// Turboフレームが置き換えられたときに再度実行
document.addEventListener('turbo:render', updatePriceCalculations);
