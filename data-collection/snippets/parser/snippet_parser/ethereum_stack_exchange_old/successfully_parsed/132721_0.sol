
pragma solidity >=0.7.0 <0.9.0;

contract Factory {

    mapping(uint => address) children;

    function createChild(uint id) public returns(address child) {

        bytes32 salt = keccak256(abi.encodePacked(id));
        child = address(new Child{salt: salt}(id));

        children[id] = child;

    }

    function destruct(uint childId) public {

        address _child = children[childId];

        Child child = Child(_child);

        child.selfDestruct();
    }
}

contract Child {

    uint immutable public id;

    constructor(uint _id) {
        id = _id;
    }

    function selfDestruct() public {

        selfdestruct(payable(address(this)));

    }

}
