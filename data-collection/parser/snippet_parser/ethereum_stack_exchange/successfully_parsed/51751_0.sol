pragma solidity ^0.4.21;

import "../zeppelin-solidity/contracts/token/ERC20/ERC20.sol";
import "../zeppelin-solidity/contracts/ownership/Ownable.sol";
import "../webshop/Webshop.sol";

contract Escrow is Ownable {
    enum PaymentStatus { Pending, Completed, Refunded }

    event PaymentCreation(uint indexed orderId, address indexed customer, uint value);
    event PaymentCompletion(uint indexed orderId, address indexed customer, uint value, PaymentStatus status);

    struct Payment {
        address customer;
        uint value;
        PaymentStatus status;
        bool refundApproved;
    }

    mapping(uint => Payment) public payments;
    ERC20 public currency;
    address public collectionAddress;
    Webshop public webshop;

    function Escrow(ERC20 _currency, address _collectionAddress) public {
        currency = _currency;
        collectionAddress = _collectionAddress;
        webshop = Webshop(msg.sender);
    }

    function createPayment(uint _orderId, address _customer, uint _value) external onlyOwner {
        payments[_orderId] = Payment(_customer, _value, PaymentStatus.Pending, false);
        emit PaymentCreation(_orderId, _customer, _value);
    }

    function release(uint _orderId) external {
        completePayment(_orderId, collectionAddress, PaymentStatus.Completed);
    }

    function refund(uint _orderId) external {
        completePayment(_orderId, msg.sender, PaymentStatus.Refunded);
    }

    function approveRefund(uint _orderId) external {
        require(msg.sender == collectionAddress);
        Payment storage payment = payments[_orderId];
        payment.refundApproved = true;
    }

    function completePayment(uint _orderId, address _receiver, PaymentStatus _status) private {
        Payment storage payment = payments[_orderId];
        require(payment.customer == msg.sender);
        require(payment.status == PaymentStatus.Pending);
        if (_status == PaymentStatus.Refunded) {
            require(payment.refundApproved);
        }
        currency.transfer(_receiver, payment.value);
        webshop.changeOrderStatus(_orderId, Webshop.OrderStatus.Completed);
        payment.status = _status;
        emit PaymentCompletion(_orderId, payment.customer, payment.value, _status);
    }
}
