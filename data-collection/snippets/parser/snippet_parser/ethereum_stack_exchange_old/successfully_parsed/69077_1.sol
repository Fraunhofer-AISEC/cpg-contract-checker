pragma solidity ^0.8.2;
pragma abicoder v2;

contract Abc {
    string[] st;

    function add(string memory newValue) public {
        st.push(newValue);
    }

    function getSt() public view returns (string[] memory) {
        return st;
    }
}

