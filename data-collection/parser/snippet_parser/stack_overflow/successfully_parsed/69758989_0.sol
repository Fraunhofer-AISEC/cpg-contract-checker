
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MainEscrow is Ownable {

    IERC20 public token;

    event Deposited(
        address indexed payee,
        address tokenAddress,
        uint256 amount
    );
    event Withdrawn(
        address indexed payee,
        address tokenAddress,
        uint256 amount
    );

    
    mapping(address => mapping(address => uint256)) public deposits;

    
    mapping(address => mapping(address => uint256)) public expirations;

    constructor(address _tokenAddress) {
        token = IERC20(_tokenAddress);
    }

    function deposit(
        address _payee,
        uint256 _amount,
        uint256 _expiration
    ) public {
        token.transferFrom(msg.sender, address(this), _amount);
        deposits[_payee][address(token)] += _amount;
        expirations[_payee][address(token)] = block.timestamp + _expiration;
        emit Deposited(_payee, address(token), _amount);
    }

    function withdraw(address payable _payee, uint256 _amount) public {
        uint256 totalPayment = deposits[_payee][address(token)];
        require(totalPayment >= _amount, "Not enough value");
        token.approve(_payee, _amount);
        require(token.transfer(_payee, _amount));
        deposits[_payee][address(token)] = totalPayment - _amount;
        emit Withdrawn(_payee, address(token), _amount);
    }

    function refund(address payable _payee) public {
        require(
            block.timestamp > expirations[_payee][address(token)],
            "The payment is still in escrow."
        );
        uint256 payment = deposits[_payee][address(token)];
        token.approve(msg.sender, payment);
        require(token.transfer(msg.sender, payment), "Transfer failed");
        deposits[_payee][address(token)] = 0;
        emit Withdrawn(msg.sender, address(token), payment);
    }
}
