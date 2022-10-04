    contract Ouro is ERC20, Ownable {

    string public constant tokenMinuta = "Céu, Carraço"; 

    constructor() ERC20("Ouro", "ORO") {
        _mint(msg.sender, 1000000000 * 10**decimals());
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

}
