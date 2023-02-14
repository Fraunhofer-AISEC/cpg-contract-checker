uint256 valid_mask = 0x0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000;
uint256 invalid_mask = 0x0000FE0000FE0000FE0000FE0000FE0000FE0000FE0000FE0000FE0000FE0000;



bool less_than_129600(uint256 input) {
    
    if (valid_mask & input == 0)
        return true;
    
    
    if (invalid_mask & input != 0)
        return false;

    
    
    ...

    
    
    return true;
}

