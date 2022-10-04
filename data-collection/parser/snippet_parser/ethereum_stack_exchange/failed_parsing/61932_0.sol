contract MyContract {
    event MyEvent(address indexed sender, uint256 input, uint256 output);

    function func(uint256 input) external {
        verify(msg.sender);
        uint256 output = compute(input);
        emit MyEvent(msg.sender, input, output);
    }

    function verify(address sender) private view {
        
        ...
    }

    function compute(uint256 input) private returns (uint256) {
        
    }
}
