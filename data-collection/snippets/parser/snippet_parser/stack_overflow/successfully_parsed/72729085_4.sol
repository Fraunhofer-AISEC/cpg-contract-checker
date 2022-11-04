constructor(string memory name_, string memory symbol_) {
    name = name_;
    symbol = symbol_;
    _mint(msg.sender, 100e18);
}
