function factorial(uint y) internal pure returns(uint){
    if (y == 1){
        return y;
    } else {
        return y * factorial(y-1);
    }
}

function get() public view returns(uint){
    return factorial(x);
} } 
