pragma solidity ^0.4.17;

contract Voting {

mapping (bytes32 => uint8) public votesReceived;
bytes32[] public candidateList;

constructor(bytes32[] _candidates) public {
    candidateList = _candidates;
}

function voteForCandidate(bytes32 _name) public returns (uint8) {
    require(validateCandidate(_name));
    votesReceived[_name] += 1;
    
    return totalVotesFor(_name);
}

function validateCandidate(bytes32 _name) view public returns (bool){
    for (uint8 i = 0; i < candidateList.length; i++) {
        if(candidateList[i] == _name){
            return true;
        }
    }
    return false;
}

function totalVotesFor(bytes32 name) view public returns (uint8){
    require(validateCandidate(name));
    return votesReceived[name];
}

function addCandidate(bytes32 _name) public returns (bool) {
    candidateList.push(_name);
    return validateCandidate(_name);
}


const assert = require('assert');
var Voting = artifacts.require("Voting");
}