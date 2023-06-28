pragma solidity ^0.4.4;
contract IScoreStore{
    function GetScore(string name) returns (int);
}
contract MyGame{
    function ShowScore(string name) returns (int){
        
        IScoreStore ss = IScoreStore(0x6c38cfb90e8fb1922e61ea4fbe09d29c7751bf82); 
        return ss.GetScore(name);
    }
}
