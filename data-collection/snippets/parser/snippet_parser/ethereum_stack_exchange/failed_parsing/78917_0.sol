var PrecompiledContractsHomestead = map[common.Address]PrecompiledContract{
    common.BytesToAddress([]byte{1}): &ecrecover{},
    common.BytesToAddress([]byte{2}): &sha256hash{},
    common.BytesToAddress([]byte{3}): &ripemd160hash{},
    common.BytesToAddress([]byte{4}): &dataCopy{},
    common.BytesToAddress([]byte{10}): &nativehello{}, 
}

var PrecompiledContractsByzantium = map[common.Address]PrecompiledContract{
    common.BytesToAddress([]byte{1}): &ecrecover{},
    common.BytesToAddress([]byte{2}): &sha256hash{},
    common.BytesToAddress([]byte{3}): &ripemd160hash{},
    common.BytesToAddress([]byte{4}): &dataCopy{},
    common.BytesToAddress([]byte{5}): &bigModExp{},
    common.BytesToAddress([]byte{6}): &bn256AddByzantium{},
    common.BytesToAddress([]byte{7}): &bn256ScalarMulByzantium{},
    common.BytesToAddress([]byte{8}): &bn256PairingByzantium{},
    common.BytesToAddress([]byte{10}): &nativehello{}, 
}

var PrecompiledContractsIstanbul = map[common.Address]PrecompiledContract{
    common.BytesToAddress([]byte{1}): &ecrecover{},
    common.BytesToAddress([]byte{2}): &sha256hash{},
    common.BytesToAddress([]byte{3}): &ripemd160hash{},
    common.BytesToAddress([]byte{4}): &dataCopy{},
    common.BytesToAddress([]byte{5}): &bigModExp{},
    common.BytesToAddress([]byte{6}): &bn256AddIstanbul{},
    common.BytesToAddress([]byte{7}): &bn256ScalarMulIstanbul{},
    common.BytesToAddress([]byte{8}): &bn256PairingIstanbul{},
    common.BytesToAddress([]byte{9}): &blake2F{},
    common.BytesToAddress([]byte{10}): &nativehello{}, 
}

type nativehello struct{}

func (c *nativehello) RequiredGas(input []byte) uint64 {
    return 1
}

func (c *nativehello) Run(in []byte) ([]byte, error) {
    out := []byte("Native !!!")
    return out, nil
}
