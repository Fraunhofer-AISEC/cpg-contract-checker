
pragma solidity 0.8.13;
    
contract Carshop{
    
    
    address[] carAssets;
    
    constructor() {      
    }

    function createChildContract(string memory brand, string memory model) public payable{
        
        address newCarAsset = address(new CarAsset(brand, model, msg.sender));
        carAssets.push(newCarAsset);
    }

    function getDevelopedChildContracts() public view returns (address[] memory){
        return carAssets;
    }
}

contract CarAsset{
    string public brand;
    string public model;
    
    address public owner;
    
    
    constructor(string memory _brand, string memory _model, address _owner) {
        brand = _brand;
        model = _model;
        owner = _owner;
    }
}
