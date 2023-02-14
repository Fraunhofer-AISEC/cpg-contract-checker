pragma solidity ^0.4.11;
contract test2 
{

    address creater;
    string username;
    string password;

    function testusernamepassword(string username,string password) returns (bool) 
    {
        if (username == "deepak" && password == "123") 
        {
            return true;
        }
        else
        {
            return false;
        }
    }
}
