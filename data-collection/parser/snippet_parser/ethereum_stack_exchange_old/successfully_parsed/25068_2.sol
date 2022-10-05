
pragma solidity >0.8.5;

abstract contract OtherContract {
    function otherMethod(address _to, uint _price) external virtual;
}

interface OtherContractInterface {
    function otherMethod(address _to, uint _price) external;
}

contract MyContract {
    uint public unitPrice = 100;

    function myMethod(address _destination, uint _count) external {
        

        
        OtherContractInterface oci = OtherContractInterface(_destination);
        oci.otherMethod(address(this), _count * unitPrice);

        
        OtherContract oc = OtherContract(_destination);
        oc.otherMethod(address(this), _count * unitPrice);
    }
}
