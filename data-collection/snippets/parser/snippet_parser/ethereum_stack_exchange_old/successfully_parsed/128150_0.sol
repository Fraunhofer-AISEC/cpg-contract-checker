    pragma solidity ^0.8.4;
    
    import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
    import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
    
    contract MyToken is ERC20, ERC20Burnable {
        constructor() ERC20("MyToken", "MTK") {
           _mint(msg.sender, 2000 * 10 ** decimals());
}
    }
