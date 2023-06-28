
function getCandidateInfo(uint _candidateId) public view returns (uint, 
string memory, string memory) {
    return(
        candidatesMap[_candidateId].candidateId,
        candidatesMap[_candidateId].CandidateName,
        candidatesMap[_candidateId].party
    );
}
