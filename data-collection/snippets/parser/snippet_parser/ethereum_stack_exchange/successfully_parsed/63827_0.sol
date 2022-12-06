contract ContractA {
    constructor (uint _id) public {} 
}


contract ContractB {

    ContractA ContractAReal;

    constructor (ContractA _metaContractA) public {
        ContractAReal = _metaContractA;
    }
}
