pragma solidity ^0.4.21;

import "./TaxContract.sol";


contract AssetContract {
    address public owner;
    address contractAddress;

    
    constructor(address taxContractAddress) public {
        owner = msg.sender;
        contractAddress = taxContractAddress;
    }

    
    function sellAsset(int price) public {
        TaxContract(contractAddress).calculateTax(price);
    }
}
