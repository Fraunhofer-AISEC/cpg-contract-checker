
pragma solidity 0.8.16;

contract Assembly {
    uint public age = 30;

    function changeStorageSlot(uint newSlot) pure external {
        bytes storage _age;
        assembly {
            _age.slot := newSlot
        }
    }
 
    function seeSlot() external view returns(uint) {
        uint _age = age;
        assembly {
            let sl:= sload(_age)
            sl := age.slot
            return (sl, 0x20)
        }
    }
}
