pragma solidity ^0.4.0;
contract Addresses5Storage {

    

    byte[160] private addresses_storage;

    function storeAddress(address addr,uint index)
    {
        uint k=0;
        for (uint i=index*20;i<=(index+1)*20-1;i++)
            addresses_storage[i]=byte((bytes20(addr)<<8*k++)&bytes20(0xff00000000000000000000000000000000000000));    
    }

    function getAddress(uint index) constant
    returns (address)
    {   
        bytes20 addr;
        uint k=0;
        for (uint i=index*20;i<=(index+1)*20-1;i++)
        {
            addr^=bytes20(addresses_storage[i])>>8*k;
            k++;
        }
        return address(addr);
    }

    


    
    address[8]  addresses=
        [0x61c2571ac2c83f399a23a1723b3e08ad933267f0,
        0xfa8d3048d236be994a6443fab364c35d2c9934ed,
        0xb6f31f166af597ca40f2f703a4b6b4260124b762,
        0x97b503b07e13e9c104f6091e44bc922f0fd618f6,
        0x3fac7be8070078884feddd5fa2aab30afd7c7ae5,
        0x6fac7be8070078884feddd5fa2aab30afd7c7ae6,
        0x7fac7be8070078884feddd5fa2aab30afd7c7ae7,
        0x8fac7be8070078884feddd5fa2aab30afd7c7ae8];

    
    function testStoreAndGet (uint index)
    returns (address)
    {
        storeAddress(addresses[index],index);
        return (getAddress(index));
    }
    
}
