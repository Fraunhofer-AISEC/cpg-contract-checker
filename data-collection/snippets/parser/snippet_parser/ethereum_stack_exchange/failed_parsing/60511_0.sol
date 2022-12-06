contract con1{

    modifier supermod(uint _value){
        require(_value == 1);
        _;
    }
}

contract con2{

    con1 public contract1;

    function setCon1Address(address _address)public{
        contract1 = con1(_address);
    }

    function test() contract1.supermod(uint _value){
        ..stuff..
    }


}
