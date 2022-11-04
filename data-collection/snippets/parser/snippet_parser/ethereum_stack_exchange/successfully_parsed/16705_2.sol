contract MyNumber{

    uint public num1 = 1;

    function getNumber() constant returns (uint){
        return num1 ;
    }

}
