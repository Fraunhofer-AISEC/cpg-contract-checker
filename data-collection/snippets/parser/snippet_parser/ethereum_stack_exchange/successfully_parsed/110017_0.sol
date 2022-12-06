function testDate(uint date1,uint date2)
public 
returns (bool)
{
  require(date1 == date2,'not same date') 
  return date1 == date2;
}
