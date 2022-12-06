contract FinanceToken is ERC20 {
    constructor ()
        ERC20('FinanceToken', 'MYFI')
        public
    {
        _mint(0x96C00412E5870e79F5Bd586F0F7e91047F497B28, 400000 * 10 ** uint(decimals()));
    }
}
