struct MyStruct {
    string someData;
    address tokenAddress;
}

mapping (uint256 => MyStruct) myMapping;

function makeContract(uint256 uuid) view public {
    address tokenAddress = new MyToken('Name');
    myMapping[uuid].tokenAddress = tokenAddress;
}
