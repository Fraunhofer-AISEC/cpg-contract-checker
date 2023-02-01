    contract Insurer {
    bytes16 public insurerUIC;  
    bytes16 public insurerName;

    constructor(bytes16 _insurerUIC, bytes16 _insurerName) public {
        insurerUIC      = _insurerUIC;
        insurerName     = _insurerName;
        } 

    function () payable external {
        
    } 

    function getInsurerInfo() view public returns (bytes16, bytes16) {
        return (insurerUIC, insurerName);
        } 

    } 
