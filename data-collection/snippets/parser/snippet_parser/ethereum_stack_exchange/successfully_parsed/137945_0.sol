contract B {
address addressA;

modifier onlyACanCall() {
    require(msg.sender == addressA);
}
constructor(address _A) {
    addressA = _A;
}
function onlyA() external onlyACanCall {
    
}
}
