pragma solidity ^0.5.12;
import "./B.sol";
contract A

.
.
.

  function pay(address payable recipient, uint val) external payable{
        recipient.transfer(val);
        A(recipient).cash(val, tx.gasprice);
        receiver=recipient;
        sentValue=val;
        gasPrice=tx.gasprice;
        emit Payment(recipient, val);
    }

.
.
.

}
