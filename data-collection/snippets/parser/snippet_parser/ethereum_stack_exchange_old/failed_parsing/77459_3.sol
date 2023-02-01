contract Contract {
    function main() {
        memory[0x40:0x60] = 0x80;

        if (msg.data.length < 0x04) { stop(); }

        var var0 = msg.data[0x00:0x20] >> 0xe0;

        if (0x8da5cb5b > var0) {
            if (var0 == 0x12065fe0) {
                
                var var1 = msg.value;

                if (var1) { revert(memory[0x00:0x00]); }

                var1 = 0x009d;
                var1 = getBalance();
                var temp0 = memory[0x40:0x60];
                memory[temp0:temp0 + 0x20] = var1;
                var temp1 = memory[0x40:0x60];
                return memory[temp1:temp1 + (temp0 + 0x20) - temp1];
            } else if (var0 == 0x3ccfd60b) {
                
                var1 = msg.value;

                if (var1) { revert(memory[0x00:0x00]); }

                var1 = 0x00c8;
                withdraw();
                stop();
            } else if (var0 == 0x41c0e1b5) {
                
                var1 = msg.value;

                if (var1) { revert(memory[0x00:0x00]); }

                var1 = 0x00df;

                if (msg.sender == storage[0x00] & 0xffffffffffffffffffffffffffffffffffffffff) { selfdestruct(storage[0x00] & 0xffffffffffffffffffffffffffffffffffffffff); }

                var temp2 = memory[0x40:0x60];
                memory[temp2:temp2 + 0x20] = 0x08c379a000000000000000000000000000000000000000000000000000000000;
                var temp3 = temp2 + 0x04;
                var temp4 = temp3 + 0x20;
                memory[temp3:temp3 + 0x20] = temp4 - temp3;
                memory[temp4:temp4 + 0x20] = 0x21;
                var temp5 = temp4 + 0x20;
                memory[temp5:temp5 + 0x21] = code[0x08b5:0x08d6];
                var temp6 = memory[0x40:0x60];
                revert(memory[temp6:temp6 + (temp5 + 0x40) - temp6]);
            } else if (var0 == 0x795dbede) {
                
                var1 = msg.value;

                if (var1) { revert(memory[0x00:0x00]); }

                var1 = 0x00f6;
                var var2 = idx();
                var temp7 = memory[0x40:0x60];
                memory[temp7:temp7 + 0x20] = var2;
                var temp8 = memory[0x40:0x60];
                return memory[temp8:temp8 + (temp7 + 0x20) - temp8];
            } else { stop(); }
        } else if (var0 == 0x8da5cb5b) {
            
            var1 = msg.value;

            if (var1) { revert(memory[0x00:0x00]); }

            var1 = 0x0121;
            var2 = owner();
            var temp9 = memory[0x40:0x60];
            memory[temp9:temp9 + 0x20] = var2 & 0xffffffffffffffffffffffffffffffffffffffff;
            var temp10 = memory[0x40:0x60];
            return memory[temp10:temp10 + (temp9 + 0x20) - temp10];
        } else if (var0 == 0xd321fe29) {
            
            var1 = msg.value;

            if (var1) { revert(memory[0x00:0x00]); }

            var1 = 0x0178;
            var1 = getAmount();
            var temp11 = memory[0x40:0x60];
            memory[temp11:temp11 + 0x20] = var1;
            var temp12 = memory[0x40:0x60];
            return memory[temp12:temp12 + (temp11 + 0x20) - temp12];
        } else if (var0 == 0xd4b83992) {
            
            var1 = msg.value;

            if (var1) { revert(memory[0x00:0x00]); }

            var1 = 0x01a3;
            var2 = target();
            var temp13 = memory[0x40:0x60];
            memory[temp13:temp13 + 0x20] = var2 & 0xffffffffffffffffffffffffffffffffffffffff;
            var temp14 = memory[0x40:0x60];
            return memory[temp14:temp14 + (temp13 + 0x20) - temp14];
        } else if (var0 == 0xeb175b7e) {
            
            var1 = msg.value;

            if (var1) { revert(memory[0x00:0x00]); }

            var1 = 0x01fa;
            var1 = func_04F4();
            var temp15 = memory[0x40:0x60];
            memory[temp15:temp15 + 0x20] = var1;
            var temp16 = memory[0x40:0x60];
            return memory[temp16:temp16 + (temp15 + 0x20) - temp16];
        } else if (var0 == 0xebf6e91d) {
            
            var1 = 0x023c;
            var2 = 0x04;
            var var3 = msg.data.length - var2;

            if (var3 < 0x20) { revert(memory[0x00:0x00]); }

            hit(var2, var3);
            stop();
        } else { stop(); }
    }

    function hit(var arg0, var arg1) {
        arg0 = msg.data[arg0:arg0 + 0x20];

        if (msg.sender == storage[0x00] & 0xffffffffffffffffffffffffffffffffffffffff) {
            arg1 = 0x00;
            var var0 = 0x05e4;
            var0 = getBalance();
            arg1 = var0;
            var0 = 0x00;
            var var1 = 0x05f0;
            var1 = getAmount();
            var0 = var1;

            if (arg1 < var0) { revert(memory[0x00:0x00]); }

            var temp0 = memory[0x40:0x60] + 0x24;
            var temp1 = temp0 + 0x20;
            memory[temp0:temp0 + 0x20] = temp1 - temp0;
            memory[temp1:temp1 + 0x20] = 0x00;
            var temp2 = temp1 + 0x20 + 0x20;
            var temp3 = memory[0x40:0x60];
            memory[temp3:temp3 + 0x20] = temp2 - temp3 - 0x20;
            memory[0x40:0x60] = temp2;
            var temp4 = temp3 + 0x20;
            memory[temp4:temp4 + 0x20] = (memory[temp4:temp4 + 0x20] & 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffff) | (~0xffffffffffffffffffffffffffffffffffffffffffffffffffffffff & 0xb46300ec00000000000000000000000000000000000000000000000000000000);
            var1 = temp3;
            var var2 = 0x3c;
            var var3 = 0x06a7;
            var3 = func_083F();

            if (var3 >= var2) {
            label_0839:
                return;
            } else {
                var2 = 0x00;

                if (var2 >= arg0) {
                label_07AA:

                    if (address(address(this)).balance >= arg1) { goto label_0839; }

                    var temp5 = memory[0x40:0x60];
                    memory[temp5:temp5 + 0x20] = 0x08c379a000000000000000000000000000000000000000000000000000000000;
                    var temp6 = temp5 + 0x04;
                    var temp7 = temp6 + 0x20;
                    memory[temp6:temp6 + 0x20] = temp7 - temp6;
                    memory[temp7:temp7 + 0x20] = 0x09;
                    var temp8 = temp7 + 0x20;
                    memory[temp8:temp8 + 0x20] = 0x4469646e742077696e0000000000000000000000000000000000000000000000;
                    var temp9 = memory[0x40:0x60];
                    revert(memory[temp9:temp9 + (temp8 + 0x20) - temp9]);
                } else {
                label_06BC:
                    var3 = 0x06c3;
                    var3 = getAmount();
                    var temp10 = var3;
                    var0 = temp10;
                    var3 = storage[0x01] & 0xffffffffffffffffffffffffffffffffffffffff;
                    var var4 = var0;
                    var temp11 = var1;
                    var var5 = temp11;
                    var var6 = memory[0x40:0x60];
                    var var7 = var6;
                    var var8 = var5 + 0x20;
                    var var9 = memory[var5:var5 + 0x20];
                    var var10 = var9;
                    var var11 = var7;
                    var var12 = var8;

                    if (var10 < 0x20) {
                    label_0733:
                        var temp12 = 0x0100 ** (0x20 - var10) - 0x01;
                        var temp13 = var11;
                        memory[temp13:temp13 + 0x20] = (memory[var12:var12 + 0x20] & ~temp12) | (memory[temp13:temp13 + 0x20] & temp12);
                        var temp14 = memory[0x40:0x60];
                        var temp15;
                        temp15, memory[temp14:temp14 + 0x00] = address(var3).call.gas(msg.gas).value(var4)(memory[temp14:temp14 + (var9 + var7) - temp14]);
                        var4 = returndata.length;
                        var5 = var4;

                        if (var5 == 0x00) {
                            var2 = var2 + 0x01;

                        label_06B3:

                            if (var2 >= arg0) { goto label_07AA; }
                            else { goto label_06BC; }
                        } else {
                            var temp16 = memory[0x40:0x60];
                            var4 = temp16;
                            memory[0x40:0x60] = var4 + (returndata.length + 0x3f & ~0x1f);
                            memory[var4:var4 + 0x20] = returndata.length;
                            var temp17 = returndata.length;
                            memory[var4 + 0x20:var4 + 0x20 + temp17] = returndata[0x00:0x00 + temp17];
                            var2 = var2 + 0x01;
                            goto label_06B3;
                        }
                    } else {
                    label_0719:
                        var temp18 = var12;
                        var temp19 = var11;
                        memory[temp19:temp19 + 0x20] = memory[temp18:temp18 + 0x20];
                        var11 = temp19 + 0x20;
                        var12 = temp18 + 0x20;
                        var10 = var10 - 0x20;

                        if (var10 < 0x20) { goto label_0733; }
                        else { goto label_0719; }
                    }
                }
            }
        } else {
            var temp20 = memory[0x40:0x60];
            memory[temp20:temp20 + 0x20] = 0x08c379a000000000000000000000000000000000000000000000000000000000;
            var temp21 = temp20 + 0x04;
            var temp22 = temp21 + 0x20;
            memory[temp21:temp21 + 0x20] = temp22 - temp21;
            memory[temp22:temp22 + 0x20] = 0x21;
            var temp23 = temp22 + 0x20;
            memory[temp23:temp23 + 0x21] = code[0x08b5:0x08d6];
            var temp24 = memory[0x40:0x60];
            revert(memory[temp24:temp24 + (temp23 + 0x40) - temp24]);
        }
    }

    function getBalance() returns (var r0) { return address(address(this)).balance; }

    function withdraw() {
        if (msg.sender == storage[0x00] & 0xffffffffffffffffffffffffffffffffffffffff) {
            var var0 = storage[0x00] & 0xffffffffffffffffffffffffffffffffffffffff;
            var var1 = 0x08fc;
            var var2 = 0x0345;
            var2 = getBalance();
            var temp0 = var2;
            var temp1 = memory[0x40:0x60];
            var temp2;
            temp2, memory[temp1:temp1 + 0x00] = address(var0).call.gas(!temp0 * var1).value(temp0)(memory[temp1:temp1 + memory[0x40:0x60] - temp1]);
            var0 = !temp2;

            if (!var0) { return; }

            var temp3 = returndata.length;
            memory[0x00:0x00 + temp3] = returndata[0x00:0x00 + temp3];
            revert(memory[0x00:0x00 + returndata.length]);
        } else {
            var temp4 = memory[0x40:0x60];
            memory[temp4:temp4 + 0x20] = 0x08c379a000000000000000000000000000000000000000000000000000000000;
            var temp5 = temp4 + 0x04;
            var temp6 = temp5 + 0x20;
            memory[temp5:temp5 + 0x20] = temp6 - temp5;
            memory[temp6:temp6 + 0x20] = 0x21;
            var temp7 = temp6 + 0x20;
            memory[temp7:temp7 + 0x21] = code[0x08b5:0x08d6];
            var temp8 = memory[0x40:0x60];
            revert(memory[temp8:temp8 + (temp7 + 0x40) - temp8]);
        }
    }

    function idx() returns (var r0) { return storage[0x02]; }

    function owner() returns (var r0) { return storage[0x00] & 0xffffffffffffffffffffffffffffffffffffffff; }

    function getAmount() returns (var r0) {
        var var0 = 0x00;
        var var1 = 0x01;
        var var2 = 0x64;
        var var3 = address(storage[0x01] & 0xffffffffffffffffffffffffffffffffffffffff).balance * 0x05;

        if (var2) { return var3 / var2 - var1; }
        else { assert(); }
    }

    function target() returns (var r0) { return storage[0x01] & 0xffffffffffffffffffffffffffffffffffffffff; }

    function func_04F4() returns (var r0) { return address(storage[0x01] & 0xffffffffffffffffffffffffffffffffffffffff).balance; }

    function func_083F() returns (var r0) {
        var var0 = 0x00;
        var var1 = block.difficulty + block.timestamp;
        var var2 = 0x60;
        var var3 = 0x0852;
        var var4 = var1;
        var3 = func_0870(var4);
        var temp0 = var3;
        var2 = temp0;
        var3 = 0x64;
        var4 = keccak256(memory[var2 + 0x20:var2 + 0x20 + memory[var2:var2 + 0x20]]) >> 0x00;

        if (var3) { return var4 % var3; }
        else { assert(); }
    }

    function func_0870(var arg0) returns (var r0) {
        var var0 = 0x60;
        var temp0 = memory[0x40:0x60];
        var var2 = 0x20;
        var var1 = temp0;
        memory[var1:var1 + 0x20] = var2;
        memory[0x40:0x60] = var1 + (var2 + 0x1f & ~0x1f) + 0x20;

        if (!var2) {
            memory[var1 + 0x20:var1 + 0x20 + 0x20] = arg0;
            return var1;
        } else {
            var temp1 = var1;
            var temp2 = var2;
            memory[temp1 + 0x20:temp1 + 0x20 + temp2] = code[code.length:code.length + temp2];
            memory[temp1 + 0x20:temp1 + 0x20 + 0x20] = arg0;
            return temp1;
        }
    }
}
