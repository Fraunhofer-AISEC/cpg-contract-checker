(bool success, bytes memory data) = _t.call.value(msg.value)(bytes4(keccak256("test()")));
if (!success) {
    revert();
}
