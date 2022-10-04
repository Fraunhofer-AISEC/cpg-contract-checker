pragma solidity >0.4.99 <0.6.0;
contract simple{

  address payable[] private addressIndex;
  uint price = 100;

  
  function distribute() private returns (uint) {

    uint amount = (address(this).balance-1) / addressIndex.length;
    for (uint i = 0; i < addressIndex.length; i++) {
      addressIndex[i].transfer(amount); 
    }
    return amount;
  }

  function () external payable {

    if ( msg.value != price ) { revert(); }
    addressIndex.push(msg.sender);
    distribute();
  }

}
