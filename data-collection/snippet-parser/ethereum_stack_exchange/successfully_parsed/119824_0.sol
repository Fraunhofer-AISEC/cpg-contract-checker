interface Ierc20 {
    function mint(address to, uint amount) external; 
    function burn(uint amount) external;
    function findBalance(address _tokenOwner) external view returns(uint256);
}



address public target = 0x5FbDB2315678afecb367f032d93F642f64180aa3;
