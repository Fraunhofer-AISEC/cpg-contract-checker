address[] memory addresses;
addresses[0]= 0x...;
addresses[1] = 0x...;
addresses[2] = 0x...;
            
(bytes memory data) = abi.encode((address[]), addresses);
