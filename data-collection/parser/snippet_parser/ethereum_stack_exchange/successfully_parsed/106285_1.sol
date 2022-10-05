contract CodesIdCard is Ownable {  
    struct Code {
        bytes   Tid;         
        uint8   Hdr;         
        uint32  Time;        
        uint32  CoderId;     
        uint32  CustId;      
        uint64  ContractCode;        
        bytes   Sign;        
    }
    
    Code[]                                     private allCodes;      
    mapping (bytes => Code)                    private Tid2Fides;         
    mapping (uint32 => mapping (uint64 => bytes))   private CustIdCode2Tid;    

    
    
    function _addCode(
            bytes   memory  _Tid,
            uint8           _Hdr,
            uint32          _Time,
            uint32          _CoderId,
            uint32          _CustId,
            uint64          _ContractCode,
            bytes   memory  _Sign) private 
    {
        Code   memory    _Fc2 = Tid2Fides[_Tid] ;
        _Fc2.Tid     = _Tid;
        _Fc2.Hdr     = _Hdr;
        _Fc2.Time    = _Time;
        _Fc2.CoderId = _CoderId;
        _Fc2.CustId  = _CustId;
        _Fc2.ContractCode = _ContractCode;
        _Fc2.Sign    = _Sign;
        
        allCodes.push (_Fc2) ;
        Tid2Fides[_Tid] = _Fc2 ;
        CustIdCode2Tid[_CustId][_ContractCode] = _Tid;
    }
    
    function _eq_Tid (
            Code   memory  _Fc2,
            bytes  memory  _Tid) private pure returns (bool) 
    {
        if (_Fc2.Tid.length != _Tid.length) return false;
        for (uint i=0; i<_Fc2.Tid.length; i++)
            if (_Fc2.Tid[i] != _Tid[i]) return false;
        return true;
    }
    
    function exists_Tid (
            bytes   memory  _Tid
        ) public view returns (bool) 
    {
        return _eq_Tid(Tid2Fides[_Tid], _Tid);
    }

    function getFC_Tid (
            bytes   memory  _Tid
        ) public view returns (FidesCode memory) 
    {
        return Tid2Fides[_Tid];                              
    }
function mkCode2 (
            bytes   memory  _Tid,
            bytes   memory  _Epc,
            bool            _dupTidCode) public returns (bool) 
    {
        require ((_Epc.length == 106),    "mkCode2: length must be 106=42+64 _Epc=CODE+SIGN ");
        uint8           _Hdr        = Mylibrary.getHexCoded1Bytes(Mylibrary.substr(_Epc,  0,  2));
        uint32          _Time       = Mylibrary.getHexCoded4Bytes(Mylibrary.substr(_Epc,  2,  8));
        uint32          _CoderId    = Mylibrary.getHexCoded4Bytes(Mylibrary.substr(_Epc, 10,  8));
        uint32          _CustId     = Mylibrary.getHexCoded4Bytes(Mylibrary.substr(_Epc, 18,  8));
        uint64          _ContractCode= Mylibrary.getHexCoded8Bytes(Mylibrary.substr(_Epc, 26, 16));
        bytes   memory  _Sign       = Mylibrary.substr(_Epc, 42, 64);
        return mkCode2(_Tid, _Hdr, _Time, _CoderId, _CustId, _ContractCode, _Sign, _dupTidCode);
    }
}