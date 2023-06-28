function changeOwnership(address aContract, address bAccount) returns (bytes32){
    MyContractType work = MyContractType(aContract);
    
    return work.getWorkName();
}
