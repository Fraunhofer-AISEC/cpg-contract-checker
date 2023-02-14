contract SimplySend {
    event Paid(uint);
    function () payable {
        Paid(msg.value);
    }
}

contract NeedExtraGas {
    event Paid(uint);
    uint total;
    function () payable {
        total += msg.send;
        Paid(msg.value);
    }
}
