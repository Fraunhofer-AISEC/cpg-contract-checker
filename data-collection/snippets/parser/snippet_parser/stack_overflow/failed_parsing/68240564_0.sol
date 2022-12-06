def storage:
  stor0 is uint256 at storage 0

def _fallback() payable: # default function
  require calldata.size >= 4
  require not call.value
  if mem[0 len 28], uint32(call.func_hash) != 391405269:
      require mem[0 len 28], uint32(call.func_hash) == refund()
      static call 0xbb4cdb9cbd36b01bd1cbaebf2de08d9173bc095c.balanceOf(address owner) with:
              gas gas_remaining wei
             args stor0
      require ext_call.success
      require return_data.size > 31
      call 0xbb4cdb9cbd36b01bd1cbaebf2de08d9173bc095c.transfer(address to, uint256 value) with:
           gas gas_remaining wei
          args stor0, ext_call.return_data[0]
      require ext_call.success
      require return_data.size > 31
  else:
      require not Mask(256, -160, _param1)
      call 0xbb4cdb9cbd36b01bd1cbaebf2de08d9173bc095c.transfer(address to, uint256 value) with:
           gas gas_remaining wei
          args _param1, 10^15
      require ext_call.success
      require return_data.size > 31
      require ext_code.size(_param1)
      call _param1.0xfff6cae9 with:
           gas gas_remaining wei
      require ext_call.success
