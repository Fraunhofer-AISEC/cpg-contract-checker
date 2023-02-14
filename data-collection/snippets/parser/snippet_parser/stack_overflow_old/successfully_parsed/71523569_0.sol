function swap_bnb_for_exact_tokens(
        uint amountOut,
        address[] calldata path, 
        uint deadline        
    ) external restricted payable {         

       _Router.swapETHForExactTokens{value: msg.value}(
            amountOut,            
            path,
            address(this), 
            deadline
        ); 
        (bool success,) = msg.sender.call{ value: address(this).balance }("");        
    }  
