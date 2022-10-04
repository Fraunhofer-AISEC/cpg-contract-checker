pragma solidity 0.4.25;

contract RegisterCandidate {
    
    struct Address {
        string addressLine;
        string district;
        string state;
        uint pincode;     
    }

    
    struct Candidate {
        uint id;
        string name;
        Address addr;
        uint voteCount;
        uint age;
    }
    
    mapping(uint => Candidate) public candidates;
    mapping(uint => Address) public addresses;
    
    uint public candidatesCount;

    function addCandidate (string _name,uint _age,string _address,string _district,string _state,uint _pincode) public {
        candidatesCount ++;
        addresses[candidatesCount] = Address(_address,_district,_state,_pincode);
        candidates[candidatesCount] = Candidate(candidatesCount, _name,addresses[candidatesCount], 0, _age);
    }

}
