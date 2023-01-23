contract test {
uint value = 0;

function setValue () public{ 
    value = 10;
}

function requireValue () public{ 
    require(value==10, "value is not 10");
}

function getValue () public view returns (uint){ 
    return(value);
}

function resetValue () public{ 
    value = 0;
}

} 
