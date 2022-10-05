const signer = new ethers.Wallet(PRIVATE_KEY)
    const account = signer.connect(provider)
    let MY_CONT_ADDRESS_KOVAN = '0xF54f5E75B3cACe5706e27F5d44B2C06fcF28a8d6'
    const my_specific_cont = new ethers.Contract(
        MY_CONT_ADDRESS_KOVAN,
        ['function swapTokensForTokens(uint256 amountIn, uint256 amountOutMin, address[] calldata path, uint256 deadline ) external payable'],
        account
    )
    
const KOV_DAI_CONT_ADD = '0x4f96fe3b7a6cf9725f59d353f723c1bdb64ca6aa'
    const KOV_DAI_CONT_ABI = '… removed for brevity'
    const KOV_USDT_CONT_ADD = '0x07de306ff27a2b630b1141956844eb1552b956b5'
    const KOV_USDT_CONT_ABI = '… removed for brevity'

    const receiverWallet = new ethers.Wallet(PRIVATE_KEY, provider)

    const deadline = Math.floor(Date.now() / 1000) + 60 * 5

    const tx = await my_specific_cont.swapTokensForTokens(
        1,
        1,
        [
            KOV_DAI_CONT_ADD, 
            KOV_USDT_CONT_ADD  
        ],
        deadline,
        { value: 1 }
    )
    log('tx', tx)
