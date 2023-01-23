contract Bob {
    event Result(bool res);

    function queryVersion(address dynCAddr) public payable returns(bool) {
        DynamicContract dC = DynamicContract(dynCAddr);

        bool res = dC.getLibAddress()
                     .delegatecall
                     .gas(30000000)(bytes4(keccak256("version()")));

        return res;
    }
}
