pragma solidity ^0.4.24;

import './Crud.sol';

contract Store{
  address private owner;
  mapping(string=>Product) productDetails;
  mapping(string=>Order) orderDetail;
  struct Product{
      string description;
      uint price;
  }
  struct Order{
      string deliveryAddress;
      uint phone;
  }

  constructor(address creator) public {
    owner = creator;
  }

  modifier restricted(){
      require(msg.sender==owner);
      _;
  }

   using HitchensUnorderedKeySetLib for HitchensUnorderedKeySetLib.Set;
    HitchensUnorderedKeySetLib.Set products;
    HitchensUnorderedKeySetLib.Set orders;

    event StoreUpdate(address sender, string action, bytes32 key);
    event OrderUpdate(address sender, string action, bytes32 key);

    function addProductToStore(bytes32 product) public restricted {
        products.insert(product);
        emit StoreUpdate(msg.sender, "insert", product);
    }

    function addOrders(bytes32 order) public {
        orders.insert(order);
        emit OrderUpdate(msg.sender, "insert", order);
    }

    function removeProductToTheStore(bytes32 product) public restricted {
        products.remove(product);
        emit StoreUpdate(msg.sender, "remove", product);
    }

      function removeOrder(bytes32 order) public restricted {
        orders.remove(order);
        emit OrderUpdate(msg.sender, "remove", order);
    }

    function countProducts() public view returns(uint) {
         return products.count();
    }

    function countOrders() public restricted view returns(uint) {
         return orders.count();
    }


    function getProducts(uint index) public view returns(bytes32 ) {
        return products.keyList[index];
    }

    function getOrders (uint index) public view returns(bytes32 ) {
    return orders.keyList[index];
    }

}



contract StoreFactory {
  address[] private deployedStores;

  function createStore() public {
    deployedStores.push(new Store(msg.sender));
  }

  function getDeployedStores() public view returns (address[]){
    return deployedStores;
  }
}


