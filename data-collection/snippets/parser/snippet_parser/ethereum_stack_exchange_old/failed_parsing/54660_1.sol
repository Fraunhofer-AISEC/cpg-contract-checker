

func (self *StateDB) Empty(addr common.Address) bool {
    so := self.getStateObject(addr)
    return so == nil || so.empty()
}



func (s *stateObject) empty() bool {
    return s.data.Nonce == 0 && s.data.Balance.Sign() == 0 && bytes.Equal(s.data.CodeHash, emptyCodeHash)
}
