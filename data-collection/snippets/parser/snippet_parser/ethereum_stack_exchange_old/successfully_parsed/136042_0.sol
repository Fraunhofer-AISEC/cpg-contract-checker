
pragma solidity 0.8.16;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/IERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

contract MyERC20 is ERC20("Abc", "ABC") {

    mapping(address => bool) public whitelist;
    address public admin;
    uint256 public constant initialSupply = 100;

    constructor() {
         admin = msg.sender;
        _mint(admin, initialSupply);
    }

    modifier onlyAdmin() {
        require(msg.sender == admin);
        _;
    }

    
    modifier ensureNoMoreThan1PercentIfNotWhitelisted(address to, uint256 amount) {

        uint256 toBalance = balanceOf(to);

        uint256 onePercentOfTotalSupply = totalSupply() / 100;

        
        if(!whitelist[msg.sender]) {
            require((toBalance + amount) <= onePercentOfTotalSupply, "Illegal operation. Account owould have more than 1% of the total supply.");
        }

        _;

    }

    
    
    function transfer(address to, uint256 amount) public override ensureNoMoreThan1PercentIfNotWhitelisted(to, amount) returns (bool) {
        return super.transfer(to, amount);
    }

    function transferFrom(address from, address to, uint256 amount) public override ensureNoMoreThan1PercentIfNotWhitelisted(to, amount) returns (bool) {
        return super.transferFrom(from, to, amount);
    }

    function addToWhitelist(address addr) public onlyAdmin {
        whitelist[addr] = true;
    }

    function removeFromWhitelist(address addr) public onlyAdmin {
        delete whitelist[addr];
    }

    

}
