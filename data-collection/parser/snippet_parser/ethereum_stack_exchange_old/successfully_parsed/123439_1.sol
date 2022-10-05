


pragma solidity ^0.8.12;
contract Test{
        struct user{
          string firstName;
          string lastName;
          uint256 id;   
         }
        mapping(address=>user) public userData;
        function add(address _user,string memory _fname,string memory _lname,uint256 _id) public {
               userData[_user].firstName = _fname;
               userData[_user].lastName = _lname;
               userData[_user].id = _id;
        }
}
