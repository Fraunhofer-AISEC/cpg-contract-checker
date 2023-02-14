pragma solidity > 0.6.0 < 0.7.0;

import "github.com/provable-things/ethereum-api/provableAPI_0.6.sol";

contract LoanContract is usingProvable {  
    address payable public ME = 0x6252039C9037A49a62f17edbdb26D9bDFffa9dF2;
    uint public balance;

     ...
     ...
     fallback() external payable {balance = address(this).balance;}
     function AddLender() payable public {
           balance = address(this).balance;
           num_lenders += 1;
     }
    function BPAYOUT() public {
     
        ME.transfer(address(this).balance);
        balance = address(this).balance;
        
        return;
    }
}
