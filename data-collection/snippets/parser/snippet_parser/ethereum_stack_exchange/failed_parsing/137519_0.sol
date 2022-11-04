contract GovernanceERC20 is ERC165Upgradeable, ERC20VotesUpgradeable, {
   
   bytes4 private constant GOVERNANCE_INTERFACE_ID;

   
    function supportsInterface(bytes4 interfaceId) public view virtual override returns (bool) {
        return
            interfaceId == GOVERNANCE_INTERFACE_ID ||
            interfaceId == type(IERC20Upgradeable).interfaceId ||
            interfaceId == type(IERC20PermitUpgradeable).interfaceId ||
            interfaceId == type(IERC20MetadataUpgradeable).interfaceId ||
            interfaceId == type(ERC20VotesUpgradeable).interfaceId ||
            super.supportsInterface(interfaceId);
    }
   
   function initialize() public view returns(uint) {
        return 10;
   }

   function mint(address to, uint256 amount) external {
        _mint(to, amount);
    }

   function great() public view returns(uint) {
        return 10;
   }
  
}
