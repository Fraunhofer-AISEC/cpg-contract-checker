function getValue() returns (uint) {
    if (now > validity) 
        return value + fine;
    else
        return value;
}
