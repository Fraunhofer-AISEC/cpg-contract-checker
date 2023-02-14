'''
pragma solidity >=0.6.0;

contract Newjudge {

    uint public constant MAX_VOTES_PER_VOTER= 1;
    
    struct Entrociter {
        uint id;
        string name;
        string party;
        uint votes;

    }

event Voted ();
event NewEntrociter ();

mapping(uint => Entrociter) public entrociters;
uint public entrociterCount;

mapping(address => uint) public votes;

constructor() {
  entrociterCount = 0;
}

function vote(uint _entrociterID) public {
require(votes[msg.sender] <MAX_VOTES_PER_VOTER, "Voter has no votes left."); 
require(_entrociterID > 0 && _entrociterID <= entrociterCount, " Entrociter ID is out of range.");

votes[msg.sender]++;
Entrociter[_entrociterID].votes++;
Entrociter[entrociterCount] = Entrociter;
emit Voted();
}

function addEntrociter(string memory _name, string memory _party) public {
entrociterCount++;

Entrociter memory entrociter = Entrociter(entrociterCount, _name, _party, 0);
entrociter[entrociterCount] = entrociter;

emit NewEntrociter();
votes(entrociterCount);
    }

 }
