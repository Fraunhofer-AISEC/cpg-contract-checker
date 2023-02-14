function withdraw(bytes32 _preimage)
    external view returns(bytes32 sample)
{
    uint  timenow = now;
    assembly {
        let freemem_pointer := mload(0x40)
        mstore(add(freemem_pointer,0x00), _preimage)
        sample := keccak256(freemem_pointer, 32)
        }

}
