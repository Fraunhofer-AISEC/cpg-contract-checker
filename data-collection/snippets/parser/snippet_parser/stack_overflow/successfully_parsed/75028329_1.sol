contract Tool
{
   function test(address a,uint256 b)public  view  returns (address c,address d)
   {
    UniRouter(a).positions(b); 
   }
}
