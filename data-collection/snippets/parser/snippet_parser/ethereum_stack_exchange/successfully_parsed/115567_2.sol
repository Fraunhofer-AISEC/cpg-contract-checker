
pragma solidity ^0.8.0;

contract A {
    function getAddress() public pure returns (address) {
        return 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    }
}
contract B {
    address addr;
    constructor(address _addr) {
        addr = _addr;
    }

    function test() public view returns (address returnValue) {
        (bool success, bytes memory returnBytes) = addr.staticcall(abi.encodeWithSignature("getAddress()"));
        require(success == true, "Call to getAddress() failed");
        returnValue = abi.decode(returnBytes, (address));
    }

}
