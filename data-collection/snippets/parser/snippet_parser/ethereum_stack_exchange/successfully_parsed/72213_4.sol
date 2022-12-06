pragma solidity ^0.5.0;

contract Array {

    uint[] arr;   
    uint[2] arr2; 



    
    function setDynArrayElement() public {
        arr.push(2);
        arr.push(3);
        arr.push(4);
    }

    
    function getDynArrayLength() public view returns (uint _l) {
        assembly {
            _l := sload(0)
        }
    }

    
    function getDynElement(uint i) public view returns (uint _x) {
        assembly {
            _x := sload(add(keccak256(sload(0), 32),i))
        }
    }



    
    function setFixnArrayElement() public {
        arr2[0]= 5;
        arr2[1]= 6;
    }

    
    function getFixElement() public view returns (uint _value1, uint _value2) {
        assembly {
            _value1 := sload(1)
            _value2 := sload(2)
        }
    }



    
    function getFixMemoryArrayElement(uint i) public pure returns (uint _l) {
        uint[2] memory arr3;
        arr3[0] = 7;
        arr3[1] = 8;
        assembly {
            _l := mload(add(arr3,mul(i,0x20)))
        }
    }

    function getFixMemoryArrayLen() public pure returns (uint _l) {
        uint[] memory arr4 = new uint[](10);
        assembly {
            _l := mload(arr4)
        }
    }
    function getFixMemoryArrayElement_2(uint i) public pure returns (uint _l) {
        uint[] memory arr4 = new uint[](5);
        arr4[0] = 9;
        arr4[1] = 10;
        assembly {
            _l := mload(add(arr4,mul(i,0x20)))
        }
    }
}
