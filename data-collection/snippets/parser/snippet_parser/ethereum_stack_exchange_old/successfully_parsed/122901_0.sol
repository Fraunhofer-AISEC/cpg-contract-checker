
address  [] public  uniqueFunders;
function TotalMoney() public  returns(uint256){
  uniqueFunders=new address[](0);
  funders[0] == uniqueFunders[0];
  uint256 size=1;
  uint256 total =0+AddressFunding[uniqueFunders[0]];
  for(uint256 i=1;i<funders.length;i++)
  {
    
    int flag=0;
    for(uint256 j=0;j<uniqueFunders.length;j++)
    {
      if(funders[i] == uniqueFunders[j]){
      flag++;
      break;
      }
      
    }
    if (flag == 0){
    uniqueFunders[size]=funders[i];
    total=total+AddressFunding[uniqueFunders[size]];
    size++;
    }
  }
  return total;
}