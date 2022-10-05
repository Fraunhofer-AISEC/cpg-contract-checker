pragma "^0.7.0";

interface DoubleTrade {};  

contract Escrow {


constructor () payable {
...
}

function getValueFromDoubleTrade(address _doubleTradeContractAddress) external returns 
(uint256) {
   DoubleTrade _double = DoubleTrade(_doubleTradeContractAddress);
   return _double.value();  
}

}
