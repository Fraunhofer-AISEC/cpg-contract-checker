contract MyToken is ERC20 {
    constructor(uint initialSupply, string memory name, string memory symbol) 
      ERC20(name, symbol) public {
          _mint(msg.sender, initialSupply);
    }

    function _beforeTokenTransfer(address from, address to, uint256 amount) 
        internal override {
        
    }
}
