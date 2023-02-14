contract Transaction {

enum C_facts {
    Inital,
    Requested,
    Promissed, 
    Declared, 
    Accepted,
    Declined,
    Rejected
}

C_facts public c_fact = C_facts.Inital;
function nextCFact(bool happyFlow) internal {
    if(happyFlow == true){
        c_fact = C_facts(uint(c_fact) + 1);
    }
    if(happyFlow == false && c_fact == C_facts.Requested){
        c_fact = C_facts.Declined;
    }
    if(happyFlow == false && c_fact == C_facts.Declared){
        c_fact = C_facts.Rejected;
    }
}
modifier transitionNext(bool happyFlow)
{   
        _;
        nextCFact(happyFlow);
}
....
