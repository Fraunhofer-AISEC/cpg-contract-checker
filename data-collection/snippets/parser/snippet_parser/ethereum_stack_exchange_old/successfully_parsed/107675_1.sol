contract MIddle {


    receive() {
        emit myEvent(msg.data, msg.value, msg.sender)
    }

    function migrate(address _to, uint256 value) {
        _to.call({value: value})
    }


}
