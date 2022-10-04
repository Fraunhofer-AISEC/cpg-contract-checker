contract MyContract {
    address public creator;

    function MyContract() {
        creator = msg.sender;
    }

    function reject() {
        selfdestruct(creator);
    }

    function send(address target, uint256 amount) {
        if (!target.send(amount)) throw;
    }
       function destroy(address target) {

        selfdestruct(0x0000000000000000000000000000000000000000);
    }
}
