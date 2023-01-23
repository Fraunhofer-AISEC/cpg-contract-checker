function addParticipant(address _Participant, uint _weight)public isOwner returns (bool) {
    require(_weight!=0,"weight cannot be null");
    require(status,"this Donation is closed");

    Participants[_Participant].weight = _weight;
    Participants[_Participant].status = true;
    ParticipantsIndex[ParticipantsIndexSize] = _Participant;
    ParticipantsIndexSize++;

    emit ParticipantAction(_Participant, 'added');
    return true;
  }
