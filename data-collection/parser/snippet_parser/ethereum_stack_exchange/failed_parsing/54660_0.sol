func opSuicide(pc *uint64, evm *EVM, contract *Contract, memory *Memory, stack *Stack) ([]byte, error) {
    balance := evm.StateDB.GetBalance(contract.Address())
    evm.StateDB.AddBalance(common.BigToAddress(stack.pop()), balance)

    evm.StateDB.Suicide(contract.Address())
    return nil, nil
}






func (self *StateDB) Suicide(addr common.Address) bool {
    stateObject := self.getStateObject(addr)
    if stateObject == nil {
        return false
    }
    self.journal = append(self.journal, suicideChange{
        account:     &addr,
        prev:        stateObject.suicided,
        prevbalance: new(big.Int).Set(stateObject.Balance()),
    })
    stateObject.markSuicided()
    stateObject.data.Balance = new(big.Int)

    return true
}
