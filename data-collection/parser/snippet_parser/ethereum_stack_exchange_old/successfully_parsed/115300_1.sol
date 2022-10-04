      
    pragma solidity ^0.8.3;
    
    import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

    error MyToken__MintNotAuthorized(address caller);

    contract MyToken is ERC20 {
        constructor(string memory name, string memory symbol) ERC20(name, symbol) {
            
            
            _mint(msg.sender, 100 * 10**uint(decimals()));
        }

    
    function mint(address beneficiary, uint256 mintAmount) external {
            
            if (msg.sender != "0xabc...") {
                revert MyToken__MintNotAuthorized(msg.sender);
            }
    
            
           _mint(beneficiary, mintAmount);
        
        }
}
