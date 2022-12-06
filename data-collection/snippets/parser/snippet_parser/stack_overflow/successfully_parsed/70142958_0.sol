
pragma solidity 0.7.4;
pragma experimental ABIEncoderV2;

contract Leger {
    struct TransferRequest {
        string title;
        uint256 amount;
        string bsb;
        string accountName;
        string accountNumber;
    }

    event PaymentReceive(address from, uint256 amount);
    event TransactionBytes(bytes transactionBytes);
    event RequestPaid(address receiver, uint256 amount);

    function payRequest(address payable _recipient, uint256 _amount) public {
        
        (bool success, bytes memory transactionBytes) = _recipient.call{value:_amount}('');
        
        emit TransactionBytes(transactionBytes);
        
        emit RequestPaid(msg.sender, _amount);
    }

    receive() external payable {
        emit PaymentReceive(msg.sender, msg.value);
    }

}

