pragma solidity ^0.4.25;

contract DinoFighter {

uint cooldownTime = 30 seconds;

struct Dino {
    string name;
    string color;
    uint readyTime;
    uint level;
    string status;
}

Dino[] public dinos;
mapping (uint => address) public dinoToOwner;

 modifier onlyOwner(uint _dinoId) {
     require(dinoToOwner[_dinoId] == msg.sender);
     _;
 }

function createDino(string _name, string _color) public {
    uint id = dinos.push(Dino("Velonica", "Brown", (now + cooldownTime), 0, "none")) - 1;
    dinoToOwner[id] = msg.sender;
}

function fightDino(uint _dinoId, uint _targetId) public onlyOwner(_dinoId) returns (string) {
    Dino storage myDino = dinos[_dinoId];
    Dino storage tDino = dinos[_targetId];
    if (uint((keccak256(now)) % 100) > 40) {
        myDino.level++;
        myDino.status = "king";
        tDino.readyTime = now + cooldownTime;
        tDino.status = "loser";
        return "Winner";
    } 
    else {
        tDino.level++;
        tDino.status = "king";
        myDino.readyTime = now + cooldownTime;
        myDino.status = "loser";
        return "Loser";
    }


}
}
