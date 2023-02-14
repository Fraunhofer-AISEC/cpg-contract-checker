function initialize(
    Request storage self,
    address[4]      _addressArgs,
    uint[12]        _uintArgs,
    bytes           _callData
) 
    public returns (bool)
{
    address[6] memory addressValues = [
        0x0,                
        _addressArgs[0],    
        _addressArgs[1],    
        _addressArgs[2],    
        0x0,                
        _addressArgs[3]     
    ];

    bool[3] memory boolValues = [false, false, false];

    uint[15] memory uintValues = [
        0,                  
        _uintArgs[0],       
        0,                  
        _uintArgs[1],       
        0,                  
        _uintArgs[2],       
        _uintArgs[3],       
        _uintArgs[4],       
        _uintArgs[5],       
        _uintArgs[6],       
        _uintArgs[7],       
        _uintArgs[8],       
        _uintArgs[9],       
        _uintArgs[10],      
        _uintArgs[11]       
    ];

    uint8[1] memory uint8Values = [
        0
    ];

    require(deserialize(self, addressValues, boolValues, uintValues, uint8Values, _callData));

    return true;
}
