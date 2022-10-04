contract A {
    address public beneficiary;

    function A(address _beneficiary) public {
         beneficiary = _beneficiary;
    }

    function () public payable {
         beneficiary.transfer(msg.value);
    }
}
