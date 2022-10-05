#  I failed with these: 
#  - withdrawEth(address _to, uint256 _value)
#  All the rest is below.
#

const decimals = 18

def storage:
  owner is addr at storage 0
  stor1 is array of struct at storage 1
  stor2 is array of struct at storage 2
  totalSupply is uint256 at storage 3
  stor4 is uint256 at storage 4
  stor5 is mapping of uint8 at storage 5
  stor6 is mapping of uint256 at storage 6
  allowance is mapping of uint256 at storage 7

def totalSupply(): # not payable
  return totalSupply

def owner(): # not payable
  return owner

def allowance(address _owner, address _spender): # not payable
  require calldata.size - 4 >=′ 64
  require _owner == _owner
  require _spender == _spender
  return allowance[addr(_owner)][addr(_spender)]

#
#  Regular functions
#

def _fallback() payable: # default function
  revert

def setAirdropAmount(uint256 _amount): # not payable
  require calldata.size - 4 >=′ 32
  if owner != caller:
      revert with 0, 'Ownable: caller is not the owner'
  stor4 = _amount

def renounceOwnership(): # not payable
  if owner != caller:
      revert with 0, 'Ownable: caller is not the owner'
  owner = 0
  log OwnershipTransferred(
        address previousOwner=owner,
        address newOwner=0)

def balanceOf(address _owner): # not payable
  require calldata.size - 4 >=′ 32
  require _owner == _owner
  if stor5[addr(_owner)]:
      return stor6[addr(_owner)]
  return stor4

def transferOwnership(address _newOwner): # not payable
  require calldata.size - 4 >=′ 32
  require _newOwner == _newOwner
  if owner != caller:
      revert with 0, 'Ownable: caller is not the owner'
  if not _newOwner:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'Ownable: new owner is the zero address'
  owner = _newOwner
  log OwnershipTransferred(
        address previousOwner=owner,
        address newOwner=_newOwner)

def approve(address _spender, uint256 _value): # not payable
  require calldata.size - 4 >=′ 64
  require _spender == _spender
  if not caller:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'ERC20: approve from the zero address'
  if not _spender:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'ERC20: approve to the zero address'
  allowance[caller][addr(_spender)] = _value
  log Approval(
        address owner=_value,
        address spender=caller,
        uint256 value=_spender)
  return 1

def mint(address _to, uint256 _amount) payable: 
  require calldata.size - 4 >=′ 64
  require _to == _to
  if owner != caller:
      revert with 0, 'Ownable: caller is not the owner'
  if not _to:
      revert with 0, 'ERC20: mint to the zero address'
  if totalSupply > !_amount:
      revert with 0, 17
  totalSupply += _amount
  if stor6[addr(_to)] > !_amount:
      revert with 0, 17
  stor6[addr(_to)] += _amount
  stor5[addr(_to)] = 1
  log 0xfeddf252: _amount, 0, _to

def burn(address _guy, uint256 _wad) payable: 
  require calldata.size - 4 >=′ 64
  require _guy == _guy
  if owner != caller:
      revert with 0, 'Ownable: caller is not the owner'
  if not _guy:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'ERC20: burn from the zero address'
  if stor6[addr(_guy)] < _wad:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'ERC20: burn amount exceeds balance'
  stor6[addr(_guy)] -= _wad
  if totalSupply < _wad:
      revert with 0, 17
  totalSupply -= _wad
  stor5[addr(_guy)] = 0
  log 0xfeddf252: _wad, _guy, 0

def increaseAllowance(address _spender, uint256 _addedValue): # not payable
  require calldata.size - 4 >=′ 64
  require _spender == _spender
  if allowance[caller][addr(_spender)] > !_addedValue:
      revert with 0, 17
  if not caller:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'ERC20: approve from the zero address'
  if not _spender:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'ERC20: approve to the zero address'
  allowance[caller][addr(_spender)] = allowance[caller][addr(_spender)] + _addedValue
  log Approval(
        address owner=(allowance[caller][addr(_spender)] + _addedValue),
        address spender=caller,
        uint256 value=_spender)
  return 1

def decreaseAllowance(address _spender, uint256 _subtractedValue): # not payable
  require calldata.size - 4 >=′ 64
  require _spender == _spender
  if allowance[caller][addr(_spender)] < _subtractedValue:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'ERC20: decreased allowance below zero'
  if not caller:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'ERC20: approve from the zero address'
  if not _spender:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'ERC20: approve to the zero address'
  allowance[caller][addr(_spender)] = allowance[caller][addr(_spender)] - _subtractedValue
  log Approval(
        address owner=(allowance[caller][addr(_spender)] - _subtractedValue),
        address spender=caller,
        uint256 value=_spender)
  return 1

def transfer(address _to, uint256 _value): # not payable
  require calldata.size - 4 >=′ 64
  require _to == _to
  if not caller:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'ERC20: transfer from the zero address'
  if not _to:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'ERC20: transfer to the zero address'
  if not stor5[caller]:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 
                  'ERC20: token must be unlocked before transfer.Visit yetiswap.io for more info''
  if stor6[caller] < _value:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'ERC20: transfer amount exceeds balance'
  stor6[caller] -= _value
  if stor6[_to] > !_value:
      revert with 0, 17
  stor6[_to] += _value
  stor5[addr(_to)] = 1
  log 0xfeddf252: _value, caller, _to
  return 1

def unknown512d7cfd() payable: 
  require calldata.size - 4 >=′ 64
  require cd <= 18446744073709551615
  require cd <′ calldata.size
  if ('cd', 4).length > 18446744073709551615:
      revert with 0, 65
  if ceil32(32 * ('cd', 4).length) + 97 > 18446744073709551615 or ceil32(32 * ('cd', 4).length) + 97 < 96:
      revert with 0, 65
  mem[96] = ('cd', 4).length
  require calldata.size >= cd * ('cd', 4).length) + 36
  s = cd[4] + 36
  t = 128
  idx = 0
  while idx < ('cd', 4).length:
      require cd[s] == addr(cd[s])
      mem[t] = cd[s]
      s = s + 32
      t = t + 32
      idx = idx + 1
      continue 
  idx = 0
  while idx < ('cd', 4).length:
      if idx >= mem[96]:
          revert with 0, 50
      _18 = mem[(32 * idx) + 128]
      mem[ceil32(32 * ('cd', 4).length) + 97] = cd[36]
      log 0xfeddf252: cd
      if idx == -1:
          revert with 0, 17
      idx = idx + 1
      continue 

def withdrawToken(address _token, address _to, uint256 _value) payable: 
  require calldata.size - 4 >=′ 96
  require _token == _token
  require _to == _to
  if owner != caller:
      revert with 0, 'Ownable: caller is not the owner'
  require ext_code.size(_to)
  static call _to.balanceOf(address owner) with:
          gas gas_remaining wei
         args this.address
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require return_data.size >=′ 32
  if _value:
      if _value <= 0:
          revert with 0, 'bad amount'
      if ext_call.return_data < _value:
          revert with 0, 'bad amount'
      require ext_code.size(_to)
      call _to.transfer(address to, uint256 value) with:
           gas gas_remaining wei
          args addr(_token), _value
  else:
      if ext_call.return_data <= 0:
          revert with 0, 'bad amount'
      if ext_call.return_data < ext_call.return_data[0]:
          revert with 0, 'bad amount'
      require ext_code.size(_to)
      call _to.transfer(address to, uint256 value) with:
           gas gas_remaining wei
          args addr(_token), ext_call.return_data[0]
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require return_data.size >=′ 32
  require ext_call.return_data == bool(ext_call.return_data[0])

def transferFrom(address _from, address _to, uint256 _value): # not payable
  require calldata.size - 4 >=′ 96
  require _from == _from
  require _to == _to
  if not _from:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'ERC20: transfer from the zero address'
  if not _to:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'ERC20: transfer to the zero address'
  if not stor5[addr(_from)]:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 
                  'ERC20: token must be unlocked before transfer.Visit yetiswap.io for more info''
  if stor6[addr(_from)] < _value:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'ERC20: transfer amount exceeds balance'
  stor6[addr(_from)] -= _value
  if stor6[_to] > !_value:
      revert with 0, 17
  stor6[_to] += _value
  stor5[addr(_to)] = 1
  log 0xfeddf252: _value, _from, _to
  if allowance[addr(_from)][caller] < _value:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'ERC20: transfer amount exceeds allowance'
  if not _from:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'ERC20: approve from the zero address'
  if not caller:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 'ERC20: approve to the zero address'
  allowance[addr(_from)][caller] = allowance[addr(_from)][caller] - _value
  log Approval(
        address owner=(allowance[addr(_from)][caller] - _value),
        address spender=_from,
        uint256 value=caller)
  return 1

def name(): # not payable
  if bool(stor1.length):
      if bool(stor1.length) == uint255(stor1.length) * 0.5 < 32:
          revert with 0, 34
      if bool(stor1.length):
          if bool(stor1.length) == uint255(stor1.length) * 0.5 < 32:
              revert with 0, 34
          if Mask(256, -1, stor1.length):
              if 31 < uint255(stor1.length) * 0.5:
                  mem[128] = uint256(stor1.field_0)
                  idx = 128
                  s = 0
                  while (uint255(stor1.length) * 0.5) + 96 > idx:
                      mem[idx + 32] = stor1[s].field_256
                      idx = idx + 32
                      s = s + 1
                      continue 
                  return Array(len=2 * Mask(256, -1, stor1.length), data=mem[128 len ceil32(uint255(stor1.length) * 0.5)])
              mem[128] = 256 * stor1.length.field_8
      else:
          if bool(stor1.length) == stor1.length.field_1 < 32:
              revert with 0, 34
          if stor1.length.field_1:
              if 31 < stor1.length.field_1:
                  mem[128] = uint256(stor1.field_0)
                  idx = 128
                  s = 0
                  while stor1.length.field_1 + 96 > idx:
                      mem[idx + 32] = stor1[s].field_256
                      idx = idx + 32
                      s = s + 1
                      continue 
                  return Array(len=2 * Mask(256, -1, stor1.length), data=mem[128 len ceil32(uint255(stor1.length) * 0.5)])
              mem[128] = 256 * stor1.length.field_8
      mem[ceil32(uint255(stor1.length) * 0.5) + 192 len ceil32(uint255(stor1.length) * 0.5)] = mem[128 len ceil32(uint255(stor1.length) * 0.5)]
      if ceil32(uint255(stor1.length) * 0.5) > uint255(stor1.length) * 0.5:
          mem[ceil32(uint255(stor1.length) * 0.5) + (uint255(stor1.length) * 0.5) + 192] = 0
      return Array(len=2 * Mask(256, -1, stor1.length), data=mem[128 len ceil32(uint255(stor1.length) * 0.5)], mem[(2 * ceil32(uint255(stor1.length) * 0.5)) + 192 len 2 * ceil32(uint255(stor1.length) * 0.5)]), 
  if bool(stor1.length) == stor1.length.field_1 < 32:
      revert with 0, 34
  if bool(stor1.length):
      if bool(stor1.length) == uint255(stor1.length) * 0.5 < 32:
          revert with 0, 34
      if Mask(256, -1, stor1.length):
          if 31 < uint255(stor1.length) * 0.5:
              mem[128] = uint256(stor1.field_0)
              idx = 128
              s = 0
              while (uint255(stor1.length) * 0.5) + 96 > idx:
                  mem[idx + 32] = stor1[s].field_256
                  idx = idx + 32
                  s = s + 1
                  continue 
              return Array(len=stor1.length % 128, data=mem[128 len ceil32(stor1.length.field_1)])
          mem[128] = 256 * stor1.length.field_8
  else:
      if bool(stor1.length) == stor1.length.field_1 < 32:
          revert with 0, 34
      if stor1.length.field_1:
          if 31 < stor1.length.field_1:
              mem[128] = uint256(stor1.field_0)
              idx = 128
              s = 0
              while stor1.length.field_1 + 96 > idx:
                  mem[idx + 32] = stor1[s].field_256
                  idx = idx + 32
                  s = s + 1
                  continue 
              return Array(len=stor1.length % 128, data=mem[128 len ceil32(stor1.length.field_1)])
          mem[128] = 256 * stor1.length.field_8
  mem[ceil32(stor1.length.field_1) + 192 len ceil32(stor1.length.field_1)] = mem[128 len ceil32(stor1.length.field_1)]
  if ceil32(stor1.length.field_1) > stor1.length.field_1:
      mem[ceil32(stor1.length.field_1) + stor1.length.field_1 + 192] = 0
  return Array(len=stor1.length % 128, data=mem[128 len ceil32(stor1.length.field_1)], mem[(2 * ceil32(stor1.length.field_1)) + 192 len 2 * ceil32(stor1.length.field_1)]), 

def symbol(): # not payable
  if bool(stor2.length):
      if bool(stor2.length) == uint255(stor2.length) * 0.5 < 32:
          revert with 0, 34
      if bool(stor2.length):
          if bool(stor2.length) == uint255(stor2.length) * 0.5 < 32:
              revert with 0, 34
          if Mask(256, -1, stor2.length):
              if 31 < uint255(stor2.length) * 0.5:
                  mem[128] = uint256(stor2.field_0)
                  idx = 128
                  s = 0
                  while (uint255(stor2.length) * 0.5) + 96 > idx:
                      mem[idx + 32] = stor2[s].field_256
                      idx = idx + 32
                      s = s + 1
                      continue 
                  return Array(len=2 * Mask(256, -1, stor2.length), data=mem[128 len ceil32(uint255(stor2.length) * 0.5)])
              mem[128] = 256 * stor2.length.field_8
      else:
          if bool(stor2.length) == stor2.length.field_1 < 32:
              revert with 0, 34
          if stor2.length.field_1:
              if 31 < stor2.length.field_1:
                  mem[128] = uint256(stor2.field_0)
                  idx = 128
                  s = 0
                  while stor2.length.field_1 + 96 > idx:
                      mem[idx + 32] = stor2[s].field_256
                      idx = idx + 32
                      s = s + 1
                      continue 
                  return Array(len=2 * Mask(256, -1, stor2.length), data=mem[128 len ceil32(uint255(stor2.length) * 0.5)])
              mem[128] = 256 * stor2.length.field_8
      mem[ceil32(uint255(stor2.length) * 0.5) + 192 len ceil32(uint255(stor2.length) * 0.5)] = mem[128 len ceil32(uint255(stor2.length) * 0.5)]
      if ceil32(uint255(stor2.length) * 0.5) > uint255(stor2.length) * 0.5:
          mem[ceil32(uint255(stor2.length) * 0.5) + (uint255(stor2.length) * 0.5) + 192] = 0
      return Array(len=2 * Mask(256, -1, stor2.length), data=mem[128 len ceil32(uint255(stor2.length) * 0.5)], mem[(2 * ceil32(uint255(stor2.length) * 0.5)) + 192 len 2 * ceil32(uint255(stor2.length) * 0.5)]), 
  if bool(stor2.length) == stor2.length.field_1 < 32:
      revert with 0, 34
  if bool(stor2.length):
      if bool(stor2.length) == uint255(stor2.length) * 0.5 < 32:
          revert with 0, 34
      if Mask(256, -1, stor2.length):
          if 31 < uint255(stor2.length) * 0.5:
              mem[128] = uint256(stor2.field_0)
              idx = 128
              s = 0
              while (uint255(stor2.length) * 0.5) + 96 > idx:
                  mem[idx + 32] = stor2[s].field_256
                  idx = idx + 32
                  s = s + 1
                  continue 
              return Array(len=stor2.length % 128, data=mem[128 len ceil32(stor2.length.field_1)])
          mem[128] = 256 * stor2.length.field_8
  else:
      if bool(stor2.length) == stor2.length.field_1 < 32:
          revert with 0, 34
      if stor2.length.field_1:
          if 31 < stor2.length.field_1:
              mem[128] = uint256(stor2.field_0)
              idx = 128
              s = 0
              while stor2.length.field_1 + 96 > idx:
                  mem[idx + 32] = stor2[s].field_256
                  idx = idx + 32
                  s = s + 1
                  continue 
              return Array(len=stor2.length % 128, data=mem[128 len ceil32(stor2.length.field_1)])
          mem[128] = 256 * stor2.length.field_8
  mem[ceil32(stor2.length.field_1) + 192 len ceil32(stor2.length.field_1)] = mem[128 len ceil32(stor2.length.field_1)]
  if ceil32(stor2.length.field_1) > stor2.length.field_1:
      mem[ceil32(stor2.length.field_1) + stor2.length.field_1 + 192] = 0
  return Array(len=stor2.length % 128, data=mem[128 len ceil32(stor2.length.field_1)], mem[(2 * ceil32(stor2.length.field_1)) + 192 len 2 * ceil32(stor2.length.field_1)]), 

