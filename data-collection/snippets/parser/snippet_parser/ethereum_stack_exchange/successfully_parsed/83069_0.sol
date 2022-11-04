contract Transform {

    InputToken inputToken;
    OutputToken outputToken;

    event Transformed(address from, uint256 input, uint256 output);

    constructor(address _inputToken, address _outputToken) public {
    inputToken = InputToken(_inputToken); 
    outputToken = OutputToken(_outputToken); 
}

    function transformTokens(uint256 _amount) external payable {
        require(_amount > 0);

        uint256 input = _amount; 
        uint256 rate = 1000;

        uint256 output = input.div(rate);
        uint256 excess;

        inputToken.transferFrom(msg.sender, address(this), input);
        outputToken.mint(msg.sender, output);

        Transformed(msg.sender, input, output);
    }
}
