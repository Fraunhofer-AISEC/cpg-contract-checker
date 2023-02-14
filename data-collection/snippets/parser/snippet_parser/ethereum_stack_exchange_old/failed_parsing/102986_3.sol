function _transferFrom(address sender, address recipient, uint256 amount) internal returns (bool) {
         if(shouldSwapBack()){ swapBack(); }
    }

Basically, you have to check the values return from the function call and handle it if something happens . This compiler error is to do with improving the security of your smart contract . 


function shouldSwapBack() internal view returns (bool) {
        return msg.sender != pair
        && !inSwap
        && swapEnabled
        && _balances[address(this)] >= swapThreshold; 
        throw;

So I suggest going through your code and when calling a method with a return boolean value to handle its return .



