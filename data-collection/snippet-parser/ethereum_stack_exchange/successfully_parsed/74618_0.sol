contract Parent {
  mapping (address=>Child) public childObjects;

  function modify(address grantee, address newGrantee) external {
    Child child = childObjects[address(grantee)];
    child.grantee = address(newGrantee); 

    delete childObjects[address(grantee)];
    childObjects[address(newGrantee)] = child;
  }
}

contract Child {
    address public grantee;
    
}
