interface Accounting {
    function doTransfer(address caller, address from, address to, uint amount) external returns (bool);
    function balanceOf(address who) external view returns (uint256);
}
