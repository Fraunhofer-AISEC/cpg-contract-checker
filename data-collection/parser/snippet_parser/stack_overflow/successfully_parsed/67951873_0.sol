
pragma solidity ^0.8.1;

import "./Fundraiser.sol";

contract FundraiserFactory {
   uint256 constant maxLimit = 20;
   Fundraiser[] private _fundraisers;

   event FundraiserCreated(Fundraiser indexed fundraiser, address indexed owner);

    function createFundraiser (string memory name) public  payable  {
        Fundraiser fundraiser = new Fundraiser( name,msg.value,msg.sender);
        _fundraisers.push(fundraiser);
    }
    function pay() public payable {
        _fundraisers[0].pay();
    }

}