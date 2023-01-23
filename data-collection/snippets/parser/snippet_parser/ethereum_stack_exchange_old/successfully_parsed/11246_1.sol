pragma solidity ^0.4.0;

contract StructSerialization
{
    function StructSerialization()
    {
    }

    event exactUserStructEvent(uint32 id, string name);

    
    struct ExactUserStruct
    {
        uint32 id;
        string name;
    }

    function showStruct(ExactUserStruct u) private
    {
        exactUserStructEvent(u.id, u.name);
    }


    function exactUserStructToBytes(ExactUserStruct u) private
    returns (bytes data)
    {
        
        uint _size = 4 + bytes(u.name).length;
        bytes memory _data = new bytes(_size);

        uint counter=0;
        for (uint i=0;i<4;i++)
        {
            _data[counter]=byte(u.id>>(8*i)&uint32(255));
            counter++;
        }

        for (i=0;i<bytes(u.name).length;i++)
        {
            _data[counter]=bytes(u.name)[i];
            counter++;
        }

        return (_data);
    }


    function exactUserStructFromBytes(bytes data) private
    returns (ExactUserStruct u)
    {
        for (uint i=0;i<4;i++)
        {
            uint32 temp = uint32(data[i]);
            temp<<=8*i;
            u.id^=temp;
        }

        bytes memory str = new bytes(data.length-4);

        for (i=0;i<data.length-4;i++)
        {
            str[i]=data[i+4];
        }

        u.name=string(str);
     }

    function test()
    {
        
        ExactUserStruct memory struct_1=ExactUserStruct(1234567,"abcdef");
        showStruct(struct_1);

        
        bytes memory serialized_struct_1 = exactUserStructToBytes(struct_1);

        
        ExactUserStruct memory struct_2 = exactUserStructFromBytes(serialized_struct_1);

        
        showStruct(struct_2);
    }
}
