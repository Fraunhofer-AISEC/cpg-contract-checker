pragma solidity ^0.4.11;

contract Factory {

  address[] public pizzas;

  function Factory() {
    
  }

  function cookPizza() returns (address _pizza) {
    Pizza newPizza = new Pizza();
    pizzas.push(newPizza);
    return newPizza;
  }

  function getPizzas() public constant returns (address[]) {
    return pizzas;
  }
}

contract Pizza {
  function Pizza() {
    
  }
}
