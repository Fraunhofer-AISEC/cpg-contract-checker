contract testContract {

    address[] employees = [
        0x4cd28d9a0d66216382ad3e1c993797989d1a8e05,
        0xb871e16d7192cbaa2b5be32f85c1a19f61b8a50d,
        0x5e5527378c42b91e95fee2cfbe974259d983a99e
    ];

    function testContract() payable {

    }

    function () payable {
        uint amountPerEmployee = msg.value / employees.length;

        for(uint i = 0; i <= employees.length; i++) {
            employees[i].transfer(amountPerEmployee);
        }
    }

} 
