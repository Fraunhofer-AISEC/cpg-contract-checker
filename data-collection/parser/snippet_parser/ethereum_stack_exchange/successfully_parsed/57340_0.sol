pragma solidity 0.4.24;

contract StructStore {
    mapping(uint256 => User) users;

    struct User {
        uint256 id;
        
        string[] data;
    }

    
    function newUser(uint256 _id) public {
        
        
        users[_id].id = _id;
    }

    
    function addData(uint256 _id, string _data) public {
        users[_id].data.push(_data);
    }

    
    function setData(uint256 _id, uint256 _index, string _newData) public {
        users[_id].data[_index] = _newData;
    }

    
    
    function getUserData(uint256 _id, uint256 _dataIndex) public view returns (string) {
        return users[_id].data[_dataIndex];
    }

    
    function getDataSize(uint256 _id) public view returns (uint256) {
        return users[_id].data.length;        
    }
}
