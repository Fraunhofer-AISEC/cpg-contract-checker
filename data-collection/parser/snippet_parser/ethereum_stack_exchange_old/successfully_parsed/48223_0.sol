function addCandidate(bytes32 _name, bytes32 _party) public{
    
    
    candidates.length++;
    candidates[candidates.length-1].id = candidates.length-1;
    candidates[candidates.length-1].name = _name;
    candidates[candidates.length-1].party = _party;
    LogNewCandidate(msg.sender,candidates.length-1,_name,_party);
}
