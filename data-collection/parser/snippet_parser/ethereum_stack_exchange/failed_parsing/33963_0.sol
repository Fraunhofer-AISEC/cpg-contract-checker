Contract ERC223Receiver {
    function foo(uint256 a) {
        
    }
}


Contract Other {
    function bar(address token, address receiver, uint256 amount, uint256 a) {
        bytes4 sig = bytes4(sha3("foo(uint256)"));

        bytes data = bytes(sig + a) 

        token.transfer(receiver, amount, data);
    }
}
