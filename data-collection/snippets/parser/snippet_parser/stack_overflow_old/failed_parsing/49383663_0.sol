
input, err = erc20_token_abi.Pack("decimals")
if err!=nil {
    utils.Fatalf("packing input for decimals failed: %v",err)
}
msg=types.NewMessage(fake_src_addr,addr,0,value,gas_limit,gas_price,input,false)
evm_ctx=core.NewEVMContext(msg,block_header,chain,nil)
ethvirmac=vm.NewEVM(evm_ctx,statedb,bconf,vm_cfg)
gp=new(core.GasPool).AddGas(math.MaxBig256)
ret,gas,failed,err=core.ApplyMessage(ethvirmac,msg,gp)
tok.decimals_found=false
if (failed) {
    log.Info(fmt.Sprintf("vm err for decimals: %v, failed=%v",err,failed))
}
if err!=nil {
    log.Info(fmt.Sprintf("getting 'decimals' caused error in vm: %v",err))
}
if !((err!=nil) || (failed)) {
    int_output:=new(uint8)
    err=erc20_token_abi.Unpack(int_output,"decimals",ret)
    if err!=nil {
        log.Info(fmt.Sprintf("Contract %v: can;t upack decimals: %v",hex.EncodeToString(addr.Bytes()),err))
    } else {
        tok.decimals=int32(*int_output)
        tok.decimals_found=true
    }
}
