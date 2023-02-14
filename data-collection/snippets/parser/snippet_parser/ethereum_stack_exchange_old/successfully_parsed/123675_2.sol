    function getWhisper() public view returns (string memory) {
        if (msg.sender == owner){
        return whisper;
        }
        else{
            return "You are not allowed";
        }
    }
