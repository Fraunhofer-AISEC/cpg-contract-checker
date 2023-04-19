function executeSomething(bytes memory data) external returns(bool) {
    address user = (data >> (bytes.length - 160)); 
    _;
    return true;
}
