function Main(
    bytes32 _a,
    string _b,
    uint256 _c    
) public returns(bool, string) {

    validateDoc(_a, _b, _c); 

    
    
    return (true, "success message");                
} 
