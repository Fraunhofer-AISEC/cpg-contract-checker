 function valid_credit_card(bytes memory value) external returns (bool){
 
 uint256 nCheck = 0;
 bool bEven = false;

 for (uint256 n = value.length; n > 0; n--) {
     uint256 nDigit = uint256(uint8(value[n-1]));
     if (bEven && (nDigit *= 2) > 9) nDigit -= 9;

     nCheck += nDigit;
     bEven = !bEven;
 }
 return (nCheck % 10) == 0;
}
