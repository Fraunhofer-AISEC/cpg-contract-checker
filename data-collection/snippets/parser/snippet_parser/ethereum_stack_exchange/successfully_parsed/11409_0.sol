 contract Coin1{
        function f() payable returns (uint);
    }


    contract Coin2{
        Coin1 coin;
        function setcoin(address addr) { coin= Coin1(addr); }
        function callcoin() { coin.f.value(10).gas(800)(); 
    }
}