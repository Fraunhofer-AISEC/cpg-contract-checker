contract MyToken is ERC20 {
    MyTokenImpl private myTokenImpl;

    constructor(MyTokenImpl _myTokenImpl) public {
        myTokenImpl = _myTokenImpl;
    }

    function transfer(address to, uint256 value) public returns (bool) {
        let status = myTokenImpl.transfer(to, value);
        return status || super.transfer(to, value);
    }
}
