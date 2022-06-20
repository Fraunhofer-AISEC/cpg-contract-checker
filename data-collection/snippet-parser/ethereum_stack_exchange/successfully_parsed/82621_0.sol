pragma solidity ^0.5.0;

contract MyToken is Context, ERC20, ERC20Detailed {

    constructor () public ERC20Detailed("DEST", "DST", 18) {
        _mint(_msgSender(), 1000000000 * (10 ** uint256(decimals())));
    }
}

contract Claim {

    MyToken public token;
    address myToken;

    constructor(address _tokenAddress) public {
        token = MyToken(_tokenAddress);
        myToken= _tokenAddress;
    }

    function claimWinning() public {
        
        token.transferFrom(myToken, msg.sender, 100000); 
    }
}
