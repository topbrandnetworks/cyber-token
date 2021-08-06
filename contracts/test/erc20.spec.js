let token

const ERC20 = artifacts.require('ERC20')

contract('ERC20', accounts => {
    const __name = 'TecHouse'
    const __symbol = 'TECH'
    const __decimals = 18
    const __totalSupply = 1000

    beforeEach(async () => {
        token = await ERC20.new(__name, __symbol, __decimals, __totalSupply, {from: accounts[0]})
    })

    it('creation: test correct setting of vanity information', async () => {
        const name = await token.name()
        const symbol = await token.symbol()
        const decimals = await token.decimals()
        const totalSupply = await token.totalSupply()

        assert.strictEqual(name, __name)
        assert.strictEqual(symbol, __symbol)
        assert.strictEqual(decimals.toNumber(), __decimals)
        assert.strictEqual(totalSupply.toNumber(), __totalSupply)
    })

    it('creation: should create an initial balance of 1000 for the creator', async () => {
        const balance = await token.balanceOf(accounts[0])
        assert.strictEqual(balance.toNumber(), __totalSupply)
    })

    it('creation: should succeed in creating over 2^256 -1 (maximum) tokens', async () => {
        const max = '115792089237316195423570985008687907853269984665640564039457584007913129639935'
        const token = await ERC20.new(__name, __symbol, __decimals, max, {from: accounts[0]})
        const totalSupply = await token.totalSupply()
        assert.strictEqual(totalSupply.toString(), max)
    })

    it('transfers: should transfer 1000 to accounts[1] with accounts[0] having 1000', async () => {
        await token.transfer(accounts[1], 1000, {from: accounts[0]})
        const balance = await token.balanceOf(accounts[1])
        assert.strictEqual(balance.toNumber(), 1000)
    })

    it('transfers: should fail when trying to transfer 1001 to accounts[1] with accounts[0] having 1000', async () => {
        let threw = false
        try {
            await token.transfer(accounts[1], 1001, {from: accounts[0]})
        } catch (e) {
            threw = true
        }

        assert.equal(threw, true)
    })

    it('transfers: should handle zero-transfers normally', async () => {
        assert(await token.transfer(accounts[1], 0, {from: accounts[0]}), 'zero-transfer has failed')
    })
})
