pragma solidity >=0.5.16 <0.9.0;

contract Bottle {
    
   
    string newName;

   function setName(string memory _name) public returns(string memory) {
      newName = _name;
      return newName;
   }

    function getGreeting() view public returns(string memory){
        return newName;
    }

}
