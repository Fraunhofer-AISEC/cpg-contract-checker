function harvestGrapes(string _notes, uint _vintageYear, uint farmId) public verifyCaller(deployer) {

        previousGrapesId = previousGrapesId + 1;

        grapes[previousGrapesId] = Grapes ({
            grapesId: previousGrapesId,
            notes: _notes,
            vintageYear: _vintageYear,
            farmOwner: msg.sender,
            GrapeState: GrapeState.Harvested,
            farm: farms[farmId].farmName
        });

        emit GrapesHarvested(previousGrapesId);
    }
