function rebase() public {
    if( epoch.endBlock <= block.number ) {

        IsCTX( sCTX ).rebase( epoch.distribute, epoch.number );

        epoch.endBlock = epoch.endBlock.add( epoch.length );
        epoch.number++;
        
        if ( distributor != address(0) ) {
            IDistributor( distributor ).distribute();
        }

        uint balance = contractBalance();
        uint staked = IsCTX( sCTX ).circulatingSupply();

         if( balance <= staked ) {
             epoch.distribute = 0;
         } else {
            epoch.distribute = balance.sub( staked );
         }
    }
}
