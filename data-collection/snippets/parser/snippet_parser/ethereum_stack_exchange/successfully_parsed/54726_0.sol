pragma solidity ^0.4.24;

contract StackSample { 
    struct Sample {
        uint var1;
        uint var2;
        uint var3;
        uint var4;
        uint var5;
        uint var6;
        uint var7;
        uint var8;
        uint var9;
        uint var10;
    }

    mapping(uint => Sample) samples;

    function setSample(uint _stackID, uint _var1, uint _var2, uint _var3, uint _var4, uint _var5, uint _var6, uint _var7, uint _var8, uint _var9, uint _var10) public {
        var sample = samples[_stackID];

        sample.var1 = _var1;
        sample.var2 = _var2;
        sample.var3 = _var3;
        sample.var4 = _var4;
        sample.var5 = _var5;
        sample.var6 = _var6;
        sample.var7 = _var7;
        sample.var8 = _var8;
        sample.var9 = _var9;
        sample.var10 = _var10;
    }

    function getSample(uint _stackID) view public returns (uint, uint, uint, uint, uint, uint, uint, uint, uint, uint) {
        return (samples[_stackID].var1, samples[_stackID].var2, samples[_stackID].var3, samples[_stackID].var4, samples[_stackID].var5, samples[_stackID].var6, samples[_stackID].var7, samples[_stackID].var8, samples[_stackID].var9, samples[_stackID].var10);
    }
}
