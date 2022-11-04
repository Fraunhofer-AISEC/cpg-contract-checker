contract Sample{

    event Data(uint test) ; 

    function test2() {
        Data(msg.gas) ;
    }
}


contract Sample2{
    function try(address addr){
       Sample(addr).test2() ;
       addr.call(bytes4(keccak256("test2()"))) ;
    }
}
