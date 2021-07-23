function post (){
  const price = document.getElementById("item-price");
  price.addEventListener("input", (e) => {
    e.preventDefault();
    const inputValue = price.value;
    const result1 = inputValue * 0.1;
    const result2 = inputValue - result1
    const add_tax_price = document.getElementById("add-tax-price");
    add_tax_price.textContent = result1;
    const profit = document.getElementById("profit");
    profit.textContent = result2
  });
};



window.addEventListener('load', post);