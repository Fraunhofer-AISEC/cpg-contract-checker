pragma solidity ^0.4.21;

contract test{

    event LogTest(
        bytes32[5] a
    ); 

    bytes32[5]  attr;

    function attributes() internal {
        attr[0] = "0x0"; attr[1] = "0x1"; attr[2] = "0x2"; attr[3] = "0x3"; attr[4] = "0x4";
    }

    function getA() public{
        attributes();
        LogTest(attr);
    }

}
