struct testR{
    bytes32 name;
    int32 count;
}

testR[] public tests;

function createTest(bytes32[] names) external returns (bool success) {
    uint256 len = names.length;
    for (uint8 i=0;i<len;i++){
        tests.push(testR({name: names[i], count: 0}));
    }
    return true;
}
