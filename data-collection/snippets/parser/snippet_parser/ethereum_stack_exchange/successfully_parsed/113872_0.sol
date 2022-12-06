    
    function createColony(
        string memory name,
        address colonyOwner,
        bytes32 location,
        uint256 people,
        uint256 food,
        uint256 materials
    ) private returns (uint256 id) {
        id = colonies.length + 1;
        colonies.push(
            Colony({
                name: name,
                owner: colonyOwner,
                location: location,
                plotsAmount: 0,
                people: people,
                food: food,
                materials: materials,
                redirection: id
            })
        );
        uint256[] storage coloniesOfPlayer = coloniesPerPlayer[colonyOwner];
        coloniesOfPlayer.push(id);
        coloniesOfPlayer.push(3);
        coloniesPerPlayer[colonyOwner] = coloniesOfPlayer;
    }
