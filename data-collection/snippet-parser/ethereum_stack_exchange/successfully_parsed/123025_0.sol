import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract Token is ERC20 {
    constructor() ERC20("ACDMToken", "AKDM") {     
    }
}

contract ACDMPlatform {
    address public token;

constructor(address _ACDMToken) {
        token = _ACDMToken;
    }

 function startSaleRound(uint supply) public {
        Token(token)._mint(address(this), supply);
    }
}
