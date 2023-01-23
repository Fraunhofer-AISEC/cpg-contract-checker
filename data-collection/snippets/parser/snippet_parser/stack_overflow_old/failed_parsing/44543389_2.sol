FROM:
bytes32[] _documentNumber;
bytes32[] _documentStatus;
uint[] _documentScore;
TO:
uint256 arrLength = mapUserDocNos[_user].length
bytes32[] memory _documentNumber = new bytes32[](arrLength);
bytes32[] memory _documentStatus = new bytes32[](arrLength);
uint[] memory _documentScore = new uint[](arrLength);


Try below:
function getDocumentListByUser(address _user) returns (bytes32[] _docNumber, bytes32[] _docStatus,uint[] _docScore) {
    uint256 arrLength = mapUserDocNos[_user].length
    bytes32[] memory _documentNumber = new bytes32[](arrLength);
    bytes32[] memory _documentStatus = new bytes32[](arrLength);
    uint[] memory _documentScore = new uint[](arrLength);
    DocumentDebuggingLog(block.timestamp, "step 1 in getDocumentListByUser",_user);
    for(uint i=0;i<mapUserDocNos[_user].length;i++){
    
    
    _documentNumber.push( mapDocuments[mapUserDocNos[_user][i]]._documentNumber);
    _documentStatus.push( mapDocuments[mapUserDocNos[_user][i]]._documentStatus);
    _documentScore.push( mapDocuments[mapUserDocNos[_user][i]]._documentScore);
    }

    return (_documentNumber,_documentStatus,_documentScore);
}
