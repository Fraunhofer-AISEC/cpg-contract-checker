pragma solidity >=0.4.22 <0.6.0;
contract example{
    uint lastcount; 
    struct fileDetail{ 
        string name;
        uint price;
    }

    mapping (uint => address[]) fileOwner; 
    mapping (uint => fileDetail) fileDetails; 
    uint[] saveId; 

    function getFileDetails(uint id) view public returns(string memory, uint){ 
        fileDetail storage up = fileDetails[id]; 
        return(up.name, up.price); 
    }

    function getAllSavedID() view public returns(uint[] memory){ 
        return saveId; 
    }

    function getOwners(uint id) view public returns(address[] memory){ 
        return fileOwner[id]; 
    }

    function getOwnersSize(uint id) view public returns(uint){ 
        return fileOwner[id].length; 
    }

    function createAsset(string memory name, uint price) public{
        uint id = now + lastcount;  

        fileDetail storage up = fileDetails[id]; 
        up.name = name; 
        up.price = price; 

        saveId.push(id) -1; 

        fileOwner[id].push(msg.sender); 

        lastcount = lastcount + 1; 
    }

    function addNewOwner(uint id) public{
        uint size = getOwnersSize(id); 
        fileOwner[id].push(msg.sender)+size; 
    }
}
