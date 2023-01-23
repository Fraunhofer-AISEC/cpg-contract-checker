

pragma solidity >=0.7.0 <0.9.0;

interface X {
    function getTotalSupply() external view returns (uint);
}

contract A {
    X state;
    
    function initializeState(address _address) public {
        state = X(_address);
    }
    
    function getTotalSupplyFromB() public view returns (uint) {
        return state.getTotalSupply();
    }
}
