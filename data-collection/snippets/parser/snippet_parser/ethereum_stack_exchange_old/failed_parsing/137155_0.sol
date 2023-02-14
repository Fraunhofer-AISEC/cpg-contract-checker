    uint requiredValue = (50 / getPrice()) ether
    require(msg.Value > requiredValue, "Not enough funding");
