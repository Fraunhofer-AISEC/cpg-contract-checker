    function SwapV3 (uint Quantity_in, uint Min_quantity, address Address_quote, address Address_token_out, address Recipient) public payable{
        require ((msg.sender==owner) || (msg.sender==address(this)), "Only owner can swap tokens");
        uint256 deadline = block.timestamp;
        address tokenIn = Address_quote;
        address tokenOut = Address_token_out;
        uint24 fee = 3000;
        address recipient = Recipient;
        uint256 amountIn = Quantity_in;
        uint256 amountOutMinimum = Min_quantity;
        uint160 sqrtPriceLimitX96 = 0;
        V3.ExactInputSingleParams memory Parameters = V3.ExactInputSingleParams(tokenIn,tokenOut,fee,recipient,deadline,amountIn,amountOutMinimum,sqrtPriceLimitX96);
        V3(Swapper).exactInputSingle(Parameters); 
    } 

    function Safe_swapV3 (uint Quantity_in, uint Min_quantity, address Address_quote, address Address_token_out, address Recipient) public payable {
        require (msg.sender==owner, "Only owner can swap tokens");
        (bool success, bytes memory result)=address(this).call(abi.encodeWithSignature("SwapV3 (uint,uint,address,address,address)",Quantity_in, Min_quantity, Address_quote, Address_token_out, Recipient));
    }

