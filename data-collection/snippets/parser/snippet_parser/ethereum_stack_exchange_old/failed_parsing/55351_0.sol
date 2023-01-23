import ContractB.sol

contract ContractA {

    function createContractB(string _string1, string _string2) {
        address newContractB = new ContractB(_string1, _string2);
    }
}



import ContractC.sol

contract ContractB {

    constructor(string _string1, string _string2) {
        createContractC(_string1);
        createContractC(_string2);
    }

    function createContractC(string _string) {
        address newContractC = new ContractC(_string);
    }
}



contract ContractC {
    string thing;

    constructor(string _string) {
        thing = _string;
    }

}
