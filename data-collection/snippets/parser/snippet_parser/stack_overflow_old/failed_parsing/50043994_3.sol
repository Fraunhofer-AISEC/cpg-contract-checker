----------------------------------------------------------------------
FAIL: tests/SimpleStorage.go:37: SimpleStorageSuite.TestGet

tests/SimpleStorage.go:55:
    c.Assert(storedData, check.Equals, 2302)
... obtained *big.Int = 0 (%!q(big.Int=0))
... expected int = 2302

OOPS: 0 passed, 1 FAILED
