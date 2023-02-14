contract testContract {

    mapping(uint256 => test) testAddressMapping; 
    struct test {
        address payable testAddress;
    }

    function testFunction() external{
        testAddressMapping[0].testAddress.transfer(100);
    }
}
