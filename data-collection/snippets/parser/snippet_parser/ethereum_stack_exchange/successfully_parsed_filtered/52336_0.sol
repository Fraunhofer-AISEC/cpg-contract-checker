pragma solidity ^0.4.21;


contract CaptureTheEther {
    mapping (address => bytes32) public nicknameOf;

    function setNickname(bytes32 nickname) public {
        nicknameOf[msg.sender] = nickname;
    }
}



contract NicknameChallenge {
    CaptureTheEther cte = CaptureTheEther(msg.sender);
    address player;

    
    function NicknameChallenge(address _player) public {
        player = _player;
    }

    
    function isComplete() public view returns (bool) {
        return cte.nicknameOf(player)[0] != 0;
    }
}
