package main

import (
    "log"
    "math/big"

    "github.com/ethereum/go-ethereum/accounts/abi"
    "github.com/ethereum/go-ethereum/common"
)

type Return struct {
    Success bool
    Addr    common.Address
    Data    []byte
}

func main() {
    parsedABI, err := abi.JSON(strings.NewReader(contractABI))
    if err != nil {
        log.Fatalf("Failed to parse contract ABI: %v", err)
    }

    data, err := parsedABI.Pack("call1")
    if err != nil {
        log.Fatalf("Failed to pack data for call1: %v", err)
    }

    values := make([]interface{}, 0)
    if err := parsedABI.UnpackIntoInterface(&values, "call1", data); err != nil {
        log.Fatalf("Failed to unpack data: %v", err)
    }

    outputDataList := make([]Return, len(values))
    for i, v := range values {
        val, ok := v.([]interface{})
        if !ok {
            log.Fatalf("Failed to convert to interface slice")
        }

        outputDataList[i] = Return{
            Success: val[0].(*big.Int).Cmp(big.NewInt(1)) == 0,
            Addr:    common.HexToAddress(val[1].(string)),
            Data:    val[2].([]byte),
        }
    }

    log.Println(outputDataList)
}
