claimStarFunc: async function(){
    const { claimStar } = this.meta.methods;
    await claimStar().send({from:this.account});
    App.setStatus("New Star Owner is " + this.account + ".");
  }
