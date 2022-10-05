
contract B {
    function getNumberInA() external view returns (uint256) {
        return A(0x123).number();
    }
    
}
