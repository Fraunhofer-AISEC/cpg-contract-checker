uint256 amountx = 100
tokenOneContract(tokenOneAddress).transfer(address(this), to, amountx)
tokenTwoContract(tokenTwoAddress).transfer(to, address(this), amountx)
