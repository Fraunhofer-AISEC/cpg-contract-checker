contract A{

   uint numberOfContractsAdded;

   struct ToCallBackContracts{
     address contractAddress;
     bytes4 contractMethodToCall;
     bytes32 theOnlyArgument;
   }

   mapping(uint -> ToCallBackContracts) contracts;


   constructor A(){}

   function triggeredFromOutside(bytes32 param)public returns (bool){
     for(var i=0; i<numberOfContractsAdded; i++){
       
     }
   }

   function registerCallback(bytes4 _cMethod, address _cAddress){
      
   }
}


contract P{
    address addressOfA;
    constructor P(address _addressOfA){
        addressOfA = _addressOfA;
    }

    function _callback(bytes32 param){
       
    }

    function callFromOutsideToRegisterWithA(bytes32 param){
       
    }

}
