function eggSectionOne(uint itemId)internal view returns(bytes memory){
        bytes memory dataURI = abi.encodePacked(
            '{"name": "',
            eggIdToData[itemId].name,
            '", "description": "',
            eggIdToData[itemId].description,
            '", "image": "',
            eggIdToHiddenImg[itemId],
            '", "animation_url:"',
            eggIdToAnnimation[itemId],
            '", "attributes": [{ "trait_type": "Veneer", "value": "',
            eggIdToData[itemId].veneer,
            '"},{ "trait_type": "Durability", "value": "',
            eggIdToData[itemId].durability);
        return dataURI;
    }

    function eggSection2(uint itemId)internal view returns(bytes memory){
        bytes memory dataURI = abi.encodePacked(
            '"},{ "trait_type": "Origin", "value": "',
            eggIdToData[itemId].origin,
            '"},{ "trait_type": "Temperature", "value": "',
            eggIdToData[itemId].temperature,
            '"},{ "trait_type": "Buoyancy", "value": "',
            eggIdToData[itemId].buoyancy
            );
        return dataURI;
    }

    function individualTokenUri(uint itemId)external view returns(string memory){
        bytes memory dataURI = abi.encodePacked(
            eggSectionOne(itemId),
            eggSection2(itemId),
            '"},{ "display_type": "number", "trait_type": "Energy Level", "value": ',
            Strings.toString(eggIdToData[itemId].energyLevel),
            '},{ "trait_type": "Colour", "value": "',
            eggIdToData[itemId].color,
            '"}]}'
        );
        return string(
                abi.encodePacked(
                    "data:application/json;base64,",
                    Base64.encode(dataURI)
                )
            );
    }
