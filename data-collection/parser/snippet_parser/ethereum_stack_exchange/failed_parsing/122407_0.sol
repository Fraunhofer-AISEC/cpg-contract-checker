#
#  Panoramix v4 Oct 2019 
#  Decompiled source of 0x192Bb5374ef5c20F651665b2a7752Ba1C419398e
# 
#  Let's make the world open source 
# 

def storage:
  storA3F0 is addr at storage 0xa3f0ad74e5423aebfd80d3ef4346578335a9a72aeaee59ff6cb3582b35133d50

def _fallback() payable: # default function
  require ext_code.size(storA3F0)
  static call storA3F0.implementation() with:
          gas gas_remaining wei
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require return_data.size >= 32
  delegate ext_call.return_data[0] with:
     funct call.data[0 len 4]
       gas gas_remaining wei
      args call.data[4 len calldata.size - 4]
  if not delegate.return_code:
      revert with ext_call.return_data[0 len return_data.size]
  return ext_call.return_data[0 len return_data.size]
