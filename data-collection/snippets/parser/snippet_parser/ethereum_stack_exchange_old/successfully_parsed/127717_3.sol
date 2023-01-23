contract MyTokenMock is MyToken {
    address public myTokenAddress;

    constructor(address myTokenAddress_) {
        myTokenAddress = myTokenAddress_;
    }

    function mint () {
        
    }
}
