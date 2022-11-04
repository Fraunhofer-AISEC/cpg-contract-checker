
 struct Shipper {
        address claimant;
        
        mapping(uint256=>uint256) packageIdsToAmounts;
    }


    mapping(uint256 => Shipper) public requestIdToShipper;

    function addPackages(uint256 _requestId, address claimant, uint256[] memory amounts) external onlyWarehouse{
            Shipper storage currentShipper = requestIdToShipper[_requestId];
            currentShipper.claimant = claimant;
            
            for(uint256 i = 0; i < 5; i++) {
            currentShipper.packageIdsToAmounts[i] += amounts[i];
            }
    }

    function claimPackages(uint256 id, uint256[] memory amounts) external onlyShipper{
        address requester = requestIdToShipper[id].claimant;
        require(requester == msg.sender, "Not correct claimant");
        Shipper storage currentShipper = requestIdToShipper[id];
         for(uint256 i = 0; i < 5; i++) {
            currentShipper.packageIdsToAmounts[i] -= amounts[i];
        }
    }

    function viewShipper(uint256 id) public view returns (uint256[] memory amounts){
        Shipper storage currentShipper = requestIdToShipper[id];
        amounts = new uint256[](5);
        for(uint256 i = 0; i < 5; i++) {
          amounts[i] = currentShipper.packageIdsToAmounts[i];
        }
        return amounts;
    }


