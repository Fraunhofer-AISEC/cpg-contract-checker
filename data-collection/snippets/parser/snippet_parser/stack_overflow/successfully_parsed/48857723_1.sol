function createContract(string[] _var1, uint32[] _var2)
public returns (address contractAddress) {

    return new Contract(_var1, random1, random2, _var2);

}
