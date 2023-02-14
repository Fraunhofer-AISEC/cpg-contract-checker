contract ethertransfer{

    function payMe() payable returns(bool success) {
        return true;
    }

    function fundtransfer(address etherreceiver, uint256 amount){
        if(!etherreceiver.send(amount)){
           throw;
        }    
    }
}


contract etherreceiver{       
    function etherreceiver(){          
    }    
}
