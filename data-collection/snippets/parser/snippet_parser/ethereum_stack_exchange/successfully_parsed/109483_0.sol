
pragma solidity ^0.8.7;

import "./Business.sol";

contract Factory {
    
    address public businessContract;
    
    function create() external returns(address) {
        businessContract = address(new Business());
        return businessContract ;
    }

    function validate(address businessContractAddress) external returns(bool) {
        require(msg.sender == businessContract);
        return true;
    }
}
