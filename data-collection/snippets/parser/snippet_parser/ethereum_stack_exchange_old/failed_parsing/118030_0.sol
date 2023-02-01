pragma "^0.7.0";
    
contract Escrow {
    uint256 public value;
    
    constructor () payable {
    ...
    }
    
    function getValueFromAnotherInstanceEscrow(address _anotherEscrowAddress) external returns 
    (bool) {
       Escrow _double = Escrow(_anotherEscrowAddress);  
       uint256 temp = _double.value();
       
       return true;
    }
}
