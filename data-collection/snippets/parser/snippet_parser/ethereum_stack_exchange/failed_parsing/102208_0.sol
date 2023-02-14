function enterToken(address token, uint amount) public {
        uint _amount = amount * 10 ** 18;
        IERC20 token_ = IERC20(token);
        require(token_.approve(address(this), _amount), 'Approve failed.');
        require(token_.transferFrom(msg.sender, address(this), _amount), 'Transfer failed.');
