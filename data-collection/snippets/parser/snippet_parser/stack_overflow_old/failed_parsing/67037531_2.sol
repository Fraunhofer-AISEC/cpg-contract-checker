library AddressLibrary {
    function isContract (address _address) {
        return true;
    }
}

contract MyContract {
    using AddressLibrary for address;

    function foo() external {
        address to = address(0x123);
        bool returnedValue to.isContract(); 
    }
