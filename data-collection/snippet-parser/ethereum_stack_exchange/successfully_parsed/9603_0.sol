 function f ()  
    {

        assembly {
            let freemem_pointer := mload(0x40)
            mstore(add(freemem_pointer,0x00),"36e5236fcd4c61044949678014f0d085")
            mstore(add(freemem_pointer,0x20),"36e5236fcd4c61044949678014f0d086")
            let arr1:= mload(freemem_pointer) 
            mstore(add(freemem_pointer,0x40),arr1)


        }
    }
