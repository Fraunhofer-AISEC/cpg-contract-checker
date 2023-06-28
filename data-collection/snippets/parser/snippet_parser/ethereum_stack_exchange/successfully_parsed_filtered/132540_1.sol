interface ICRUD{
    function readAllData() external view returns (Data[] memory);
}

contract verifyData{

    function read() external{
        ICRUD.readAllData();
    }
}
