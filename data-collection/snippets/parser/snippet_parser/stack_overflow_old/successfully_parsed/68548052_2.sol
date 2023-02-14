pragma solidity ^0.6.4;

library Count{
    struct hold{
        uint a;
        mapping( uint => bool ) isGood;
    }
    
    function subUint(hold storage s, uint b) external view returns (uint){
        require(s.a >= b); 
        return s.a - b;
        
    }
    
    function setA(hold storage s, uint _a) external returns (bool){
        s.a = _a;
    }
    
    function setGood(hold storage s, uint _a, bool _good) external returns (bool){
        s.isGood[_a] = _good;
        
        return true; 
    }
    
    function showGood(hold storage s, uint _a) external view returns (bool) {
        return s.isGood[_a];
    }

}
