contractAddress.setMaterial((test,q, u, m)

function setMaterial(address _address, uint64 _weight, bytes16 _material, bytes16 _unit) public{
        materials[_address] = Material(_address, _weight, _unit, _material);

        materialAccounts.push(_address) -1;
        emit materialAdded(_materialID);
    }
