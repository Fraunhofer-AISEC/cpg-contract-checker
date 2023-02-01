import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract YourContract is Ownable, ERC20 {
    ERC20 private token;

    

    constructor() public {
        
        
    }

    struct LockedAccount {
        uint256 amountETH;
        uint256 amountTokens;
        uint256 date;
    }

    mapping(address => LockedAccount) lockedAccounts;

    function approveToken(
        ERC20 _token,
        address _to,
        uint256 _amount
    ) public {
        token = _token;
        token.approve(_to, _amount);
    }

    function lockMoney(uint256 _amountTokens) public payable {
        LockedAccount memory _lockedAccounts = LockedAccount({
            amountETH: msg.value,
            amountTokens: _amountTokens,
            date: block.timestamp
        });
        lockedAccounts[msg.sender] = _lockedAccounts;
    }

    
    receive() external payable {}

    fallback() external payable {}
}
