library Test_Lib {
    function test_function()
    public
    returns (bool)
    {
        return (this.owner.send(this.balance));
    }
}
