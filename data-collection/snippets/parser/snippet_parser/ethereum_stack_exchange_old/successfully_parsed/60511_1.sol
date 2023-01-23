contract con1{

    modifier supermod(uint _value){
        require(_value == 1);
        _;
    }
}

contract con2 is con1 {

    function test(uint value) supermod(value){
        
    }

}
