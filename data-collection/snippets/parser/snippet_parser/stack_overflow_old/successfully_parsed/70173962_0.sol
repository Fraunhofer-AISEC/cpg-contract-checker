pragma solidity ^0.8.10;

import "@openzeppelin/contracts/token/ERC1155/IERC1155.sol";
import "@openzeppelin/contracts/token/ERC1155/IERC1155Receiver.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";


contract DutchAuction {

    uint public startTime;
    uint public endTime;

    uint public price;
    uint public startPrice;
    
    address public assetOwner;


    constructor(uint _startPrice, uint _endTime) public {
        startTime = block.timestamp;
        price = _startPrice;
        startPrice = _startPrice;
        endTime = _endTime;
        assetOwner = msg.sender;
        
    }

    function bid() public returns (string calldata) {
        return 'hello world';

    }
    
}
