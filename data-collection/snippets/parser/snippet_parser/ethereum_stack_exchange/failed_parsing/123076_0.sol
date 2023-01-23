if bool(stor11.length): 
      if bool(stor11.length) == uint255(stor11.length) * 0.5 < 32:  
          revert with 0, 34 
      if not bool(stor11.length):   
          log 0x5514cc73: Array(len=2 * Mask(256, -1, stor11.length), data=Mask(248, 8, stor11.length)) 
      else: 
          if bool(stor11.length) != 1:  
              log 0x5514cc73: mem[ceil32(ceil32(_baseURI.length)) + 97 len -ceil32(ceil32(_baseURI.length)) - 97]   
          else: 
              idx = 0   
              s = 0 
              while idx < uint255(stor11.length) * 0.5: 
                  mem[idx + ceil32(ceil32(_baseURI.length)) + 161] = stor11[s].field_0  
                  idx = idx + 32    
                  s = s + 1 
                  continue  
              log 0x5514cc73: Array(len=2 * Mask(256, -1, stor11.length), data=mem[ceil32(ceil32(_baseURI.length)) + 161 len ceil32(uint255(stor11.length) * 0.5)]) 
  else: 
      if bool(stor11.length) == stor11.length.field_1 < 32: 
          revert with 0, 34 
      if not bool(stor11.length):   
          log 0x5514cc73: Array(len=stor11.length % 128, data=Mask(248, 8, stor11.length))  
      else: 
          if bool(stor11.length) != 1:  
              log 0x5514cc73: mem[ceil32(ceil32(_baseURI.length)) + 97 len -ceil32(ceil32(_baseURI.length)) - 97]   
          else: 
              idx = 0   
              s = 0 
              while idx < stor11.length.field_1:    
                  mem[idx + ceil32(ceil32(_baseURI.length)) + 161] = stor11[s].field_0  
                  idx = idx + 32    
                  s = s + 1 
                  continue  
              log 0x5514cc73: Array(len=stor11.length % 128, data=mem[ceil32(ceil32(_baseURI.length)) + 161 len ceil32(stor11.length.field_1)])
