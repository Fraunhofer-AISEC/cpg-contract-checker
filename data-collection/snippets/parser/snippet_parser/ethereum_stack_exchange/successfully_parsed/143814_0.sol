 contract DaiToken is ERC20, Ownable {

    constructor() ERC20("Dai Token", "mDAI") {}

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

}
