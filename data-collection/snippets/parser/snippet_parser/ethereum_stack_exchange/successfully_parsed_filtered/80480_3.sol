pragma solidity ^0.5.0;

import "./ExternalStorage.sol";



contract LandRegistry is ExternalStorage {

    constructor(
        address _OwnerAddr,
        string memory _FamilyName,
        string memory _FamilyRep
    )public {
        biodataDetails.OwnerAddr = _OwnerAddr;
        biodataDetails.FamilyName = _FamilyName;
        biodataDetails.FamilyRep = _FamilyRep
    }


    function SaveLandDetail(
        address _OwnerAddr,
        address _regAddr,
        bytes32 _ReferenceCode,
        bytes32 _Longitude,
        bytes32 _Latitude
    ) external
    {
        land.OwnerAddr = _OwnerAddr;
        land.regAddr = _regAddr;
        land.ReferenceCode = _ReferenceCode;
        land.Longitude = _Longitude;
        land.Latitude = _Latitude
    }

    function FamilyDetails()
        external view returns(
            address,
            string memory,
            string memory,
            string memory,
            string memory
        )
    {
        return (
            biodataDetails.OwnerAddr,
            biodataDetails.FamilyName,
            biodataDetails.FamilyRep,
            biodataDetails.FamilyRep_HouseAddress,
            biodataDetails.FamilyRep_Mobile_No
        );
    }

    function RegistryDetails()
        external view returns(
            address,
            address,
            bytes32,
            bytes32,
            bytes32
            ) {
        return (
            land.OwnerAddr,
            land.regAddr,
            land.ReferenceCode,
            land.Longitude,
            land.Latitude,
            );
    }

}
