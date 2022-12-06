pragma solidity ^0.4.15;

contract Storage {
  mapping (uint => uint) public users;
  uint[] public allData;

  event SetUserData(uint userId, uint data);

  function setUserData(uint userId, uint data) public {
    require(users[userId] == 0);
    
    users[userId] = data;
    
    allData.push(userId);
    SetUserData(userId, data);
  }

  function getUserData(uint userId) public returns (uint[] data) {
    if (users[userId] != 0) {
      
      allData.length = 0; 
      allData.push(users[userId]);
      return allData;
    } else {
      return data;
    }
  }
}
