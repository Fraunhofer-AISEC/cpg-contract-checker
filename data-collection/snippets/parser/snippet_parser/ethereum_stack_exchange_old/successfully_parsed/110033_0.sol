contract CallsFunctions {
    
    function callAnything(address contractAddress, bytes memory args) payable external {
        (bool success, ) = contractAddress.call{ gas: 100000, value: msg.value }(args);
        require(success);
    }
}
