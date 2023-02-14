contract MyToken is ERC20 {
    function mint() external payable onlyOwner {
         _mint(msg.sender, msg.value);
    }
}
