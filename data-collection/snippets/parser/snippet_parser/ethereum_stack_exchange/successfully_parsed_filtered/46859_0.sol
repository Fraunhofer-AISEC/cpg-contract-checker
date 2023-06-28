pragma solidity 0.4.22;

contract Token{

    address owneraddress;
    modifier onlyowner {
        require(owneraddress == msg.sender);
        _;
    }

    function Token(){
        owneraddress = msg.sender ;
    }

    function start() onlyowner {
      
    }

    function stop() onlyowner {
     
    }
}
