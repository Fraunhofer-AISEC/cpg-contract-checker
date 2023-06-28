pragma solidity ^0.4.24;

contract IScoreStore{
    function GetScore(string name) public view returns (int);
}

contract MyGame{
    function ShowScore(string name) public view returns (int) {
        IScoreStore scoreStore = IScoreStore(0xEB058f7E140991811ff815335DA5bB7e593c8359);
        return scoreStore.GetScore(name);
    }
}
