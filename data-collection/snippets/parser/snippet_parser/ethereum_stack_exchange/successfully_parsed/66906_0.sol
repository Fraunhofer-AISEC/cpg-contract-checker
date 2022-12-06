address[] child;

function createChildContract() onlyOwner public{
    address newChild = new Child(msg.sender);
    child.push(newChild);
    emit ChildCreated(newChild);
}

contract Child {
   address public owner;

constructor(address _owner) public{
    owner = _owner;
}

function getOwner() external view returns(address){
    return owner;
}
}