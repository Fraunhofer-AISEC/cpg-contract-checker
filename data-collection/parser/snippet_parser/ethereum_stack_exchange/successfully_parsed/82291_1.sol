contract IERC20 {
    function balanceOf(address) public view returns (uint256);
}

contract Test {
    IERC20 dc = IERC20(0xaD6D458402F60fD3Bd25163575031ACDce07538D);

    function balanceOf(address _val) public view returns (uint256) {
        return dc.balanceOf(_val);
    }
}
