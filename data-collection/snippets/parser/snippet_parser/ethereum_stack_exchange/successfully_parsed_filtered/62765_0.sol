struct MyData {
    uint a;
    uint b;
}

MyData public myData;

function setData(uint a, uint b) external {
    myData.a = a;
    myData.b = b;
}

function getData() external view returns(uint a, uint b) {
    a = myData.a;
    b = myData.b;
}
