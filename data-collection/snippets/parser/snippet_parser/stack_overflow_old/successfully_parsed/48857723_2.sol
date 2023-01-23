function createContract(string _var1, string _var2, uint32[] _var3,
        string _var4, string _var5, string _var6)
public returns (address contractAddress) {

    return new Contract(_var1, random1, random2, _var2,
        _var3, _var4, _var5, _var6);

}
