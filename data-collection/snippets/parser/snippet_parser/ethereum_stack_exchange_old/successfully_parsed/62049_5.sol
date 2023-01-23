
pragma solidity ^0.8.0;

library UintArrayLib {
    using UintArrayLib for uints;

    struct uints {
        uint[] array;
    }

    function add(uints storage self, uint _uint)
        public
    {
        if(! exists(self, _uint)){
            self.array.push(_uint);
        }
    }

    function remove(
        uints storage self,
        uint _uint
    ) public {
    for (uint256 i = 0; i < self.array.length; i++) {
            if (
                self.array[i] == _uint 
            ) {
                delete self.array[i];
            }
        }
    }


    function exists(
        uints storage self,
        uint _uint
    ) internal view returns (bool) {
        for (uint256 i = 0; i < self.array.length; i++) {
            if (
                self.array[i] == _uint 
            ) {
                return true;
            }
        }
        return false;
    }
}

contract BuyList is Ownable, ReentrancyGuard {
    using UintArrayLib for UintArrayLib.uints;
    
}
