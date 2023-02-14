
pragma solidity ^0.8.0;


import "verifyData.sol";

contract CRUD is ICRUD {
    
    Data[] data;

    uint nextId;

    

    
    function createData(string memory _description) public{
        bytes32 contentHash = createHash(_description);
        data.push(Data(nextId, contentHash, _description));
        nextId++;
    }

    
    function readData(uint _id) public view returns (uint, bytes32,string memory) {
        uint index = findIndex(_id);
        return (data[index].id, data[index].contentHash, data[index].description);
    }

    
    function readDataByHash(bytes32 _hash) public view returns (uint, bytes32,string memory) {
        uint index = findByHash(_hash);
        return (data[index].id, data[index].contentHash, data[index].description);
    }

    
    
    function readAllData() override external view returns (Data[] memory){
        return data;
    }

    function count() external view returns (uint){
        return data.length;
    }

    
    function updateData(uint _id, string memory _description) public returns (uint, bytes32, string memory){
        uint index =  findIndex(_id);
        bytes32 contentHash = createHash(_description);
        data[index].contentHash= contentHash;
        data[index].description = _description;
        return (data[index].id, data[index].contentHash, data[index].description);
    }

    
    function deleteData(uint _id) public{
        uint index = findIndex(_id);
        delete data[index];
    }

    
    function createHash(string memory _description) internal pure returns (bytes32){
        return keccak256(abi.encodePacked(_description));
    }

    
    function findIndex(uint _id) internal view returns (uint) {
        for (uint i = 0; i < data.length; i++) {
            if (data[i].id == _id) {                
                return i;
            }
        }
        revert("Data not found");
    }

    
    function findByHash(bytes32 _contentHash) internal view returns (uint) {
        for (uint i = 0; i < data.length; i++) {
            if (data[i].contentHash == _contentHash) {                
                return i;
            }
        }
        revert("Data not found");
    }
}
