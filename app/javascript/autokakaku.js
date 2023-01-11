window.addEventListener('load', function(){

  const itemPrice = this.document.getElementById("item-price")

  itemPrice.addEventListener("keyup", () => {
    const addTaxPrice = document.getElementById("add-tax-price") 
    addTaxPrice.innerHTML = `${Math.floor(itemPrice.value*0.1)}`;
    const profit = document.getElementById("profit")
    profit.innerHTML = `${Math.floor(itemPrice.value*0.9)}`;
  });
})
