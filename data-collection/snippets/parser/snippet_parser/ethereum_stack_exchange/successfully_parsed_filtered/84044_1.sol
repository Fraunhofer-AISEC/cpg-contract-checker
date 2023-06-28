function storeSurvey(uint _sNo, uint[] memory _response, uint[] memory _diseasesPredicted) public{
  surveyCount++;
  survey[surveyCount] = Survey(surveyCount,_sNo, _response, _diseasesPredicted, msg.sender);
  
  bool snr = seniorRegistered[msg.sender];
  
  if(snr)
  {
    senior[msg.sender].surveys.push(surveyCount);
  }
  else{
    people[msg.sender].surveys.push(surveyCount);
  }

  emit surveyStored(surveyCount,_sNo,_response,_diseasesPredicted,msg.sender);
}
