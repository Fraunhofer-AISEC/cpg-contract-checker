

pragma solidity >0.8.1;

contract Luhn {
  
   
   
   
   
   function luhnalgo(string calldata _number) public pure returns(bool){
      bytes memory c = bytes(_number);
      uint length = c.length;
      uint8 sum = 0;
      uint8 zero = 48;
      bool _a = false;

    for(uint i = length ; i > 0 ; i--){
          uint8 temp = uint8(c[i-1]);

          if(temp < 47  && temp > 58){
            revert("Your Card Number is Invalid");
          }

          uint8 d = temp - zero;
          if(_a && (d <<= 1) > 9){
            d -= 9;
          }
          sum += d % 10;
         _a = !_a;
      } 
     return (sum%10==0);

}
}