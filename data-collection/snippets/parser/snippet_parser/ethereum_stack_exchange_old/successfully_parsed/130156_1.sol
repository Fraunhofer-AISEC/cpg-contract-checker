function testFunctionB (address[] calldata addressList) external {
    address a1 = addressList[0];
    address a2 = addressList[1];
    address[] memory path;
    path[0] = a1;
    path[1] = a2;

}

function testFunctionB (address[] calldata addressList) external {
    address a1 = addressList[0];
    address a2 = addressList[1];
    address[] memory path;
    path[0] = a1;
    path[1] = a2;
    path[2] = a1;
    path[3] = a2;

}
