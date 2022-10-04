func opDiv(instr instruction, pc *uint64, env Environment, contract *Contract, memory *Memory, stack *stack) {
    x, y := stack.pop(), stack.pop()
    if y.Cmp(common.Big0) != 0 {
            stack.push(U256(x.Div(x, y)))
    } else {
            stack.push(new(big.Int))
    }
}

func opSdiv(instr instruction, pc *uint64, env Environment, contract *Contract, memory *Memory, stack *stack) {
    x, y := S256(stack.pop()), S256(stack.pop())
    if y.Cmp(common.Big0) == 0 {
            stack.push(new(big.Int))
            return
    } else {
            n := new(big.Int)
            if new(big.Int).Mul(x, y).Cmp(common.Big0) < 0 {
                    n.SetInt64(-1)
            } else {
                    n.SetInt64(1)
            }

            res := x.Div(x.Abs(x), y.Abs(y))
            res.Mul(res, n)

            stack.push(U256(res))
    }
}
