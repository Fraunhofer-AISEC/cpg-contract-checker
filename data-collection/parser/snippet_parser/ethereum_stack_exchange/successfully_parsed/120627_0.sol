
pragma solidity >=0.6.0 <0.9.0;

struct PackedUint16 { uint256 word; }

library packedUint16 {
    
    function set(PackedUint16 storage self, uint16 value, uint8 index)
        public
    {
        self.word = self.word | uint(value) << index * 16;
    }

    function get(PackedUint16 storage self, uint8 index)
        public
        view
        returns (uint16)
    {
        return uint16(self.word >> (index * 16));
    }

}

contract pack {

    
    
    
    using packedUint16 for PackedUint16;

    PackedUint16 public myValue;
    
    function testPackedUint16() 
        public
    {
        myValue.set(10, 0);
        myValue.set(100, 1);
        myValue.set(1000, 2);
        myValue.set(10000, 3);
    }

    function readPackedUint16()
        public
        view
        returns (uint16, uint16, uint16, uint16)
    {
        return (myValue.get(0), myValue.get(1), myValue.get(2), myValue.get(3));
    }

    
    
    
    uint public a;
    uint public b;
    uint public c;
    uint public d;

    function testUint256() 
        public
    {
        a = uint(10);
        b = uint(100);
        c = uint(1000);
        d = uint(10000);
    }

    
    
    
    uint public packed;

    function testPacked()
        public
    {
        packed |= uint(10) << 0 * 16;
        packed |= uint(100) << 1 * 16;
        packed |= uint(1000) << 2 * 16;
        packed |= uint(10000) << 3 * 16;
    }

    function readPacked()
        public
        view
        returns (uint16, uint16, uint16, uint16)
    {
        return (uint16(packed >> 0), uint16(packed >> 16), uint16(packed >> 32), uint16(packed >> 48));
    }

}
