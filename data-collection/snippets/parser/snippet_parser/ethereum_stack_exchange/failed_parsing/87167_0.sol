---Contract A---
function callExternal(address _externalContract, string _variableName) public {
  interface(_externalContract)._variableName
}


---Contract B---
uint256 public variableName;


---Contract C---
uint256 public aDifferentVariableName;
