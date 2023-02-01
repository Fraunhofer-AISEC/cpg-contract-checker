contract BetToken is ERC20, Ownable {
    address[] betContractAddresses;
    constructor(
        string memory _name,
        string memory _symbol,
        address[] memory _betContractAddresses
    ) ERC20(_name, _symbol) {
        betContractAddresses = _betContractAddresses;
    }
    function mint(address to, uint256 amount) external {
        for (uint256 i; i < betContractAddresses.length; i++) {
            if (betContractAddresses[i] == msg.sender) {
                _mint(to, amount);
            }
        }
    }

}