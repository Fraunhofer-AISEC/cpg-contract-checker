   pragma solidity ^0.8.7;

interface IContract1{
    struct UserInfo{
   uint id ;
   string ime;
}
    function arr(uint index) external returns(UserInfo memory );
}
contract Contract2{

struct UserInfo{
   uint id ;
   string ime;
}
event UserEVENT (UserInfo UserInfo);
UserInfo [] public newarr;

function foo(address addr,uint i) external {
    IContract1(addr).arr(i);
    emit UserEVENT (IContract1(addr).arr(i));
}
}
