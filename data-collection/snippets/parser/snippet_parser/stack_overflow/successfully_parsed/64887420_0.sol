    function assessVoter () public view returns(uint) {
    uint weight = (msg.sender).balance;
    return (weight);
}
