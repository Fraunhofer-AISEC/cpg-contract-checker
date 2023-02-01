function submitSurvey(string memory ipfshash,uint surveydeadline,uint numchoices, uint atmostchoice) public returns (uint surveyid) {
    User storage owner = users[msg.sender]; 
    require(isMember(owner), "1");
    require(owner.myGovTokens >=2, "2");
    require(owner.myGovTokens >2  || owner.myGovTokensLockedUntil <= block.timestamp, "3"); 
    uint[] memory results = new uint[](numchoices) ; 


    Survey memory mysurvey = Survey({
                Ipfshash : ipfshash,
                Owner: msg.sender,
                Deadline: surveydeadline,
                SurveyId: surveyid,
                AtmostChoice: atmostchoice,
                NumChoices: numchoices,
                NumTaken : 0,
                Results : results         
                });
    

    transferToken(address(this), 2);  
    address payable to_sc = payable(address(this));
    
    transfer(to_sc, surveyCreationFee); 
    donatedWei += surveyCreationFee; 

    surveys.push(mysurvey);
    surveyid = surveys.length - 1 ; 
    mysurvey.SurveyId = surveyid;
    return (surveyid);
}
