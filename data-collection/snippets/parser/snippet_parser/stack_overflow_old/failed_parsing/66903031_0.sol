def transferOwnership(address _newOwner): # not payable
  require caller == owner
  require _newOwner
  log OwnershipTransferred(address previousOwner=owner,address newOwner=_newOwner)
  owner = _newOwner

def _fallback() payable: # default function
  call owner with: 
    value call.value wei
    gas gas_remaining wei
  require ext_call.success
  log Deposit(address from=call.value, address accountAddress=caller,uint256 value=owner)

def unknown8568523a(addr _param1, uint256 _param2): # not payable
  require caller == owner
  require ext_code.size(_param1)
  call _param1.transfer(address to, uint256 value) with:
    gas gas_remaining wei
    args owner, _param2
  if not ext_call.success:
    revert with ext_call.return_data[0 len return_data.size]

def unknownb76ea962(addr _param1, array _param2) payable: 
  mem[128 len _param2.length] = _param2[all]
  require caller == owner
  mem[ceil32(_param2.length) + 128 len ceil32(_param2.length)] = _param2[all], mem[_param2.length + 128 len ceil32(_param2.length) - _param2.length]
  if not _param2.length % 32:
    call _param1.mem[ceil32(_param2.length) + 128 len 4] with:
      value call.value wei
      gas gas_remaining wei
      args mem[ceil32(_param2.length) + 132 len _param2.length - 4]
  else:
    mem[floor32(_param2.length) + ceil32(_param2.length) + 128] = mem[floor32(_param2.length) + ceil32(_param2.length) + -(_param2.length % 32) + 160 len _param2.length % 32]
    call _param1.mem[ceil32(_param2.length) + 128 len 4] with:
      value call.value wei
      gas gas_remaining wei
      args mem[ceil32(_param2.length) + 132 len floor32(_param2.length) + 28]
  require ext_call.success


def storage:
  owner is addr at storage 0

def owner(): # not payable
  return owner
