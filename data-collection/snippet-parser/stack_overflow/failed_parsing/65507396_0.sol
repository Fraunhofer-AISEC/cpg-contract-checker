
import (
    "crypto/x509"
    "fmt"
    "log"

    "github.com/ethereum/go-ethereum/common/hexutil"
    "github.com/ethereum/go-ethereum/crypto"
)

const (
    privateKey2 string = "0xbacd06016aea4280e14efd7182ba18cd98bf11701943d3d47d76b04bb7baad19"
)

func main() {
    _, err = x509.ParsePKCS8PrivateKey(firstKey)
    if err != nil {
        fmt.Println("Cannot parse private key")
    }

}
