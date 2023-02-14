    contract SmartToken {

        mapping(address => uint) tokens;

        event OnamountChanged(address indexed _fromAddress, uint amount);


        function transfer(address fromAddress, address toAddress, uint amount) returns (bool success) {
            
            if (fromAddress == toAddress) {
                return false;
            }


            if ((tokens[fromAddress] - amount) < 0) {
                
                token[toAddress] += tokens[fromAddress];
                tokens[fromAddress] = 0;
            } else {
                token[toAddress] += amount;
                tokens[fromAddress] -= amount;
            }

            OnamountChanged(fromAddress, tokens[fromAddress]);
            return true;
        }
    }
