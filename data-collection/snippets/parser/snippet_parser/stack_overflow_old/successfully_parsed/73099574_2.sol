
pragma solidity ^0.8.9;

contract Mood {
    string mood;
    function Setmood(string memory _mood) public {
        mood = _mood;
    }
    function Getmood() public view returns(string memory)
    {
        return mood;
    }
}
