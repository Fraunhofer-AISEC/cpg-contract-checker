pragma solidity ^0.6.4;

library Count{
    struct hold{
        uint a;
        mapping( uint => bool ) isGood;
    }
    
    function subUint(hold storage s, uint b) external view returns(uint){
        
        require(s.a >= b); 
        return s.a - b;
        
    }

}
