constructor() public {
        factory = msg.sender;
    }

    
    function initialize(address _token0, address _token1) external {
        require(msg.sender == factory, 'UniswapV2: FORBIDDEN'); 
        token0 = _token0;
        token1 = _token1;
    }
