function getDocumentListByUser(address _user) returns (bytes32[] _docNumber,
    bytes32[] _docStatus,uint[] _docScore){
    bytes32[] _documentNumber;
    bytes32[] _documentStatus;
    uint[] _documentScore;
    DocumentDebuggingLog(block.timestamp, "step 1 in getDocumentListByUser",_user);
    for(uint i=0;i<mapUserDocNos[_user].length;i++){
    
    
    _documentNumber.push( mapDocuments[mapUserDocNos[_user][i]]._documentNumber);
    _documentStatus.push( mapDocuments[mapUserDocNos[_user][i]]._documentStatus);
    _documentScore.push( mapDocuments[mapUserDocNos[_user][i]]._documentScore);
    }

    return (_documentNumber,_documentStatus,_documentScore);
}
