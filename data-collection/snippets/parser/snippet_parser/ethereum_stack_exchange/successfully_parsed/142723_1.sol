function setA() public {
    
}

function setB() public {
    bytes4 signature = bytes4(keccak256("setA()"));
    setA();
}
