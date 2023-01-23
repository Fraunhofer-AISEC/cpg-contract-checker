pragma solidity ^0.4.11;

contract Test {
    function toBytes(address a) public pure returns (bytes b) {
        assembly {
            let m := mload(0x40)
            mstore(add(m, 20), xor(0x140000000000000000000000000000000000000000, a))
            mstore(0x40, add(m, 52))
            b := m
       }
    }

    function toBytes(uint _num) public pure returns (bytes _ret) {
        assembly {
            _ret := mload(0x10)
            mstore(_ret, 0x20)
            mstore(add(_ret, 0x20), _num)
        }
    }

    function test(uint num1, uint num2) public view returns (bytes) {
        bytes memory a1 = toBytes(msg.sender);
        bytes memory a2 = toBytes(num1);
        bytes memory a3 = toBytes(num2);
        bytes memory ret = new bytes(a1.length + a2.length + a3.length);
        uint x = 0;

        for (uint i = 0; i < a1.length; i++) {
            ret[x++] = a1[i];
        }

        for (i = 0; i < a2.length; i++) {
            ret[x++] = a2[i];
        }

        for (i = 0; i < a3.length; i++) {
            ret[x++] = a3[i];
        }

        return ret;
    }
}
