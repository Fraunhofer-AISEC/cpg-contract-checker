contract FooFactory {
    address private _adminAddress;
 
    function makeFoo(string memory name, string memory symbol) public returns(address) {
        Foo newFoo = new Foo(name, symbol, msg.sender, _adminAddress);
        return address(newFoo);
    }

    constructor(address adminAddress_) {
        _adminAddress = adminAddress_;
    }    
}
