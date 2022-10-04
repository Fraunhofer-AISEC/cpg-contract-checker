contract fileEvidence{
    struct FileEvi{
        uint caseId;
        bytes fileHash;
        uint upTime;
        address upOperator;
    }
    mapping(bytes => FileEvi) evi;
    constructor () public{
    }
    function saveFileEvi(bytes _hash,uint _upTime ) public{
        evi[_hash].fileHash = _hash;
        evi[_hash].upTime = _upTime;
        evi[_hash].upOperator = msg.sender;
    }
    function getFileEvi(bytes _hash) public view returns(uint _upTime,address _upOperator) {
        _upTime = evi[_hash].upTime;
        _upOperator = evi[_hash].upOperator;
    }
}
