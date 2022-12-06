pragma solidity ^0.4.16;

import "./Seriality.sol";

contract SerialitySample is Seriality {

   function testSample1() public returns(int n1, int8 n2, uint24 n3,  string n4,string n5) {

    bytes memory buffer = new  bytes(200);
    string memory out4  = new string(32);        
    string memory out5  = new string(32);
    n4 = new string(32);
    n5 = new string(32);
    int     out1 = 34444445;
    int8    out2 = 87;
    uint24  out3 = 76545;
    out4 = "Copy kon lashi";
    out5 = "Bia inja dahan service";

    
    uint offset = 200;

    intToBytes(offset, out2, buffer);
    offset -= sizeOfInt(8);

    uintToBytes(offset, out3, buffer);
    offset -= sizeOfUint(24);

    stringToBytes(offset, bytes(out5), buffer);
    offset -= sizeOfString(out5);

    stringToBytes(offset, bytes(out4), buffer);
    offset -= sizeOfString(out4);       

    intToBytes(offset, out1, buffer);
    offset -= sizeOfInt(256);

    
    offset = 200; 

    n2 = bytesToInt8(offset, buffer);
    offset -= sizeOfInt(8);

    n3 = bytesToUint24(offset, buffer);
    offset -= sizeOfUint(24);

    bytesToString(offset, buffer, bytes(n5));
    offset -= sizeOfString(out5);

    bytesToString(offset, buffer, bytes(n4));
    offset -= sizeOfString(out4);

    n1 = bytesToInt256(offset, buffer);
}
}