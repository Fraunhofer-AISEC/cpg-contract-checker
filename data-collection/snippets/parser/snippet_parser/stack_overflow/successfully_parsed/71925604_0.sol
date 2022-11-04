struct Participant{
    address participantAddress; 
    string team; 
    string personalDescription; 
    string secret 
}

mapping(address=>Participant) public participantsMapping;
