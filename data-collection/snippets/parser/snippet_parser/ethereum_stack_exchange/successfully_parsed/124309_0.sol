
pragma solidity ^0.8.0;

import "./OtherContract.sol";

    contract MainContract is Ownable {
    
        
        OtherContract OTHER;


         
        function setOtherContractAddress(address addr) public onlyOwner {
            OTHER = OtherContract(addr);
        }
}