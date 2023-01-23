pragma solidity 0.5.11;

contract ProxyConract {
    address public stateAddress;
    StateContract state;

    constructor(address _stateAddress) public {
        stateAddress = _stateAddress;
        state = StateContract(stateAddress);
    }

    event logSuccessfulStateEdit(uint256 _conractVariable);

    function changeStateData(uint256 _stateData) public returns(bool) {
        require(state.editContractVariable(_stateData));
        return true;
    }

    function getStateData() public view returns(uint256) {
        return state.getContractVariable();
    }
}

interface StateContract {
    function getContractVariable() external view returns(uint256);

    function editContractVariable(uint256 _conrtactVariable) external returns(bool);
}
