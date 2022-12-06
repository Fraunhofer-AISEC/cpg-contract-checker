pragma solidity 0.5.9;
contract MyContract{
   
   uint256  peopleCount;
   struct Person{
       string   _firstName;
       string   _lastName;
   }
   Person[]  public  people;
   function addPerson(string memory _firstName, string memory _lastName) public{
      
      people.push(Person(_firstName, _lastName));
      peopleCount += 1;
   }
    function  getFirstName() public view returns (string memory) {
       return people[0]._firstName;
   }
   function   getLastName() public view returns (string memory){
       return people[0]._lastName;
   }
      function setFirstName(string memory _val) public {
      people[0]._firstName = _val;
   }

}
