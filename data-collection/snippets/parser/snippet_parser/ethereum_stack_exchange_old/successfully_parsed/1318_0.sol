struct Participant {
    address etherAddress;
    uint amount;
}

Participant[] public participants;
uint public amountRaised;

function() {
    enter();
}

function enter() {
    uint amount = msg.value;
    uint n = participants.length;

    participants.length += 1;
    participants[n].etherAddress = msg.sender;
    participants[n].amount = amount;

    amountRaised += amount;
}
