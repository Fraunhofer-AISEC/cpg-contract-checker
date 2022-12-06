pragma solidity ^0.5.8;

contract ModularCheck {

    
    function verify(uint256 _D, uint256 _C, uint256 _c, uint256 _h, uint256 _z, uint256 _g, uint256 _l, uint256 _modulus) public returns (bool){
        uint256 exp1 = modExp(_C, _c, _modulus);
        uint256 exp2 = modExp(_h, _z, _modulus);
        uint256 exp3 = modExp(_g, _l, _modulus);

        if(_D == mulmod(mulmod(exp1,exp2, _modulus),exp3, _modulus)) return true;

    }

    function modExp(uint256 _b, uint256 _e, uint256 _m) public returns (uint256 result) {
        assembly {
            
            let pointer := mload(0x40)

            
            mstore(pointer, 0x20)
            mstore(add(pointer, 0x20), 0x20)
            mstore(add(pointer, 0x40), 0x20)

            
            mstore(add(pointer, 0x60), _b)
            mstore(add(pointer, 0x80), _e)
            mstore(add(pointer, 0xa0), _m)

            
            let value := mload(0xc0)

            
            if iszero(call(not(0), 0x05, 0, pointer, 0xc0, value, 0x20)) {
                revert(0, 0)
            }

            result := mload(value)
        }
    }
}
