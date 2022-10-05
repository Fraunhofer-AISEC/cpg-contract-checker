function _mightWin()
        internal
    {
        address _player = msg.sender;        
        uint256 _tickets = tickets_.length;  

        
        uint256 _ticket = uint256(keccak256(abi.encodePacked(block.timestamp, block.difficulty, _player, _tickets))) % 289;

        
        if (_ticket == 42) {
            hasWon = true;
        }
    }
