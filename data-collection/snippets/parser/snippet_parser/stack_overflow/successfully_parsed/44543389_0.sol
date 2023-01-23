    function addDocument(address _user, bytes32 _docNo, 
    bytes32 _documentStatus,uint _documentScore,
    uint _createdDateStr) returns (bool status){

    DocumentDebuggingLog(block.timestamp, "Step 1",_user);

    Document memory document;
    DocumentDebuggingLog(block.timestamp, "Step 2",_user);
    document._customerAccountAddress= _user;
    document._documentNumber= _docNo;
    document._documentScore=_documentScore;
    document._documentStatus=_documentStatus;
    mapDocuments[_docNo]=document;
    mapUserDocNos[_user].push(_docNo);
    return true;
}
