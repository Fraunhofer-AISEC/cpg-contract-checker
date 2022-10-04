pragma solidity 0.4.24;

contract A{

    struct ToCallBackContract {
        address contractAddress;
        bytes4 contractMethodToCall;
        bytes32 theOnlyArgument;
    }

    ToCallBackContract[] public contracts;

    
    mapping(address => uint256) contractIndexes;

    function triggeredFromOutside() public returns (bool){
        
        for(uint256 i=0; i< contracts.length; i++){
            

            ToCallBackContract storage toCallBackContract = contracts[i];
            
            address(toCallBackContract.contractAddress).call(toCallBackContract.contractMethodToCall, toCallBackContract.theOnlyArgument);
        }

    }

    function registerCallback(bytes4 _cMethod, address _cAddress) public {
        

        
        uint256 index = contracts.length++;

        
        contracts[index].contractAddress = _cAddress;
        contracts[index].contractMethodToCall = _cMethod;

        
        contractIndexes[_cAddress] = index;
    }

    
    function setTheOnlyArgument(address _contractAddress, bytes32 _value) public {
        ToCallBackContract storage toCallBackContract = contracts[contractIndexes[_contractAddress]];
        toCallBackContract.theOnlyArgument = _value;
    }
}


contract P{
    A addressOfA;
    constructor(A _addressOfA) public {
        addressOfA = _addressOfA;
    }

    function _callback(bytes32 param) public {
       
       emit SomethingDone(param);
    }

    function callFromOutsideToRegisterWithA() public {
       

       
       bytes4 sig = bytes4(keccak256("_callback(bytes32)"));
       
       addressOfA.registerCallback(sig, this);
    }

    event SomethingDone(bytes32 param);
}
