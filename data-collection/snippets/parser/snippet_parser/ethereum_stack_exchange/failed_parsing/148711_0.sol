        string memory errorMessage = string(abi.encodePacked("Only the current owner (", addToString(currentOwner), ") can call this function.", addToString(msg.sender)));
        require(msg.sender == currentOwner, errorMessage);
    _;
    } 
