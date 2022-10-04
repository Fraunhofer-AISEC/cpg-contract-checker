

    function withdraw(uint amount) public{
        value -= amount;
    }



    function balance() public view returns (uint){
        return value;
    }    
