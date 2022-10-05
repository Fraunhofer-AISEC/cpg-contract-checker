interface IContractB {
    function methodFromContractB(address account) external;
}
contract ContractA is ERC1155, Ownable {
    IContractB contractB;
    constructor(address _contractB) ERC1155("...") {
        contractB = IContractB(_contractB);
    }
    function myMethod(address something) public {
        _burn(something, 0, 1);
        
        contractB.methodFromContractB(something);
    }
}
