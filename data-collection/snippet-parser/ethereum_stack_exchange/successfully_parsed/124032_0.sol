contract Xchain is ERC20 {

    constructor() ERC20("Xuuu", "XXX") {
        _mint(msg.sender, 100000000 * 10 ** decimals());
    }

    function transfer(address to, uint256 amount) public virtual override returns (bool) {
        address owner = _msgSender();
        _transfer(owner, to, amount);
        return true;
    }

}
