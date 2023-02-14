struct PaymentDetail {  
        uint TotalPaid;  
        }

    mapping (bytes32 => mapping (uint => PaymentDetail) ) public PaymentDetails; 

    function addPaymentDetail (bytes32 _Wallet, uint _TokenIndex, uint _Payment) public {
        uint _TotalPaid = PaymentDetails[_Wallet][_TokenIndex].TotalPaid;
        _TotalPaid=_TotalPaid+_Payment;
        PaymentDetails[_Wallet][_TokenIndex].TotalPaid=_TotalPaid;
    }
