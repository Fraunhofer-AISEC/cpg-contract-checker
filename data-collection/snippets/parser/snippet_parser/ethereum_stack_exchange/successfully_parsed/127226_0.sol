

pragma solidity ^0.4.25;

contract Election {

uint public totalVotes;

struct Candidate {
    string name;
    uint voteCount;
}
Candidate[] public candidates;
struct Voter {
    bool authorized;
    bool voted;
    bool center_sel; 
    uint cen;        
    uint vote;   
} 
mapping(address => Voter) public voters;

struct Center {
    string name;       
    uint numOfVoters;  
    Candidate[] cands; 
}
Center[] public centers;

function addCandidate(string memory _name) public {
    candidates.push(Candidate(_name, 0));
}

function addCenter(string memory _cenName) public {

    require(centers.length < 3); 
    centers.length++;
    Center storage C = centers[centers.length - 1];

    C.name = _cenName;
    C.numOfVoters = 0;

   for (uint i = 0; i < candidates.length; i++) {
       C.cands.push(candidates[i]);
   }
 }
}
