import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/f1e92dd184a599f39ce9cc4ec8a5e4a94416f3a2/contracts/utils/math/SafeMath.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

contract token is ERC20, Ownable {
    using SafeMath for uint256;
    uint taxPercentage = 9;
    address public deployer;

    constructor(uint256 initialSupply) public ERC20("token", "token") {
        _mint(msg.sender, initialSupply);
        deployer = msg.sender;
    }

    function _transfer(
        address sender,
        address recipient,
        uint256 amount
    ) internal override {
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        _beforeTokenTransfer(sender, recipient, amount);

        uint256 senderBalance = _balances[sender];
        uint256 taxAmount = amount.mul(taxPercentage) / 100;
        require(senderBalance >= amount, "ERC20: transfer amount exceeds balance");
        unchecked {
            _balances[sender] = senderBalance - amount;
        }
        _balances[deployer] += taxAmount;
        _balances[recipient] += amount - taxAmount;

        emit Transfer(sender, recipient, amount);

        _afterTokenTransfer(sender, recipient, amount);
    }
} 
