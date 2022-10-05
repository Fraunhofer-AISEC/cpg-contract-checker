
pragma solidity ^0.4.24;

contract A {
    
    uint256 public variable; 

    

    
    function setVariable(uint256 _variable) public returns (uint256) {
        variable = _variable;
    }

    
    function getVariable() public constant returns (uint256) {
        return variable;
    }
}

contract B {
    
    address public AContract; 

    

    
    function setAContract(address _AContract) public {
        AContract = _AContract;
    }

    
    function queryA() public constant returns (uint256) {
        return A(AContract).getVariable();
    }
}
