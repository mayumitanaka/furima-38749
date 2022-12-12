window.addEventListener('load', () => {
  const priceInput = document.getElementById('item-price');
  priceInput.addEventListener('input', () => {
    const inputValue = priceInput.value.toLocaleString();
    const tax = 0.1;
    const taxFee = Math.floor(inputValue * tax);

    const addTaxDom = document.getElementById('add-tax-price');
    addTaxDom.innerHTML = taxFee.toLocaleString();

    const profit = document.getElementById('profit');
    profit.innerHTML = Math.floor(inputValue - taxFee).toLocaleString();
  })
});