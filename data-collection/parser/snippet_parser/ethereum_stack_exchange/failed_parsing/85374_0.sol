pragma solidity >=0.5.0 <0.7.0;
contract Mycontract{
    uint256 a;
    struct User
    {  string name; }
    User[] users;
    function foo() public{
      **User storage user=User("hey");**  
     users.push(user);
    }
    function get() public view returns(string memory)
    {   return users[0].name; }
}
