contract ProxyController is Base{

    string public contractKey = "a";
    mapping(string => Base) base;

    constructor() public {
       base["a"]=new ContractA();
       base["b"]=new ContractB();
    }

    function setContractKey(string _contractKey) public{
        contractKey = _contractKey;    
    }

    function getValue() public view returns (string){
        return base[contractKey].getValue();
    }

}
