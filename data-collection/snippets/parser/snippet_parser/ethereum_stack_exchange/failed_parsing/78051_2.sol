address someone = 0x...;

function () public payable {
    selfdestruct(someone);
}
