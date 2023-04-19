contract XYZToken is ERC20, ERC20Burnable, Ownable, {
    constructor(address _admin) ERC20("XYZToken", "XYZ") ERC20Permit("XYZToken") {
 admin = _admin
}

modifier onlyAdmin {
 if(msg.sender !== admin){
  revert('Only admin')
}
}

address admin;

    function mint(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
    }
