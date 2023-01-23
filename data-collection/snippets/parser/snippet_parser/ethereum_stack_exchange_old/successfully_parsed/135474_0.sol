contract Foo {

event OwnerAdded(address indexed owner);

address public owner;

constructor(address _owner) {
    owner = _owner
    emit OwnerAdded(owner)
}

}