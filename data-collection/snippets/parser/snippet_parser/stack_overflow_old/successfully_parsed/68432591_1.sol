 struct participant {
    string userName;
    string password;
    string participantType;
    address participantAddress;
}
function getParticipantDetails(uint32 _p_id) public view returns (string,address,string) {
    return (participants[_p_id].userName, participants[_p_id].participantAddress, participants[_p_id].participantType);
}
