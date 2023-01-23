pragma solidity ^0.4.0;

contract BytesChunkTest
{
    bytes32 constant public test_source=0x000000000000000000ff11223344556677889900aabbccddeeff;

    bytes32 constant mask1 = 0xff00000000000000000000000000000000000000000000000000000000000000;
    bytes32 constant mask2 = 0xffff000000000000000000000000000000000000000000000000000000000000;
    bytes32 constant mask8 = 0xffffffffffffffff000000000000000000000000000000000000000000000000;
    uint    constant main_shift=15;

    function sourceToChunk(bytes32 source) constant
    returns
        (
            bytes2 r1_2,
            bytes2 r2_2,
            bytes2 r3_2,
            bytes2 r4_2,
            bytes8 r5_8,
            bytes1 r6_1
        )
    {

        r1_2 = bytes2(source<<(main_shift*8)&mask2);
        r2_2 = bytes2((source<<(main_shift+2)*8)&mask2);
        r3_2 = bytes2((source<<(main_shift+4)*8)&mask2);
        r4_2 = bytes2((source<<(main_shift+6)*8)&mask2);
        r5_8 = bytes8((source<<(main_shift+8)*8)&mask8);
        r6_1 = bytes1((source<<(main_shift+16)*8)&mask1);
    }


    function test() constant
    returns
        (
            bytes2,
            bytes2,
            bytes2,
            bytes2,
            bytes8,
            bytes1
        )
    {
        return sourceToChunk(test_source);
    }
}
