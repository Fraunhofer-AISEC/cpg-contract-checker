function f(address payable beneficiary) public {
    beneficiary.transfer(address(this).balance);
}
