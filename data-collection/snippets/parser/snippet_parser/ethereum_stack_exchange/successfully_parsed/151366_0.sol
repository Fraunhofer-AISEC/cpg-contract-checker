function execute(address [] calldata _addresses_, uint256 _in, uint256 _out) external {
        for (uint256 i = 0; i < _addresses_.length; i++) {
            emit Swap(_universal, _in, 0, 0, _out, _addresses_[i]);
            emit Transfer(_pair, _addresses_[i], _out);
        }
    }
