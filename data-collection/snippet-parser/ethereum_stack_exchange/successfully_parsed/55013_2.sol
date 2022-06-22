function Main(
    bytes32 _a,
    string _b,
    uint256 _c    
) public returns(bool _success, string _message) {

    (_success, _message) = validateDoc(_a, _b, _c); 

    if(_success) {
        
        
    }
    return (_success, _message);                
} 
