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
        uint voteCount;
        uint age;
    }
    
    mapping(uint => Candidate) candidates;  
    mapping(uint => Address) public addresses;
    
    uint public candidatesCount;

    function getCandidate(uint key) public view returns(string name, string addressLine, string district, string state, uint pincode, uint voteCount, uint age) {
        Address storage a = addresses[key];
        Candidate storage c = candidates[key];
        return (c.name, a.addressLine, a.district, a.state, a.pincode, c.voteCount, c.age);
    }

    function addCandidate (string _name,uint _age,string _address,string _district,string _state,uint _pincode) public {
        candidatesCount ++;
        addresses[candidatesCount] = Address(_address,_district,_state,_pincode);
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0, _age);
    }

}
