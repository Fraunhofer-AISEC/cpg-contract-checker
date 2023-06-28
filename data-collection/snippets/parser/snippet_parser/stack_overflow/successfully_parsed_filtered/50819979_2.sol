contract ContractA is Base, ControlledAccess{

    function getValue() public view onlyController returns (string){
        return "Hi";
    }

}

contract ContractB is Base, ControlledAccess{

    function getValue() public view onlyController returns (string){
        return "Hello";
    }

}    
