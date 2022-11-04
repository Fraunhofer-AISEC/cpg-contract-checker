    constructor() ERC20(string memory name, string memory symbol) payable {
    _mint(msg.sender, 10000 * 10 ** decimals());
    admin = msg.sender;
}
