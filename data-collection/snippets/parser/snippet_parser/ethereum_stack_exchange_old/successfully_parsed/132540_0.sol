contract CRUD {
    
    struct Data {
        uint id;
        bytes32 contentHash;
        string description;
    }
     
    Data[] data;

    function readAllData() external view returns (Data[] memory){
        return data;
    }
}
