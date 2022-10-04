pragma solidity ^0.5.8;

contract MetaCoin {
    function createVariable(uint _x) public  {
        assembly {
            let v := _x
            sstore(0, v)
            let w := add(_x,1)
            sstore(1, w)
        }
    }

    function getVariable() public view returns (uint r, uint s) {
        assembly{
            r := sload(0)
            s := sload(1)
        }
    }

    function addValue(uint _y) public returns (uint t){
        assembly{
            t := add(_y,sload(0))
            sstore(0,t)
        }
    }
}
