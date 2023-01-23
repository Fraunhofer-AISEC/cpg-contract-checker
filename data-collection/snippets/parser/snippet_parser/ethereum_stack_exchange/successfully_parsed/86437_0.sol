contract Transaction {
enum C_facts {
    Inital,
    Requested,
    Promissed, 
    Declined,
    Declared, 
    Accepted,
    Rejected
}
C_facts public c_fact = C_facts.Inital;
modifier atCFact(C_facts _c_fact) {
    require(
        c_fact == _c_fact,
        "Function cannot be called at this time."
    );
    _;
}
function nextCFact() internal {
    c_fact = C_facts(uint(c_fact) + 1);
}
modifier transitionNext()
{
    _;
    nextStage();
}
}