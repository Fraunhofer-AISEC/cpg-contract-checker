event msgSenderEvent(address indexed sender);

function msgSender() public {
    emit msgSenderEvent(_msgSender());
}
