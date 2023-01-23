pragma solidity ^0.5.9;

contract ListingGenerator {
    
   Listing[] public deployedListings;

    
    function createListing(uint assessedValue, uint listPrice, string memory description, string memory location) public {
       Listing newListing = new Listing(assessedValue, listPrice, description, location, msg.sender);
        deployedListings.push(newListing);
    }

    
    function getDeployedListings() public view returns (Listing[] memory){
        return deployedListings;
    }
}

contract Listing {
    uint public assessedValue;
    uint public listPrice;
    string public description;
    string public location;
    address public seller;
    bool public sold;
    mapping(address => bool) public buyers;
    uint public buyersCount;

    modifier restricted() {
        require(msg.sender == seller);
        _;
    }

    constructor(uint propertyValue, uint salePrice, string memory propertyDetails, string memory propertyLocation, address owner) public {
        propertyValue = assessedValue;
        listPrice = salePrice;
        description = propertyDetails;
        location = propertyLocation;
        seller = owner;
        }

    function confirmSale(uint confirm) public restricted returns(bool) {
        if (confirm == 1) {
            sold = true;
            return sold;
        }
    }
}
