pragma solidity ^0.5.7;

contract SimpleTest {

    DateTime dateTime;

    event LogInsertItemYYYMMDD(address sender, uint256 value, uint16 year, uint8 month, uint256 timeStamp);

    constructor(address dateTimeAddress) public  { 
        dateTime = DateTime(dateTimeAddress);      
    }

    function insertItemYYYYMM(uint256 _value, uint16 year, uint8 month, uint8 day) public returns (bool){
        uint256 time = dateTime.toTimestamp(year, month, day);
        emit LogInsertItemYYYMMDD(msg.sender, _value, year, month, time);
        return true;
    }
}
