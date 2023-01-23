
pragma solidity >=0.8.0;

import "./ICRUD.sol";
contract CRUD is ICRUD {

    struct Data {
        uint id;
        bytes32 contentHash;
        string description;
    }
     
    Data[] data;

    function AddData(uint _id, bytes32 _contentHash, string memory _description) public {
    Data memory new_data = Data(_id, _contentHash, _description);
    data.push(new_data);
}

    function readAllData(uint index) external override view returns (uint, bytes32, string memory) {
        Data memory d = data[index];

        return (d.id, d.contentHash, d.description);
    }

} 
