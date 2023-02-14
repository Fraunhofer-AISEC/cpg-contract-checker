st.title("Register for a Certificate of membership token")
accounts = w3.eth.accounts
address = st.selectbox("Select account for membership", options=accounts)



if st.button("Purchase a Certificate of Membership Token"):
    tx_hash = contract.functions.safeMint(address).transact({
        "from": address,
        "gas": 1000000,
        "value": 1000000000000000000, #Web3.fromWei(1000000000000000000, "ether")
    
    })
    st.write(tx_hash)
    receipt = w3.eth.waitForTransactionReceipt(tx_hash)
    st.write("Transaction receipt mined:")
    st.write(dict(receipt))

    tokenId = contract.functions.totalSupply()
    st.write(tokenId)

    tokenURI = contract.functions.tokenURI(tokenId)
    st.write(tokenURI)
