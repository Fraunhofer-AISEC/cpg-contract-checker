Land memory _land = Land({
                geoPoint1: _geoPoint1,
                geoPoint2: _geoPoint2,
                geoPoint3: _geoPoint3,
                geoPoint4: _geoPoint4
                owner: ?????
            });

            uint256 landID = landRegister.push(_land) - 1;
