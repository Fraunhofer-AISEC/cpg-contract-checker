function sub(
    uint a,
    uint b
    )
    internal
    pure
    returns (uint)
{
    require(b <= a, "SUB_UNDERFLOW");
    return a - b;
}

function withdraw(uint amount) public {
    msg.sender.call.value(amount).gas(gasleft())("");
    balance[msg.sender]=balance[msg.sender].sub(amount);
}
