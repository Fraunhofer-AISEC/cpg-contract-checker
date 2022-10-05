    function getSample(uint _stackID) view public returns (uint, uint, uint, uint, uint, uint, uint, uint, uint, uint) {
        return (samples[_stackID].var1, samples[_stackID].var2, samples[_stackID].var3, samples[_stackID].var4, samples[_stackID].var5, samples[_stackID].var6, samples[_stackID].var7, samples[_stackID].var8, samples[_stackID].var9, samples[_stackID].var10);
}
