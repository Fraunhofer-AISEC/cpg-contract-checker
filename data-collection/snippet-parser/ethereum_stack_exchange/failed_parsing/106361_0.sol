import { tokens, ether, EVM_REVERT, ETHER_ADDRESS } from './helpers'

const Token = artifacts.require('./Token')
const Exchange = artifacts.require('./Exchange')

require('chai')
  .use(require('chai-as-promised'))
  .should()

contract('Exchange', ([deployer, feeAccount, user1]) => {
  let token
  let exchange
  const feePercent = 10

  beforeEach(async () => {
    
    token = await Token.new()

    
    token.transfer(user1, tokens(100), { from: deployer })

    
    exchange = await Exchange.new(feeAccount, feePercent)
  })

  describe('deployment', () => {
    it('tracks the fee account', async () => {
      const result = await exchange.feeAccount()
      result.should.equal(feeAccount)
    })

    it('tracks the fee percent', async () => {
      const result = await exchange.feePercent()
      result.toString().should.equal(feePercent.toString())
    })
  })

  describe('fallback', () => {
    it('reverts when Ether is sent', async () => {
      await exchange.sendTransaction({ value: 1, from: user1 }).should.be.rejectedWith(EVM_REVERT)
    })
  })

  describe('depositing Ether', () => {
    let result
    let amount

    beforeEach(async () => {
      amount = ether(1)
      result = await exchange.depositEther({ from: user1, value: amount})
    })

    it('tracks the Ether deposit', async () => {
      const balance = await exchange.tokens(ETHER_ADDRESS, user1)
      balance.toString().should.equal(amount.toString())
    })

    it('emits a Deposit event', async () => {
      const log = result.logs[0]
      log.event.should.eq('Deposit')
      const event = log.args
      event.token.should.equal(ETHER_ADDRESS, 'token address is correct')
      event.user.should.equal(user1, 'user address is correct')
      event.amount.toString().should.equal(amount.toString(), 'amount is correct')
      event.balance.toString().should.equal(amount.toString(), 'balance is correct')
    })
  })


  describe('withdrawing Ether', () => {
    let result
    let amount

    beforeEach(async () => {
      
      amount = ether(1)
      await exchange.depositEther({ from: user1, value: amount })
    })

    describe('success', async () => {
      beforeEach(async () => {
        
        result = await exchange.withdrawEther(amount, { from: user1 })
      })

      it('withdraws Ether funds', async () => {
        const balance = await exchange.tokens(ETHER_ADDRESS, user1)
        balance.toString().should.equal('0')
      })

      it('emits a "Withdraw" event', async () => {
        const log = result.logs[0]
        log.event.should.eq('Withdraw')
        const event = log.args
        event.token.should.equal(ETHER_ADDRESS)
        event.user.should.equal(user1)
        event.amount.toString().should.equal(amount.toString())
        event.balance.toString().should.equal('0')
      })

    })

    describe('failure', async () => {
      it('rejects withdraws for insufficient balances', async () => {
        await exchange.withdrawEther(ether(100), { from: user1 }).should.be.rejectedWith(EVM_REVERT)
      })
    })
  })

  describe('depositing tokens', () => {
    let result
    let amount

    describe('success', () => {
      beforeEach(async () => {
        amount = tokens(10)
        await token.approve(exchange.address, amount, { from: user1 })
        result = await exchange.depositToken(token.address, amount, { from: user1 })
      })

      it('tracks the token deposit', async () => {
        
        let balance
        balance = await token.balanceOf(exchange.address)
        balance.toString().should.equal(amount.toString())
        
        balance = await exchange.tokens(token.address, user1)
        balance.toString().should.equal(amount.toString())
      })

      it('emits a Deposit event', async () => {
        const log = result.logs[0]
        log.event.should.eq('Deposit')
        const event = log.args
        event.token.should.equal(token.address, 'token address is correct')
        event.user.should.equal(user1, 'user address is correct')
        event.amount.toString().should.equal(amount.toString(), 'amount is correct')
        event.balance.toString().should.equal(amount.toString(), 'balance is correct')
      })
    })

    describe('failure', () => {
      it('rejects Ether deposits', async() => {
        await exchange.depositToken(ETHER_ADDRESS, tokens(10), { from: user1 }).should.be.rejectedWith(EVM_REVERT)
      })

      it('fails when no tokens are approved', async () => {
        
        await exchange.depositToken(token.address, tokens(10), { from: user1 }).should.be.rejectedWith(EVM_REVERT)
      })
    })
  })

  describe('withdrawing tokens', () => {
    let result
    let amount

    describe('success', async () => {
      beforeEach(async () => {
        
        amount = tokens(10)
        await token.approve(exchange.address, amount, { from: user1 })
        await exchange.depositToken(token.address, amount, { from: user1 })

        
        result = await exchange.withdrawToken(token.address, amount, { from: user1 })
      })

      it('withdraws token funds', async () => {
        const balance = await exchange.tokens(token.address, user1)
        balance.toString().should.equal('0')
      })

      it('emits a "Withdraw" event', async () => {
        const log = result.logs[0]
        log.event.should.eq('Withdraw')
        const event = log.args
        event.token.should.equal(token.address)
        event.user.should.equal(user1)
        event.amount.toString().should.equal(amount.toString())
        event.balance.toString().should.equal('0')
      })
    })

    describe('failure', async () => {
      it('rejects Ether withdraws', async () => {
        await exchange.withdrawToken(ETHER_ADDRESS, tokens(10), { from: user1 }).should.be.rejectedWith(EVM_REVERT)
      })

      it('fails for insufficient balances', async () => {
        
        await exchange.withdrawToken(token.address, tokens(10), { from: user1 }).should.be.rejectedWith(EVM_REVERT)
      })
    })
  })
          
  describe('checking balances', () => {                 
    beforeEach(async () => {
      exchange.depositEther({ from: user1, value: ether(1) })
    })

    it('returns user balance', async () => {
      const result = await exchange.balanceOf(ETHER_ADDRESS, user1)
      result.toString().should.equal(ether(1).toString())
    })
  })

  describe('making orders', () => {
    let result

    beforeEach(async ()=> {
      result = await exchange.makeOrder(token.address, tokens(1), ETHER_ADDRESS, ether(1), { from: user1 })
    })

    it('tracks the newly created order', async () => {
      const orderCount = await exchange.orderCount()
      orderCount.toString().should.equal('1')
    })
  })
})
