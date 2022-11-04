contract Randomish {

    uint public constant MAX = uint(0) - uint(1); 
    uint public constant SCALE = 500;
    uint public constant SCALIFIER = MAX / SCALE;
    uint public constant OFFSET = 100; 


    
    

    function randomish() public view returns(uint) {
        uint seed = uint(keccak256(abi.encodePacked(now)));
        uint scaled = seed / SCALIFIER;
        uint adjusted = scaled + OFFSET;
        return adjusted;
    }
}
