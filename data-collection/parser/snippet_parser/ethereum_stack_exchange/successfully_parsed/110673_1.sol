  
  User[] public registeredArray;
  function Listofuser()public view returns(address[] memory){
    registeredArray.push(userAcc);
    return registeredArray;
  }
