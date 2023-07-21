

pragma solidity ^0.8.7;

import "./blockchain_tour.sol";

contract contracB {
 
    contractA public new;
    address public owner;

    constructor(address _contractAddress) {
        new = contractA(_contractAddress);
        owner = new.owner();
    }

    function callSetData(string memory _data) public {
    
    new.set_data(_data);
    }
}
