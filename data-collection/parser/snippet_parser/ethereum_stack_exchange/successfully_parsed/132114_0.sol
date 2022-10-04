
pragma solidity 0.8.6;

struct Person {
       string name;
       uint8 age;
}
    
contract PersonContract {
      Person private  _data;
      
      function getPerson() public view returns(Person memory) {
         return _data;
      }
      function setPerson(Person memory person_) public {
         _data = person_;
      }
}
