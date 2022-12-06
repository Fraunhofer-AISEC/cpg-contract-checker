pragma solidity ^0.6.0;

import "HelloWord.sol";
contract ContractA is HelloWord
{
   event LogString(
     string errore,
     string saluto
   );
   receive() external payable {
     emit LogString("errore receive saluto " ,  HelloWord.getSaluto() ); 
   }
}
