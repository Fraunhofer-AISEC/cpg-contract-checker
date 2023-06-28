contract Foo {
    address bazz;
    string abiSignature;

    function Foo (address _bazz, string _abi) public {
        bazz = _bazz;
        abiSignature = _abi;
    }

    function updateABI (string _ABI) public {
        abiSignature = _ABI;
    }

    function callBazz(uint256 arg) public returns (bool bazzLib){
        bool bazzCall =  bazz.call(bytes4(sha3(abiSignature)), arg); 
        bool bazzLib  = bazz.callcode(bytes4(sha3(abiSignature)), arg); 
    }
}
