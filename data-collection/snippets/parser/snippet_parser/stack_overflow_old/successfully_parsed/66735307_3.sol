
pragma solidity >=0.6.0 <0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Token is ERC20 {

    address minter;

    
    event minterChanged(address indexed from, address to);
    
    constructor() public payable ERC20("Decentralized Bank Currency", "DCB") {

        minter = msg.sender;
    }

    function transferMinterRole(address bank) public returns(bool) {
        require(msg.sender == minter);
        minter = bank;

        emit minterChanged(msg.sender, minter);
        return true;
    }

    function mint(address account, uint256 amount) public {

        require(msg.sender == minter);
        _mint(account, amount);
    }
}
