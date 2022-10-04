pragma solidity ^0.5.0;

contract memeRegistry {
    string url;
    string name;
    uint timestamp;

    function setmeme(string _url,string _name, uint _timestamp) public{
        url = _url;
        name = _name;
        timestamp = _timestamp;   
    }
}
