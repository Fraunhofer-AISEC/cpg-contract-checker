interface Token {
    function transfer(address _To, uint256 _Amount) external returns (bool);
    function balanceOf(address account) external view returns(uint);
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
    function mint(address to, uint256 amount) external returns(bool);
}
