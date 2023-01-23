   function bytesChunck(bytes32 source, uint start, uint numBytes) constant returns(uint _result){
                uint counter = 0;
                uint result;

                for(uint i = 0; i < numBytes; i++) {
                    result += uint8(source[start + i]);
                }
                return result;
        }
