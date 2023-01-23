import (
    "bytes"
    "context"
    "math/big"

    "github.com/ethereum/go-ethereum"
    "github.com/ethereum/go-ethereum/accounts"
    "github.com/ethereum/go-ethereum/accounts/abi"
    "github.com/ethereum/go-ethereum/accounts/abi/bind"
    "github.com/ethereum/go-ethereum/accounts/keystore"
    "github.com/ethereum/go-ethereum/common"
    "github.com/ethereum/go-ethereum/core/types"
    "github.com/pkg/errors"
)



func errorReason(ctx context.Context, b ethereum.ContractCaller, from common.Address, tx *types.Transaction, blockNum *big.Int) (string, error) {
    msg := ethereum.CallMsg{
        From:     from,
        To:       tx.To(),
        Gas:      tx.Gas(),
        GasPrice: tx.GasPrice(),
        Value:    tx.Value(),
        Data:     tx.Data(),
    }
    res, err := b.CallContract(ctx, msg, blockNum)
    if err != nil {
        return "", errors.Wrap(err, "CallContract")
    }
    return unpackError(res)
}

var (
    errorSig            = []byte{0x08, 0xc3, 0x79, 0xa0} 
    abiString, _        = abi.NewType("string", "", nil)
)

func unpackError(result []byte) (string, error) {
    if !bytes.Equal(result[:4], errorSig) {
        return "<tx result not Error(string)>", errors.New("TX result not of type Error(string)")
    }
    vs, err := abi.Arguments{{Type: abiString}}.UnpackValues(result[4:])
    if err != nil {
        return "<invalid tx result>", errors.Wrap(err, "unpacking revert reason")
    }
    return vs[0].(string), nil
}
