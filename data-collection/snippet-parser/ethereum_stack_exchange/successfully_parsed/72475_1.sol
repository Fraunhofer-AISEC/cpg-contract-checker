import "./file_evi.sol";
contract caseEvidence{
    uint CODE_SUCCESS = 0;
    uint FILE_NOT_EXIST = 3002;
    uint FILE_ALREADY_EXIST  = 3003;
    uint USER_NOT_EXIST = 3004;

mapping(uint => address) caseEvidenceMap;
event SaveEvi(address _oper,uint _time,uint _caseId);
event GetEvi(address _oper,uint _time,uint _caseId);

function saveEvidence(uint caseId,bytes fileHash,uint fileUploadTime) public returns(uint code,address addr){
    address fileEviAddr = caseEvidenceMap[caseId];
    if (fileEviAddr == 0) {
      fileEviAddr = new fileEvidence(); 
      caseEvidenceMap[caseId] = fileEviAddr;
    } 
    fileEvidence fileEvi = fileEvidence(fileEviAddr);
    fileEvi.saveFileEvi(fileHash,fileUploadTime);
    emit SaveEvi(fileEviAddr,fileUploadTime,caseId);
    return (0,fileEviAddr);
}

function getEviAddr(uint caseId) public view returns(address addr){
    return caseEvidenceMap[caseId];
}
function getEvidence(uint caseId,bytes fileHash) public view returns(uint _code,bytes memory _hash,uint _upTime,address _upOperator) {
    address fileEviAddr = caseEvidenceMap[caseId];
    fileEvidence fileEvi = fileEvidence(fileEviAddr);
    (_upTime,_upOperator) = fileEvi.getFileEvi(fileHash);

    if(_upTime == 0){
        return (FILE_NOT_EXIST,"",0,msg.sender);
    }
    return (CODE_SUCCESS,fileHash,_upTime,_upOperator);
}

}
