struct MyStruct {
    address owner;
}

mapping(uint256 => MyStruct) internal myStructs;

modifier onlyOwner(uint256 id) {
    if (getOwner(id) != msg.sender) {
        revert Foo__NotAuthorized(msg.sender);
    }
    _;
}

function getOwner(uint256 id) public view returns (address theOwner) {
    theOwner = myStructs[id].owner;
}

