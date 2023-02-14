    event E1(bytes32 arg1, bytes32 arg2);
    event E2(bytes32 arg1, bytes32 arg2);

    function foo() public {
        dynamicEmit(E1.selector, 0x00, 0x00);
        dynamicEmit(E2.selector, 0x00, 0x00);
    }

    function dynamicEmit(bytes32 eventSelector, bytes32 arg1, bytes32 arg2) internal {
        

        if(E1.selector == eventSelector) {
            emit E1(arg1, arg2);
        } else if(E2.selector == eventSelector) {
            emit E2(arg1, arg2);
        }

    } 
