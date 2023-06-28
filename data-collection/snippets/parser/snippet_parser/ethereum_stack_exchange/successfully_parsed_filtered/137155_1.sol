    uint requiredValue = (50 / getPrice()) * 1000000000000000000
    require(msg.Value > requiredValue, "Not enough funding");
