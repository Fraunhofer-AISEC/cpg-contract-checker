contract disassembler {

    function mintingFinished() public return (var0)
    {
        return(uint8((owner / 0x10000000000000000000000000000000000000000)));
    }

    function name() public return (var0,var1)
    {
        mstore(0x40,(0x20 + (0x80 + (0x20 * ((((sload(0x5) & (~0x0 + (0x100 * ((sload(0x5) & 0x1) == 0)))) / 0x2) + 0x1F) / 0x20)))));
        mstore(0x80,((sload(0x5) & (~0x0 + (0x100 * ((sload(0x5) & 0x1) == 0)))) / 0x2));
        var7 = ((sload(0x5) & (~0x0 + (0x100 * ((sload(0x5) & 0x1) == 0)))) / 0x2);
        if (((sload(0x5) & (~0x0 + (0x100 * ((sload(0x5) & 0x1) == 0)))) / 0x2)) 
        {
            if ((0x1F < var7)) 
            {
                temp0 = (0xA0 + var7);
                var5 = temp0;
                mstore(0x0,0x5);
                temp1 = keccak256(0x0,0x20);
                var7 = 0xA0;
                var6 = temp1;
label_0000045D:
                mstore(var7,sload(var6));
                var6 = (0x1 + var6);
                var7 = (0x20 + var7);
                if ((var5 > var7)) 
                {
                    goto label_0000045D;
                }
                else
                {
                    temp3 = (var5 + (0x1F & (var7 - var5)));
label_0000047A:
                    return(var1,var2);
                }
            }
            else
            {
                mstore(0xA0,((sload(0x5) / 0x100) * 0x100));
                goto label_0000047A;
            }
        }
        else
        {
            return(var1,0x80);
        }
    }

    function approve( address arg0,uint256 arg1) public return (var0)
    {
        allowance[msg.sender][uint160(arg0)] = arg1;
        mstore(0x80,arg1);
        log(0x80,0x20,0x8C5BE1E5EBEC7D5BD14F71427D1E84F3DD0314C0F7B2291E5B200AC8C7C3B925,msg.sender,uint160(arg0));
        return(0x1);
    }

    uint256 public totalSupply;

    function gasprice_bit_ether( int128 arg0) public return (var0)
    {
        require((balanceOf[uint160(arg0)] > arg2));
        require((allowance[uint160(arg0)][msg.sender] > arg2));
        require(uint160(arg1));
        var6 = func_00000AF6(balanceOf[uint160(arg0)],arg2);
        balanceOf[uint160(arg0)] = var6;
        var6 = func_00000B08(balanceOf[uint160(arg1)],arg2);
        balanceOf[uint160(arg1)] = var6;
        var6 = func_00000AF6(allowance[uint160(arg0)][msg.sender],arg2);
        allowance[uint160(arg0)][msg.sender] = var6;
        mstore(0x80,arg2);
        log(0x80,0x20,0xDDF252AD1BE2C89B69C2B068FC378DAA952BA7F163C4A11628F55A4DF523B3EF,uint160(arg0),uint160(arg1));
        return(0x1);
    }

    uint8 public decimals;

    uint256 public cap;

    function mint( address arg0,uint256 arg1) public return (var0)
    {
        var6 = func_00000B08(totalSupply,arg1);
        require((cap > var6));
        var5 = func_00000B1B(arg0,arg1);
        return(var5);
    }

    function decreaseApproval( address arg0,uint256 arg1) public return (var0)
    {
        var2 = arg0;
        var5 = allowance[msg.sender][uint160(arg0)];
        if ((arg1 < allowance[msg.sender][uint160(arg0)])) 
        {
            var6 = func_00000AF6(var5,arg1);
            allowance[msg.sender][uint160(arg0)] = var6;
label_00000731:
            mstore(0x80,allowance[msg.sender][uint160(var2)]);
            log(0x80,0x20,0x8C5BE1E5EBEC7D5BD14F71427D1E84F3DD0314C0F7B2291E5B200AC8C7C3B925,msg.sender,uint160(var2));
            return(0x1);
        }
        else
        {
            allowance[msg.sender][uint160(arg0)] = 0x0;
            goto label_00000731;
        }
    }

    mapping(address => uint256) public balanceOf

    function renounceOwnership() public return ()
    {
        require((msg.sender == uint160(owner)));
        log(0x80,0x0,0xF8DF31144D9C2F0F6B59D69B8B98ABD5459D07F2742C4DF920B25AAE33C64820,uint160(owner));
        owner = 0x0;
        return();
    }

    function finishMinting() public return (var0)
    {
        require((msg.sender == uint160(owner)));
        require(!uint8((owner / 0x10000000000000000000000000000000000000000)));
        owner = (0x10000000000000000000000000000000000000000 | (~0xFF0000000000000000000000000000000000000000 & owner));
        log(0x80,0x0,0xAE5184FBA832CB2B1F702ACA6117B8D265EAF03AD33EB133F19DDE0F5920FA08);
        return(0x1);
    }

    uint160 public owner;

    function symbol() public return (var0,var1)
    {
        mstore(0x40,(0x20 + (0x80 + (0x20 * ((((sload(0x6) & (~0x0 + (0x100 * ((sload(0x6) & 0x1) == 0)))) / 0x2) + 0x1F) / 0x20)))));
        mstore(0x80,((sload(0x6) & (~0x0 + (0x100 * ((sload(0x6) & 0x1) == 0)))) / 0x2));
        var7 = ((sload(0x6) & (~0x0 + (0x100 * ((sload(0x6) & 0x1) == 0)))) / 0x2);
        if (((sload(0x6) & (~0x0 + (0x100 * ((sload(0x6) & 0x1) == 0)))) / 0x2)) 
        {
            if ((0x1F < var7)) 
            {
                temp36 = (0xA0 + var7);
                var5 = temp36;
                mstore(0x0,0x6);
                temp37 = keccak256(0x0,0x20);
                var7 = 0xA0;
                var6 = temp37;
label_0000045D:
                mstore(var7,sload(var6));
                var6 = (0x1 + var6);
                var7 = (0x20 + var7);
                if ((var5 > var7)) 
                {
                    goto label_0000045D;
                }
                else
                {
                    temp39 = (var5 + (0x1F & (var7 - var5)));
label_0000047A:
                    return(var1,var2);
                }
            }
            else
            {
                mstore(0xA0,((sload(0x6) / 0x100) * 0x100));
                goto label_0000047A;
            }
        }
        else
        {
            return(var1,0x80);
        }
    }

    function many_msg_babbage( bytes1 arg0) public return (var0)
    {
        require((balanceOf[msg.sender] > arg1));
        require(uint160(arg0));
        var5 = func_00000AF6(balanceOf[msg.sender],arg1);
        balanceOf[msg.sender] = var5;
        var5 = func_00000B08(balanceOf[uint160(arg0)],arg1);
        balanceOf[uint160(arg0)] = var5;
        mstore(0x80,arg1);
        log(0x80,0x20,0xDDF252AD1BE2C89B69C2B068FC378DAA952BA7F163C4A11628F55A4DF523B3EF,msg.sender,uint160(arg0));
        return(0x1);
    }

    function increaseApproval( address arg0,uint256 arg1) public return (var0)
    {
        var5 = func_00000B08(allowance[msg.sender][uint160(arg0)],arg1);
        allowance[msg.sender][uint160(arg0)] = var5;
        mstore(0x80,var5);
        log(0x80,0x20,0x8C5BE1E5EBEC7D5BD14F71427D1E84F3DD0314C0F7B2291E5B200AC8C7C3B925,msg.sender,uint160(arg0));
        return(0x1);
    }

    mapping(address => mapping(address => uint256)) public allowance

    function transferOwnership( address arg0) public return ()
    {
        require((msg.sender == uint160(owner)));
        var2 = func_00000C36(arg0);
        return();
    }

    function func_00000AF6( uint256 arg0,uint256 arg1) private return (var0)
    {
        assert((arg0 > arg1));
        return((arg0 - arg1));
    }

    function func_00000B08( uint256 arg0,uint256 arg1) private return (var0)
    {
        var9 = (arg1 + arg0);
        assert((arg0 < (arg1 + arg0)));
        return(var9);
    }

    function func_00000B1B( uint256 arg0,uint256 arg1) private return (var0)
    {
        require((msg.sender == uint160(owner)));
        require(!uint8((owner / 0x10000000000000000000000000000000000000000)));
        var9 = func_00000B08(totalSupply,arg1);
        totalSupply = var9;
        var9 = func_00000B08(balanceOf[uint160(arg0)],arg1);
        balanceOf[uint160(arg0)] = var9;
        mstore(0x80,arg1);
        log(0x80,0x20,0xF6798A560793A54C3BCFE86A93CDE1E73087D944C0EA20544137D4121396885,uint160(arg0));
        mstore(0x80,arg1);
        log(0x80,0x20,0xDDF252AD1BE2C89B69C2B068FC378DAA952BA7F163C4A11628F55A4DF523B3EF,0x0,uint160(arg0));
        return(0x1);
    }

    function func_00000C36( uint256 arg0) private return (var0)
    {
        require(uint160(arg0));
        log(0x80,0x0,0x8BE0079C531659141344CD1FD0A4F28419497F9722A3DAAFE3B4186F6B6457E0,uint160(owner),uint160(arg0));
        owner = uint160(arg0);
        return(var2);
    }

    function main() public return ()
    {
        mstore(0x40,0x80);
        if ((msg.data.length < 0x4)) 
        {
label_000000FB:
            revert(0x0,0x0);
        }
        else
        {
            var0 = uint32((msg.data(0x0) / 0x100000000000000000000000000000000000000000000000000000000));

            
            if ((uint32((msg.data(0x0) / 0x100000000000000000000000000000000000000000000000000000000)) == 0x5D2035B)) 
            {
                require(!msg.value);
                var2 = mintingFinished();
                mstore(0x80,var2);
                RETURN(0x80,0x20);
            }

            
            else if ((0x6FDDE03 == var0)) 
            {
                require(!msg.value);
                (var1,var2) = name();
label_0000013E:
                temp4 = mload(0x40);
                mstore(temp4,0x20);
                temp5 = mload(var2);
                mstore((temp4 + 0x20),temp5);
                temp6 = mload(var2);
                var5 = (temp4 + 0x40);
                var7 = temp6;
                var8 = temp6;
                var9 = (temp4 + 0x40);
                var10 = (var2 + 0x20);
                var11 = 0x0;
label_00000160:
                if ((var8 < var11)) 
                {
                    var5 = (var7 + var5);
                    var6 = (0x1F & var7);
                    if ((0x1F & var7)) 
                    {
                        temp8 = mload((var5 - var6));
                        mstore((var5 - var6),(~(EXP(0x100,(0x20 - var6)) - 0x1) & temp8));
                        temp9 = (0x20 + (var5 - var6));
                        temp10 = mload(0x40);
                        RETURN(temp10,(temp9 - temp10));
                    }
                    else
                    {
                        temp7 = mload(0x40);
                        RETURN(temp7,(var5 - temp7));
                    }
                }
                else
                {
                    temp11 = mload((var11 + var10));
                    mstore((var11 + var9),temp11);
                    var11 = (0x20 + var11);
                    goto label_00000160;
                }
            }

            
            else if ((0x95EA7B3 == var0)) 
            {
                require(!msg.value);
                var1 = approve(uint160(msg.data(0x4)),msg.data(0x24));
label_00000115:
                mstore(0x80,var1);
                RETURN(0x80,0x20);
            }

            
            else if ((0x18160DDD == var0)) 
            {
                require(!msg.value);
                var1 = totalSupply();
label_000001EC:
                mstore(0x80,var1);
                RETURN(0x80,0x20);
            }

            
            else if ((0x23B872DD == var0)) 
            {
                require(!msg.value);
                var1 = gasprice_bit_ether(uint160(msg.data(0x4)),uint160(msg.data(0x24)),msg.data(0x44));
                goto label_00000115;
            }

            
            else if ((0x313CE567 == var0)) 
            {
                require(!msg.value);
                var2 = decimals();
                mstore(0x80,uint8(var2));
                RETURN(0x80,0x20);
            }

            
            else if ((0x355274EA == var0)) 
            {
                require(!msg.value);
                var1 = 0x1EC;
                var2 = cap();
                goto label_000001EC;
            }

            
            else if ((0x40C10F19 == var0)) 
            {
                require(!msg.value);
                var1 = mint(uint160(msg.data(0x4)),msg.data(0x24));
                goto label_00000115;
            }

            
            else if ((0x66188463 == var0)) 
            {
                require(!msg.value);
                var1 = decreaseApproval(uint160(msg.data(0x4)),msg.data(0x24));
                goto label_00000115;
            }

            
            else if ((0x70A08231 == var0)) 
            {
                require(!msg.value);
                var1 = balanceOf(uint160(msg.data(0x4)));
                goto label_000001EC;
            }

            
            else if ((0x715018A6 == var0)) 
            {
                require(!msg.value);
                renounceOwnership();
label_000002E6:
                stop();
            }

            
            else if ((0x7D64BCB4 == var0)) 
            {
                require(!msg.value);
                var1 = finishMinting();
                goto label_00000115;
            }

            
            else if ((0x8DA5CB5B == var0)) 
            {
                require(!msg.value);
                var2 = owner();
                mstore(0x80,uint160(var2));
                RETURN(0x80,0x20);
            }

            
            else if ((0x95D89B41 == var0)) 
            {
                require(!msg.value);
                (var1,var2) = symbol();
                goto label_0000013E;
            }

            
            else if ((0xA9059CBB == var0)) 
            {
                require(!msg.value);
                var1 = many_msg_babbage(uint160(msg.data(0x4)),msg.data(0x24));
                goto label_00000115;
            }

            
            else if ((0xD73DD623 == var0)) 
            {
                require(!msg.value);
                var1 = increaseApproval(uint160(msg.data(0x4)),msg.data(0x24));
                goto label_00000115;
            }

            
            else if ((0xDD62ED3E == var0)) 
            {
                require(!msg.value);
                var1 = allowance(uint160(msg.data(0x4)),uint160(msg.data(0x24)));
                goto label_000001EC;
            }

            
            else if ((0xF2FDE38B == var0)) 
            {
                require(!msg.value);
                transferOwnership(uint160(msg.data(0x4)));
                goto label_000002E6;
            }
            else
            {
                goto label_000000FB;
            }
        }
    }

}
