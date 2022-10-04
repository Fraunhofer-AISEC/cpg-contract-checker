
pragma solidity ^0.8.11;

contract Newspaper {
    function getData() external view returns(int) {
        return m_data;
    }

    int private m_data = 42;
}
