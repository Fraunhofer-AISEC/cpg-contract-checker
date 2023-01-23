contract Tenants{

  address admin;
  uint256[] public tenatIDs;
  mapping(bytes32 => Tenant) tenantDetails;

  function Tenants() public{

      admin = msg.sender;
  }

  struct Tenant{

      string uniqueID;
      string name;
      uint256 flatNum;
      uint256 phoneNum;
      uint256 advanceAmt;
      uint256 rent;
  }


  function addTenant(**Tenant tenantObj**) public{
          
  }

}
