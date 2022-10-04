pragma solidity ^0.6.0;

interface Shop {
    function buy() external;
    function isSold() external returns (bool);
}

contract CheapBuyer {

  Shop cheapShop = Shop(0x562935467272EEBeEBeF4D9502284AF6C062e5Dd);

  function tryBuy() public {
      if (!cheapShop.isSold()) {
          cheapShop.buy();
      }
  }
}
