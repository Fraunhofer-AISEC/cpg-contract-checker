event PracticeEvent (string _message, uint _timestamp);

function checkEvent() public {
    emit PracticeEvent("event has been called", gts);
}
