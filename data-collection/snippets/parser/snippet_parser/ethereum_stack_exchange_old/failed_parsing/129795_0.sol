def _fallback() payable: # default function
  if not call.value:
      mem[96 len calldata.size] = call.data[0 len calldata.size]
      _3 = 96, mem[96 len 21]
      _4 = mem[105]
      _5 = mem[106]
      mem[calldata.size + 96] = (Mask(8, -(('mask_shl', 256, 0, -3, ('mem', ('range', 106, 32))), 0) + 256, 31) << (('mask_shl', 256, 0, -3, ('mem', ('range', 106, 32))), 0) - 256) + 1
      mem[calldata.size + 128] = uint128(_3)
      mem[64] = calldata.size + (32 * (Mask(8, -(('mask_shl', 256, 0, -3, ('var', '_5')), 0) + 256, 31) << (('mask_shl', 256, 0, -3, ('var', '_5')), 0) - 256) + 2) + 336
      idx = 0
      s = calldata.size + 96
      t = 130
      while idx < Mask(8, -(('mask_shl', 256, 0, -3, ('var', '_5')), 0) + 256, 31) << (('mask_shl', 256, 0, -3, ('var', '_5')), 0) - 256:
          static call mem[t + 12 len 20] xor 2 * Mask(159, 0, uint128(_3) xor caller xor addr(_4)).getReserves() with:
                  gas gas_remaining wei
