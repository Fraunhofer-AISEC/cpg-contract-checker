    pragma solidity ^0.8.7;

contract Contract1{
struct UserInfo{
   uint id ;
   string ime;
}
  
UserInfo [5] public arr;

constructor()  {
    arr[0] = UserInfo(1,"Milos");
   arr[1] = UserInfo(2,"Stefan");
   arr[2] = UserInfo(3,"Sloba");
   arr[3] = UserInfo(4,"Prci");
    arr[4] = UserInfo(5,"Dovla");
}
}
