pragma solidity ^0.5.0;

contract SimpleStorage{
    uint myData;
    
    function setData(uint newData) public payable{
        assert(newData >1);
        myData = newData;
    }
    
    function getData() public view returns(uint){
        return myData;
    }
}
