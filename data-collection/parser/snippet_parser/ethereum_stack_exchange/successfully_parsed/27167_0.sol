    pragma solidity ^0.4.15;
    contract MyContract {

        bytes32  public custName;
        bytes32  public custLoc;
        address public docAddress = this;

        function MyContract () {

            custName = "0xDEFAULT";
            custLoc  = "0xDEFAULT";

        }

        event LogNewCust (address _address, bytes32 _custName, bytes32 _custLoc);

        function AssignAttributes (bytes32 _custName, bytes32 _custLoc)  
            returns (bool isSuccess) {

            custName    = _custName;
            custLoc     = _custLoc;

            LogNewCust(docAddress,custName,custLoc);

            return true;

        }

    }
