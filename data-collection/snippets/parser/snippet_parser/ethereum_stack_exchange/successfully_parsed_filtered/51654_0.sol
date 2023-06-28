 
function extractSelector (bytes data) public constant returns (uint8) {
        uint8 sel = uint8(data[0]);
        return sel;
    }
