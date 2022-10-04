    function getSample(uint _stackID) view public returns (uint, uint, uint, uint, uint, uint, uint, uint, uint, uint) {
        Sample storage sample = samples[_stackID];
        return (sample.var1, sample.var2, sample.var3, sample.var4, sample.var5, sample.var6, sample.var7, sample.var8, sample.var9, sample.var10);
}
