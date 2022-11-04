pragma solidity ^0.4.4;
contract IScoreStore{
    function GetScore(string name) returns (int);
}

contract MyGame{
    function ShowScore(string name) returns (int)
    {
        IScoreStore scoreStore = IScoreStore(0xEB058f7E140991811ff815335DA5bB7e593c8359);
        return scoreStore.GetScore(name);
    }
}
