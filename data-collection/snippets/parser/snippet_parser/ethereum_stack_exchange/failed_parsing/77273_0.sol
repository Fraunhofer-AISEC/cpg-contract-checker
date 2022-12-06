import "openzeppelin-solidity/contracts/math/SafeMath.sol";
...

 function _trade(uint _orderId, address _user, address _tokenGet, 
                uint _amountGet, address _tokenGive, uint _amountGive) internal {
     
     
     
     uint _feeAmount = _amountGet.div(100).mul(feePercent); 


     
     
      

     
     emit Trade(_orderId, _user, _tokenGet, _amountGet, _tokenGive, _amountGive, _feeAmount, 
                feePercent, msg.sender, now); 
 }
