lastBox = Box[-1]

address0 = '0x123...'
address1 = '0x321...'

# not sure show to access a mapping in brownie, but the following doesn't work
uintValue = lastBox.addressToAddressToUint[address0][address1]
