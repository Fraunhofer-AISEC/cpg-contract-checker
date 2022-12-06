pragma solidity ^0.4.24;
contract Testing {


function test() view returns (uint, string)
{
    return (10,"test");



}

   string s;
   uint u;

    function f(uint a) external view{ 
   (u,s)= test();

}
}
