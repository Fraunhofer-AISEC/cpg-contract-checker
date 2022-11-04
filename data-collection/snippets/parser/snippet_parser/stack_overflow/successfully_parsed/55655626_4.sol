pragma solidity >=0.4.22 <0.6.0;
import"./ContractA.sol";

contract ContractB is ContractA {
       function getContractAvalue() pure public returns(int){
           
           return ContractA.a;
       }
}
