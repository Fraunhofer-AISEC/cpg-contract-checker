pragma solidity >=0.4.16 <0.6.0;

contract transfer {

    struct Asset {
        string name;
        uint price;
    }

    
    struct Owner {
        address[] ownerAddresses;
    }

    
    mapping(uint => Owner) owners;

    function createAsset(string memory name, uint price) public {
        
        uint id = getRandom();

        
        Asset memory newAsset = Asset(name, price);

        
        owners[id].ownerAddresses.push(msg.sender);
    }

    function transferProduct(uint id) public payable {
        owners[id].ownerAddresses.push(msg.sender);
    }

    
    function getOwners(uint id) public view returns (address[] memory) {
        return (owners[id].ownerAddresses);
    }

}
