pragma solidity >=0.4.21 <0.6.0;
contract PlaceList {

    struct hoge {
    uint id;
    address user;
  }

  hoge[] public hoges;

  constructor() public {
    admin = msg.sender;
  }

  function set(uint id) public {
    hoges.push(hoge(id, msg.sender));
  } 

  function getId() public view returns(uint) {
    return (hoges[0].id);
  } 
}
