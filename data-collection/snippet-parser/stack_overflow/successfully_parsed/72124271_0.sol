    struct structPackage
    {
        uint256 ui;
        string[2] data;
    }

    
    mapping(address => structPackage) public mapping_data;

    constructor()
    {
        structPackage storage data_package = mapping_data[msg.sender];
        data_package.data[0] = "test1";
        data_package.data[1] = "test2";
    }

    
    function read() external view 
    returns (structPackage memory)
    {
        structPackage storage data_package = mapping_data[msg.sender];
        return data_package;
    }
