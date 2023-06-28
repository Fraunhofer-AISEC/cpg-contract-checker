pragma solidity ^0.4.15;


contract Template {

    bytes32  public custName;
    bytes32  public custLoc;
    address  public contractAddress;

    function Template () {

        custName            = "0xDEFAULT";
        custLoc             = "0xDEFAULT";
        contractAddress     = address(this);

    }

    function AssignCustomerAttributes (bytes32 _custName, bytes32 _custLoc)  
        returns (bool isSuccess) {

        custName    = _custName;
        custLoc     = _custLoc;

        contractAddress  = address(this);

        return true;

    }

}







pragma solidity ^0.4.15;


contract Template {

    bytes32  public custName;
    bytes32  public custLoc;
    address  public contractAddress;

    function Template () {

        custName            = "0xDEFAULT";
        custLoc             = "0xDEFAULT";
        contractAddress     = address(this);

    }

    function AssignCustomerAttributes (bytes32 _custName, bytes32 _custLoc)  
        returns (bool isSuccess) {

        custName    = _custName;
        custLoc     = _custLoc;

        contractAddress  = address(this);

        return true;

    }

}






contract Master {

    address  public     masterContractAddress;
    bytes32  public     masterName = "";
    Template    myCustTemp; 

    function Master () {

        masterContractAddress = address(this);

    }

    function updateOwnerName (bytes32 _masterName)  {

        masterName = _masterName;

    }

    function createCustomer (bytes32 _custName, bytes32 _custLoc)  returns (bool flag) {

        Template myCust = new Template();

        if (myCust.AssignCustomerAttributes(_custName, _custLoc)) {

            return true;

        } else return false;

    }


}
