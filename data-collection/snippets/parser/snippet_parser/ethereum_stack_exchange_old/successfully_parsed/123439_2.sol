


pragma solidity ^0.8.12;
contract Test{
        struct user{
                address _address;
                string firstName;
                string lastName;
                uint256 id;   
         }
        mapping(address=>user) userData;
        function add(address _user,string memory _fname,string memory _lname,uint256 _id) public {
               userData[_user]._address = _user;
               userData[_user].firstName = _fname;
               userData[_user].lastName = _lname;
               userData[_user].id = _id;
        }

        function getUser() public view returns(address){
                require(userData[msg.sender]._address == msg.sender , "You are not allowed.");
                return userData[msg.sender]._address;
        }
}
