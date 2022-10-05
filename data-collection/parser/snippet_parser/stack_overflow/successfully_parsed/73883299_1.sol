    function addParticipant(string memory _name, string memory _pass, address _pAdd, string 
     memory _pType) public returns (uint32)

{
    uint32 userId = participant_id++;
    participants[userId].userName = _name;
    participants[userId].password = _pass;
    participants[userId].participantAddress = _pAdd;
    participants[userId].participantType = _pType;

    return userId;
 }
