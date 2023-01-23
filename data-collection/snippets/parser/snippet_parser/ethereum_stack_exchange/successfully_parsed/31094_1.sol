  for (uint8 i = 0; i < total; i++) {
            assembly {
                

                my_int := mload(add(add(myarray_slot, 0x20), mul(i, 0x2A0)))

                

                my_second_int := mload(add(add(myarray_slot, 0x120), mul(i, 0x2A0)))
            }
            if (my_int >= maximum && my_second_int <= maximum) {
                assembly {
                    

                    result := mload(add(add(myarray_slot, 0x220), mul(i, 0x2A0)))
                }
                break;
            }   
    }   
