function test_initial_creation() public{
    A a = A(DeployedAddresses.A());
    B b = B(DeployedAddresses.B());

    a.init(address(b));

    address[] memory adr;
    uint[] memory price;
    (adr, price) = a.getInfo();

    Assert.equal(adr.length, 6, "Initial Info length should be 6");
}
