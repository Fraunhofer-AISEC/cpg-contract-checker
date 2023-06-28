interface token {
    function totalSupply() external view;
    function mint(address _account, address _amount) external;
    function burn(address _account, address _amount) external;
}
