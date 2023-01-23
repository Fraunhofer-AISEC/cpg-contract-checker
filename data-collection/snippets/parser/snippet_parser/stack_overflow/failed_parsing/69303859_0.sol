 function withdraw() external {
     require(lock, "Withdraw in session");
     lock = false;
     lightCalculation()l
     for (uint256 i = 0; i < 22; i++) {
           (bool success, ) = payable(address(users[i])).call{value: AMOUNT * i}("");
           require(success, "Transfer failed.");
      }
     lock = true;
 }
