checkVariableDeclaration1 >> 23466 gas
checkVariableDeclaration2 >> 23412 gas
---------------------------------------
difference >> 44 gas



function checkVariableDeclaration1(uint[] calldata nums) public pure returns (uint) {
    uint n1 = nums[0];
    uint n2 = nums[1];
    uint n3 = nums[2];
    uint n4 = nums[3];
    return n1 + n2 + n3 + n4;

}

function checkVariableDeclaration2(uint[] calldata nums) public pure returns (uint) {
    uint n1;
    uint n2;
    uint n3;
    uint n4;
    n1 = nums[0];
    n2 = nums[1];
    n3 = nums[2];
    n4 = nums[3];
    return n1 + n2 + n3 + n4;

}
