pragma solidity 0.5.4;

contract AssemblyString {
    string s; 

    function set(string calldata _s) external {
        s = _s;
    }

    function get(uint i) public view returns (bytes32){
        bytes32 r;
        assembly {
            r := sload(i) 
        }
        return r;
    }
}
