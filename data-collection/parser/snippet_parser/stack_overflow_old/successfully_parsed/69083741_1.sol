
pragma solidity ^0.8.0;

import "./SafeMath.sol";
import "./Killable.sol";

contract Splitter is Killable {
    struct Payee{
        address payable payeeAddress;
        uint256 share;
    }

    Payee[] public payees;

    event LogSplitted(uint value, Payee[] payees);
    event LogSplitterCreated(Payee[] payees, address indexed splitterAddress);

    using SafeMath for uint256;
    
    mapping(address => uint) public balances;

    constructor(bool _paused, address payable[] memory _payee, uint256[] memory _share) Pausable(_paused) {
        uint256 length = _payee.length;
        require(length == _share.length, "Mismatch between payees and share arrays");
        for (uint256 i = 0; i < length; i++) {
            Payee memory payee = Payee(_payee[i], _share[i]);
            payees.push(payee);
        }
        emit LogSplitterCreated(payees, address(this));
    }
    
    function getBalance(address account) public view returns (uint) {
        return balances[account];
    }

    function fund() public payable whenRunning whenAlive {
        require(msg.value > 0, "Fund value 0 is not allowed");
        uint256 amount = msg.value;
        for (uint256 i = 0; i < payees.length; i++) {
            address payable participant = payees[i].payeeAddress;
            uint256 computedShare = (amount * payees[i].share) /100;
            participant.transfer(computedShare);
        }
        emit LogSplitted(amount, payees);
    }
}
