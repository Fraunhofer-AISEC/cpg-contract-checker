contract MyContract is ERC20 {
    constructor () ERC20("test", "test") {    
        _mint(msg.sender, 1000);
    }
}
