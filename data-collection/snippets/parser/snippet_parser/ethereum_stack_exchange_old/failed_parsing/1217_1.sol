from ethereum import tester as t
def test_make_reports():
    global initial_gas
    initial_gas = 0
    t.gas_limit = 100000000
    s = t.state()
    c = s.abi_contract('functions/output.se')
    gas_use(s)
    c.initiateOwner(1010101)
    c.reputationFaucet(1010101)
    assert(c.submitReportHash(1010101, 3232, -1, 222, 0)==-2), "Nonexistant event check broken"
    event1 = c.createEvent(1010101, "new event", 5, 1, 2, 2)
    bin_market = c.createMarket(1010101, "new market", 2**58, 100*2**64, 184467440737095516, [event1], 1)
    s.mine(105)
    gas_use(s)
    c.incrementPeriod(1010101)
    report_hash = c.makeHash(0, 2**64, event1)
    gas_use(s)
    print c.submitReportHash(1010101, report_hash, 0, event1, 0)
    assert(c.submitReportHash(1010101, report_hash, 0, event1, 0)==1), "Report hash submission failed"
    gas_use(s)
    s.mine(55)
    gas_use(s)
    assert(c.submitReport(1010101, 0, 0, 0, 2**64, event1, 2**64)==1), "Report submission failed"
    gas_use(s)
    print c.getUncaughtOutcome(event1)
    gas_use(s)
    print "Test make reports OK"
