function f(address payable beneficiary) payable public {
    beneficiary.transfer(msg.value);
}
