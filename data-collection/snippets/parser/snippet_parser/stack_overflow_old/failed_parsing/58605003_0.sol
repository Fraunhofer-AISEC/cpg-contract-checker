contract test {
    MyContract contract;


address creator = address(0);
address payable account2 = address(1);
address payable account3 = address(2);
address payable account4 = address(3);

function beforeAll () public {
   contract = new MyContract();
}

function makeCallFromAccount2 () {
    contract.function1(10);
}
}
