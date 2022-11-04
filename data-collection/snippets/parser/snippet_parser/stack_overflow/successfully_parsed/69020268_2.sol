pragma solidity ^0.8;

contract MyContract {
    uint public productIndex;
    mapping (address => mapping(uint => Product)) stores;

    struct Product {
        uint id;
        string name;
        string category;
        
        mapping (address => mapping(bytes32 => Bid)) bids;
    }

    struct Bid {
        address bidder;
        
    }

    function addProductToStore(
        string calldata _name,
        string calldata _category
        
    ) external {
        productIndex += 1;
        Product storage product = stores[msg.sender][productIndex];
        product.name = _name;
        product.category = _category;
        
    }
}
