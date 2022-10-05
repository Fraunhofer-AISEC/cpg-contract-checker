function multyswap(uint256 amountIn, address[] calldata path) external payable {
      if (path[0] == WETH) {
         require(amountIn == msg.value, "Germes: INVALID_INPUT");
      } else {
         IBEP20(path[0]).transferFrom(msg.sender, address(this), amountIn);
      }

      for (uint i = 0; i < path.length-1; ++i) {
         address receiver;
         address[] memory tempPath = new address[](2);

         tempPath[0] = path[i];
         tempPath[1] = path[i+1];

         if (i == path.length-2) {
            receiver = msg.sender;
         } else {
            receiver = address(this);
         }

         if (path[i] == WETH) {
            router.swapExactETHForTokens{value: msg.value}(
               0,
               tempPath,
               receiver,
               block.timestamp + 100
            );
            amountIn = address(this).balance;

         } else if (path[i+1] == WETH) {
            IBEP20(path[i]).approve(routerAddress, amountIn);
            router.swapExactTokensForETH(
               amountIn,
               0,
               tempPath,
               receiver,
               block.timestamp + 100
            );
            amountIn = IBEP20(tempPath[1]).balanceOf(receiver);

         } else {
            IBEP20(path[i]).approve(routerAddress, amountIn);
            router.swapExactTokensForTokens(
               amountIn,
               0,
               tempPath,
               receiver,
               block.timestamp + 100
            );
            amountIn = IBEP20(tempPath[1]).balanceOf(receiver);
         }
      }
   }
