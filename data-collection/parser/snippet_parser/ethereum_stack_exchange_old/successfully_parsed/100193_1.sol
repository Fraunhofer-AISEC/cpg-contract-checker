contract B {

A public contractA;
address public aContractAddress ;

 function initContractA(address[] memory _whiteListedWallets) public returns (address){
       
      contractA = new A(_whiteListedWallets);
      aContractAddress = address(contractA); 
      return aContractAddress;
    }

 function deposit (address payable _aContractAddress, uint _value) public{
        _aContractAddress.transfer(_value);
    }
    
}

