TypeError: Expression has to be an lvalue.
            decryptedData[i] = (decryptedData[i] - key) % 256;
            ^--------------^

TypeError: Operator - not compatible with types bytes1 and int256
           decryptedData[i] = (decryptedData[i] - key) % 256;
                               ^--------------------^

TypeError: Operator % not compatible with types bytes1 and int_const 256
           decryptedData[i] = (decryptedData[i] - key) % 256;
                              ^----------------------------^
