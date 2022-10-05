contractA{    
    function myMethod(address contractbAddress) payable public{
        address contractcAddress = (new contractC).value(msg.value)(msg.sender,address(this),contractbAddress);
        contractB(contractbAddress).setContract(msg.sender,contractcAddress); 
        confirmEvent(msg.sender,contractcAddress);
    }
}
contractB{
    function setContract(address sender,address contractcAddress){
        ....
    }
}
contractC{
    function contractC(address sender,address contractaAddress,address contractbAddress){
        ....
    }
}
