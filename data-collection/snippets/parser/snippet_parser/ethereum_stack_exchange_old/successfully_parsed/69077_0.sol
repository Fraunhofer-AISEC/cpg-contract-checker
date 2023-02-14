pragma solidity ^0.5.0;

contract Abc{
    string[] st;

    function add(string memory newValue) public {
        st.push(newValue);
    }

    
}