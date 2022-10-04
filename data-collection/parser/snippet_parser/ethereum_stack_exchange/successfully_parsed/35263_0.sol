function AddNewLand(string _geoPoint1, string _geoPoint2, string _geoPoint3, string _geoPoint4, uint _totalinterest, uint _purchasePrice) public {

        if(ownerAddress == msg.sender){

            Land memory _land = Land({
                geoPoint1: _geoPoint1,
                geoPoint2: _geoPoint2,
                geoPoint3: _geoPoint3,
                geoPoint4: _geoPoint4,
                creationTime: uint64(now),
                totalInterest: _totalinterest,
                remainingInterest: _totalinterest,
                purchasePrice: 1000
            });

            uint256 landID = landRegister.push(_land) - 1;

            newLandAdded(landID);

        }else {

            error("Only the contract owner can add a new  of land.");

        }

    }
