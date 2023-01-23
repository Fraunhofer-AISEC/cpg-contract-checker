function getAttributes (address _player) constant returns (uint,uint,bool) {
    return (pot[_player].choice,pot[_player].amount,pot[_player].isset);
}
