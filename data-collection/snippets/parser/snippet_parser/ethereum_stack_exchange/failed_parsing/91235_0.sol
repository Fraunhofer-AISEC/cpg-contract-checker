#
#  Panoramix v4 Oct 2019 
#  Decompiled source of 0xF8681Dad1cE4f1f414FB07FC07f81a3A82E91D8f
# 
#  Let's make the world open source 
# 

def storage:
  unknown89977cdfAddress is addr at storage 0
  unknownf85f97ddAddress is addr at storage 1
  stor2 is mapping of uint8 at storage 2
  stor3 is mapping of uint8 at storage 3
  history is array of struct at storage 4
  stor5 is addr at storage 5
  stor6 is array of uint256 at storage 6
  stor7 is uint256 at storage 7
  stor8 is uint256 at storage 8

def unknown89977cdf(): # not payable
  return unknown89977cdfAddress

def unknown930339be(addr _param1): # not payable
  return bool(stor3[_param1])

def History(uint256 _param1): # not payable
  require _param1 < history.length
  mem[256] = uint256(stor[sha3((4 * _param1) + ('name', 'history', 4) + 1)].field_0)
  idx = 256
  s = 0
  while stor[(4 * _param1) + ('name', 'history', 4) + 1].length + 256 > idx + 32:
      mem[idx + 32] = uint256(stor[s + sha3((4 * _param1) + ('name', 'history', 4) + 1)].field_256)
      idx = idx + 32
      s = s + 1
      continue 
  return addr(history[_param1].field_0), 
         Array(len=stor[(4 * _param1) + ('name', 'history', 4) + 1].length, data=mem[256 len stor[(4 * _param1) + ('name', 'history', 4) + 1].length + (floor32(stor[(4 * _param1) + ('name', 'history', 4) + 1].length - 1) + -stor[(4 * _param1) + ('name', 'history', 4) + 1].length + 32 % 32)]),
         uint256(history[_param1].field_512),
         uint256(history[_param1].field_768)

def Managers(address _param1): # not payable
  return bool(stor2[_param1])

def unknownf85f97dd(): # not payable
  return unknownf85f97ddAddress

#
#  Regular functions
#

def _fallback() payable: # default function
  stop

def unknown2fac8979(): # not payable
  if caller == unknownf85f97ddAddress:
      unknown89977cdfAddress = unknownf85f97ddAddress

def unknown90a68455(addr _param1): # not payable
  require caller == unknown89977cdfAddress
  unknownf85f97ddAddress = _param1

def unknownc144811f() payable: 
  require caller == unknown89977cdfAddress
  call caller with:
     value eth.balance(this.address) wei
       gas 2300 * is_zero(value) wei
  require ext_call.success

def unknownbe9474bb(addr _param1, bool _param2): # not payable
  require caller == unknown89977cdfAddress
  stor2[addr(_param1)] = uint8(_param2)

def unknown474dacce(addr _param1, bool _param2): # not payable
  if unknown89977cdfAddress != caller:
      require bool(stor2[caller]) == 1
  stor3[addr(_param1)] = uint8(_param2)

def unknown9003e39a(addr _param1, array _param2) payable: 
  mem[128 len _param2.length] = _param2[all]
  require caller == unknown89977cdfAddress
  mem[ceil32(_param2.length) + 128 len ceil32(_param2.length)] = _param2[all], mem[_param2.length + 128 len ceil32(_param2.length) - _param2.length]
  if not _param2.length % 32:
      delegate _param1.mem[ceil32(_param2.length) + 128 len 4] with:
           gas gas_remaining - 25710 wei
          args mem[ceil32(_param2.length) + 132 len _param2.length - 4]
  else:
      mem[floor32(_param2.length) + ceil32(_param2.length) + 128] = mem[floor32(_param2.length) + ceil32(_param2.length) + -(_param2.length % 32) + 160 len _param2.length % 32]
      delegate _param1.mem[ceil32(_param2.length) + 128 len 4] with:
           gas gas_remaining - 25710 wei
          args mem[ceil32(_param2.length) + 132 len floor32(_param2.length) + 28]
  require delegate.return_code

def unknown4b906714(addr _param1, uint256 _param2, array _param3) payable: 
  mem[128 len _param3.length] = _param3[all]
  require caller == unknown89977cdfAddress
  mem[ceil32(_param3.length) + 128 len ceil32(_param3.length)] = _param3[all], mem[_param3.length + 128 len ceil32(_param3.length) - _param3.length]
  if not _param3.length % 32:
      call _param1.mem[ceil32(_param3.length) + 128 len 4] with:
         value _param2 wei
           gas gas_remaining - 34710 wei
          args mem[ceil32(_param3.length) + 132 len _param3.length - 4]
  else:
      mem[floor32(_param3.length) + ceil32(_param3.length) + 128] = mem[floor32(_param3.length) + ceil32(_param3.length) + -(_param3.length % 32) + 160 len _param3.length % 32]
      call _param1.mem[ceil32(_param3.length) + 128 len 4] with:
         value _param2 wei
           gas gas_remaining - 34710 wei
          args mem[ceil32(_param3.length) + 132 len floor32(_param3.length) + 28]
  require ext_call.success

def AddMessage(address _adr, uint256 _val, string _data): # not payable
  mem[128 len _data.length] = _data[all]
  if not stor3[addr(_adr)]:
      stor5 = _adr
      stor8 = block.timestamp
      stor7 = _val
      uint256(stor6[]) = Array(len=_data.length, data=_data[all])
      history.length++
      if not history.length <= history.length + 1:
          mem[0] = 4
          idx = 4 * history.length + 1
          while sha3(4) + (4 * history.length) > idx + sha3(mem[0]):
              addr(stor[idx + sha3(mem[0])]) = 0
              uint256(stor[idx + sha3(mem[0]) + 1]) = 0
              if 31 < stor[idx + sha3(mem[0]) + 1].length:
                  mem[0] = idx + sha3(mem[0]) + 1
                  s = sha3(idx + sha3(mem[0]) + 1)
                  while sha3(idx + sha3(mem[0]) + 1) + (stor[idx + sha3(mem[0]) + 1].length + 31 / 32) > s:
                      uint256(stor[s]) = 0
                      s = s + 1
                      continue 
              uint256(stor[idx + sha3(mem[0]) + 2]) = 0
              uint256(stor[idx + sha3(mem[0]) + 3]) = 0
              idx = idx + 4
              continue 
      addr(history[history.length].field_0) = stor5
      if 31 >= stor6.length:
          uint256(history[history.length].field_256) = stor6.length
          idx = 0
          while stor[(4 * history.length) + ('name', 'history', 4) + 1].length + 31 / 32 > idx:
              uint256(stor[idx + sha3((4 * history.length) + ('name', 'history', 4) + 1)].field_0) = 0
              idx = idx + 1
              continue 
      else:
          uint256(history[history.length].field_256) = Mask(255, 1, (256 * not bool(stor6.length)) - 1 and stor6.length) + 1
          if not Mask(255, 1, (256 * not bool(stor6.length)) - 1 and stor6.length):
              idx = 0
              while stor[(4 * history.length) + ('name', 'history', 4) + 1].length + 31 / 32 > idx:
                  uint256(stor[idx + sha3((4 * history.length) + ('name', 'history', 4) + 1)].field_0) = 0
                  idx = idx + 1
                  continue 
          else:
              s = 0
              idx = 0
              while stor6.length + 31 / 32 > idx:
                  uint256(stor[s + sha3((4 * history.length) + ('name', 'history', 4) + 1)].field_0) = uint256(stor6[idx])
                  s = s + 1
                  idx = idx + 1
                  continue 
              idx = stor6.length + 31 / 32
              while stor[(4 * history.length) + ('name', 'history', 4) + 1].length + 31 / 32 > idx:
                  uint256(stor[idx + sha3((4 * history.length) + ('name', 'history', 4) + 1)].field_0) = 0
                  idx = idx + 1
                  continue 
      uint256(history[history.length].field_512) = stor7
      uint256(history[history.length].field_768) = stor8
      require 0 < _data.length
      if Mask(8, 248, mem[128]) == 'C':
          require _val <= 0

