function calculateSellingPrice (){
  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const profitDom = document.getElementById("profit");

  priceInput.addEventListener("input", () => {
    const inputValue = parseFloat(priceInput.value);
    const tax = Math.floor(inputValue * 0.1);
    const profit = Math.floor(inputValue - tax);

    if (isNaN(inputValue) || inputValue < 0) {
      addTaxDom.innerHTML = '';
      profitDom.innerHTML = '';
      return;
    }

    if (inputValue >= 300) {
      addTaxDom.innerHTML = `${tax}`;
      profitDom.innerHTML = `${profit}`;
    } else {
      addTaxDom.innerHTML = '';
      profitDom.innerHTML = '';
    }
  })
};

window.addEventListener('turbo:load', calculateSellingPrice)