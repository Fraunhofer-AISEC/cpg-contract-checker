function substring(string calldata input, uint begin, uint end)
    public
    view
    returns (string calldata)
{
    return input[begin:end];
}
