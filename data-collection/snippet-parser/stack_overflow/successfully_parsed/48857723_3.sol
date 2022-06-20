function createContract(Library.ContractArgs _contractArgs)
public returns (address contractAddress) {

    return new Contract(_contractArgs, random1, random2);

}
