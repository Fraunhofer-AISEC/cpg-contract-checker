contract myContract{

    mapping(address => string) contractName;
    event myEvent(address contractRef);

    function myContract(){
        
        ...
    }

    myMethod(address _contract){
        ...
        myEvent(contractName[_contract]);
    }
}
