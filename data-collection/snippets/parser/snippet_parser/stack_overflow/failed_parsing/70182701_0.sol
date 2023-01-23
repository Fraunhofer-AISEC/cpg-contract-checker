function WinnerOfLottery() public view returns(address){
        require(msg.sender==manager);
        require(participants.length >=3);
        **uint r=random();**
        address payable winner;
        uint randIndex = r % participants.length;
        winner= participants[randIndex];
        return winner;
    }
