
pragma solidity >=0.7.0 <0.9.0;

contract INarray {
    address  owner;

    constructor() {
        owner = msg.sender;
    }

    struct dbarray {
        string value1;
        string value2;
        string value3;
        string value4;
        string value5;
        string value6;
        string value7;
        string value8;
        string value9;
        string value10;
        uint256 timestamp;
    }
    
    mapping(string => dbarray ) public arr;

   dbarray [] dbarrays;

    function getOwner() public view returns (address) {
        return owner;
    }


    function setarray(string memory value1,string memory value2, string memory value3,string memory value4,string memory value5,string memory value6,string memory value7,string memory value8,string memory value9,string memory value10) public returns(bool success) {

        dbarrays.push(
            dbarray (
                value1,
                value2,
                value3,
                value4,
                value5,
                value6,
                value7,
                value8,
                value9,
                value10,
                block.timestamp
            )
        );
  
        return true;

    }


    function getAllArray() public view returns(dbarray [] memory) {
        return dbarrays;

        
    }

}
