it('Should succeed and emit \'MemberRemoved\' events if admin removes a member', async function () {
      const receipt = await (await leagues.connect(admin1).removeMembers([member2.address])).wait();
      const event = receipt!.events!.find((e: any) => e.event === 'MemberRemoved');
      const user = event!.args!.user; 
      const leagueId = event!.args!.leagueId;
      expect(user).to.be.eq(member2.address);
      expect(leagueId1).to.be.eq(leagueId);
 });
