pragma solidity ^0.4.19;


contract Test{

struct structGame
{
    uint256 value;
    string name;
    bool active;
}

mapping(uint256=>structGame) public mapGame;

function AddGame(uint id,uint value,string name){
    structGame memory game = structGame(value,name,true);
    mapGame[id] = game;
}

function GetGame(uint id) view returns (uint value,string name, bool active)
{
    return (mapGame[id].value,mapGame[id].name,mapGame[id].active);
}

function deleteGame(uint id){
    delete mapGame[id];
}

modifier gameExist(uint id)
{
    require (mapGame[id].active);
    _;
}

function GetGameVerified(uint id) view gameExist(id) returns (uint value,string name, bool active)
{
     return (mapGame[id].value,mapGame[id].name,mapGame[id].active);
}


}
