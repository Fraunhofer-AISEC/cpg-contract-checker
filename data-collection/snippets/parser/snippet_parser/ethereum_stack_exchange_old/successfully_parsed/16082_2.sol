pragma solidity ^0.4.7;

library lib {

    bytes1 public constant  flag = 0x01;

    function g() constant returns (bytes1){
    return flag;
}

}



contract test {


     bytes1 x = lib.g();


}
