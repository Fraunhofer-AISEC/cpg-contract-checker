function confirmReceived()
    external
    onlyBuyer
    inState(State.Locked)
{
    emit ItemReceived();

    buyer.transfer(value);

    state = State.Release; 
}
