contract AddressToUint144
{
    address public constant example_addr=0x9dd1e8169e76a9226b07ab9f85cc20a5e1ed44dd;

    function addressToUint144(address addr) constant
    returns (uint144)
    {
        return uint144(bytes20(addr)>>16);
    }

    
    function test()
    returns (bytes18)
    {
        return bytes18(addressToUint144(example_addr));
    }
}
