contract MyToken is ERC20 {
    address public admin;

    constructor() ERC20("dust", "P2PM") {
        _mint(msg.sender, 1000000 * 10 ** decimals());
        admin = msg.sender; 
    }
}

