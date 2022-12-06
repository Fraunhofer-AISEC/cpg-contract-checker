pragma solidity ^0.4.21;

contract Parent {
    uint public childCount;
    Child[] public children;

    function makeChild(string name) external {
        children.push(new Child(address(this), childCount, name));
        childCount++;
    }

    function renameChild(uint index, string newName) external {
        require(address(children[index]) != 0);
        Child thisChild = Child(address(children[index]));
        if (thisChild.isUpdated()) {
            thisChild.rename(newName);
        }
    }
}

contract Child {
    address parentAddress;
    uint index;
    string public name;
    bool public isUpdated;

    constructor(address parent, uint _index, string _name) public {
        parentAddress = parent;
        index = _index;
        name = _name;
        isUpdated = false;
    }

    function rename(string newName) external {
        name = newName;
    }

    function renameViaParent(string updateName) external {
        isUpdated = true;
        Parent(parentAddress).renameChild(index, updateName);
    }
}
