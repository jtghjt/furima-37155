window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input",() => {
    const productPrice = priceInput.value;
    const salesCommission = document.getElementById("add-tax-price");
    const salesProfit = document.getElementById("profit");
    salesCommission.innerHTML = productPrice * 0.1;
    salesProfit.innerHTML = productPrice - salesCommission.innerHTML;
  })
})