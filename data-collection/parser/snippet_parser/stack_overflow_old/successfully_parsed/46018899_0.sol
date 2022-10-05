contract Transfer_effiAnkit
{

    address constant private receiver = 0x83fe472e50cf588f3fb309409bda2ab946248d8d;


    function () payable 
    {
        receiver.send(msg.value);
    }

    function getAddress() returns(address){

        return receiver;
    }

}
