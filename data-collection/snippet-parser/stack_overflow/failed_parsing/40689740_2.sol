var contract = eth.contract([abi])
                     .new([array of params], 
                     {data:'0x...', from:[address], gas:47000, gasPrice: 37891200});
