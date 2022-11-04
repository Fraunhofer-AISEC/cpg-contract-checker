pragma solidity >=0.4.0 <0.7.0;
pragma experimental ABIEncoderV2;
contract PrivateSmartContract {


    string[] public buildingList;
 address public bildingOwner;
 address public biv;
    struct BuildingRental {
        string bagId;
        string rentHash;
        editor[] editors;
        uint updatedAt;
        bool status; 
    }

    struct editor {
        address editor;
    }

   constructor() public {
    bildingOwner = 0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c;
    biv = 0x14723A09ACff6D2A60DcdF7aA4AFf308FDDC160C;
   }
    mapping(string => BuildingRental) rentalStructs;

    modifier onlyOwner(){
        require(msg.sender == bildingOwner);
        _;
    }

     modifier onlyBIV(){
        require(msg.sender == biv);
        _;
    }

    function isBuildingRetntal(string memory _bagId) public view returns(bool) {
        return rentalStructs[_bagId].status;
    }

    function newBuildingRental(string memory _bagId, string memory _rentHash) public onlyOwner returns(bool) {
        require(!isBuildingRetntal(_bagId)); 
        buildingList.push(_bagId);
        rentalStructs[_bagId].bagId = _bagId;
        rentalStructs[_bagId].rentHash = _rentHash;
        rentalStructs[_bagId].updatedAt = now;
        rentalStructs[_bagId].status = false;

        return true;
    }

    function appendEditor(string memory _bagId, address  _editor) public onlyOwner returns(bool) {
        require(isBuildingRetntal(_bagId));
        rentalStructs[_bagId].editor.push(_editor);
        return true;
    }

    function editRentalHash(string memory _bagId, string memory _rentHash) public returns(bool) {
        require(isBuildingRetntal(_bagId));
        rentalStructs[_bagId].rentHash = _rentHash;
        rentalStructs[_bagId].updatedAt = now;
        rentalStructs[_bagId].status = false;
        return true;

    }

    function approveRentalHash(string memory _bagId) public onlyBIV returns(bool) {
        require(isBuildingRetntal(_bagId));
        rentalStructs[_bagId].updatedAt = now;
        rentalStructs[_bagId].status = true;
        return true;

    }

    function getRentalHash(string memory _bagId) public view returns (string memory, string memory, editor[] memory, uint, bool){

      BuildingRental memory buildingRental = rentalStructs[_bagId];

      return (buildingRental.bagId, buildingRental.rentHash, buildingRental.editors, buildingRental.updatedAt , buildingRental.status);

  }

  function getOwner() public view returns (address){
      return bildingOwner;
  }
  function getBIV() public view returns (address){
      return biv;
  }

}
