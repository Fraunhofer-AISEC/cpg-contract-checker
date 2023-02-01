pragma solidity ^0.4.6;



contract Arrays{
    
    
    bool[2][] flags;
    
    function Arrays() {
        
        flags.push([true,true]);
    }
    
    function appendFlag() returns(uint length) {
       
       return flags.push([true,true]);
    }
    
    
    
    function getFlags(uint index) constant returns(bool[2] flagList) {
        return(flags[index]);
    }
    
    
    function getFlag(uint dynamicIndex, uint lengthTwoIndex) constant returns(bool flag) {
        return flags[dynamicIndex][lengthTwoIndex];
    }
    
    
    function getFlagsCount() constant returns(uint count) {
        return flags.length;
    }
    
}
