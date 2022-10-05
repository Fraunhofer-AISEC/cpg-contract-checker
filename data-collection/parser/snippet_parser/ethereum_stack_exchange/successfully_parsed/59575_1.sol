pragma solidity ^0.4.23;

contract tracking  {

  struct  data  {
    uint   ownernumber;
    uint   id;
  }

  uint value;
  mapping (uint256 => data) public  datamatching;

  function storedata (uint _ownernumber, uint _id) public {
    var  persondata  = datamatching[value];
    persondata .ownernumber = _ownernumber;
    persondata. id  =  _id;
  }

  function getData(uint256 userId) returns (uint, uint){
    return (datamatching[userId].ownernumber, datamatching[userId].id);
  }
}
