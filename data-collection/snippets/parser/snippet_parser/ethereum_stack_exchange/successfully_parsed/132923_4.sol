
pragma solidity ^0.8.4;

interface ICRUD {
    
    struct Data {
        uint id;
        bytes32 contentHash;
        string description;
    }

    function readAllData() external view returns (Data[] memory); 
}

contract verifyData is ICRUD {
    ICRUD ICrud;
    
    
    constructor(address _interfaceAddress) {
        ICrud = ICRUD(_interfaceAddress);
    }

    function readAllData() override external view returns (Data[] memory){
        Data[] memory data = ICrud.readAllData();
        return data;
    }
}
