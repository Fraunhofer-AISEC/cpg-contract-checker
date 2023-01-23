pragma solidity ^0.6.0;

contract MyContract {
    
    int [] private PV1 = [ 0,0,0,0,0,0,704000,1280000,2560000,3840000,5504000,6400000,6400000,6400000,5312000,3584000,2048000,1472000,0,0,0,0,0,0 ];
    int [] private WT1 = [ 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ];
    int [] private load1 = [ 4333300,4464600,4727200,4727200,4924200,4924200,5055500,5121100,5449400,5843300,5777700,5777700,5777700,5646400,5515100,5646400,6106000,6368600,6565600,6237300,6106000,5580700,4727200,4858500 ];
    int [] private PV2 = [ 0,0,0,0,0,0,616000,1120000,2240000,3360000,4816000,5600000,5600000,5600000,4648000,3136000,1792000,1288000,0,0,0,0,0,0 ];
    int [] private WT2 = [ 0,0,0,0,234000,234000,260000,260000,351000,351000,299000,299000,247000,247000,273000,273000,364000,364000,442000,442000,312000,312000,0,0 ];
    int [] private load2 = [ 3223100,3320800,3516100,3516100,3662700,3662700,3760300,3809200,4053300,4346400,4297500,4297500,4297500,4199800,4102200,4199800,4541700,4737000,4883500,4639400,4541700,4151000,3516100,3613800 ];
    int [] private PV3 = [ 0,0,0,0,0,0,616000,1120000,2240000,3360000,4816000,5600000,5600000,5600000,4648000,3136000,1792000,1288000,0,0,0,0,0,0 ];
    int [] private WT3 = [ 0,0,0,0,306000,306000,340000,340000,459000,459000,391000,391000,323000,323000,357000,357000,476000,476000,578000,578000,408000,408000,0,0 ];
    int [] private load3 = [ 3525900,3632800,3846500,3846500,4006800,4006800,4113600,4167000,4434100,4754700,4701300,4701300,4701300,4594400,4487600,4594400,4968400,5182100,5342300,5075200,4968400,4541000,3846500,3953300 ];
    int [] private PV4 = [ 0,0,0,0,0,0,616000,1120000,2240000,3360000,4816000,5600000,5600000,5600000,4648000,3136000,1792000,1288000,0,0,0,0,0,0 ];
    int [] private WT4 = [ 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ];
    int [] private load4 = [ 2513800,2590000,2742300,2742300,2856600,2856600,2932800,2970900,3161300,3389800,3351700,3351700,3351700,3275600,3199400,3275600,3542200,3694500,3808800,3618300,3542200,3237500,2742300,2818500 ];
    int [] public delta1;
    int [] public delta2;
    int [] public delta3;
    int [] public delta4;
    
    int [] private BessCap = [ 10000,12000,12400,12000 ];  
    int [] private BessLim = [ 6400,5600,5600,5600 ];      
    int [] private charEff_num = [ 95,95,95,95 ];          
    int [] private discharEff_num = [ 92,92,92,92 ];        
    int private bp1;
    int private bp2;
    int private bp3;
    int private bp4;
    int [] private int_BESSp=[2000, 2400, 2480, 2400]; 
    int [] public Batt_power1=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
    int [] public Batt_power2=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
    int [] public Batt_power3=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
    int [] public Batt_power4=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];

    function abs(int x) private pure returns (int) {
    return x >= 0 ? x : -x;
    }   
    function getDelta() public{
        for (uint i=0; i<24; i++){
            delta1.push(PV1[i]+WT1[i]-load1[i]);
            delta2.push(PV2[i]+WT2[i]-load2[i]);
            delta3.push(PV3[i]+WT3[i]-load3[i]);
            delta4.push(PV4[i]+WT4[i]-load4[i]);
        }
    }

    function getBESS() public {
        for (uint h=1; h<=24; h++){

            if  (h==1){
                if (delta1[h]>=0){
                    bp1=charEff_num[1]*delta1[h]/100;
                    if (bp1>BessLim[1]){
                        bp1=BessLim[1];
                    }
                }
                else {
                    bp1=0;
                }
                if (delta2[h]>=0){
                    bp2=charEff_num[2]*delta2[h]/100;
                    if (bp2>BessLim[2]){
                        bp2=BessLim[2];
                    }
                }
                else {
                    bp2=0;
                }
                if (delta3[h]>=0){
                    bp3=charEff_num[3]*delta3[h]/100;
                    if (bp3>BessLim[3]){
                        bp3=BessLim[3];
                    }
                }
                else {
                    bp3=0;
                }
                if (delta4[h]>=0){
                    bp4=charEff_num[4]*delta4[h]/100;
                    if (bp4>BessLim[4]){
                        bp1=BessLim[4];
                    }
                }
                else {
                    bp1=0;
                }

            Batt_power1[h]=int_BESSp[1]+bp1;
            Batt_power2[h]=int_BESSp[2]+bp2;
            Batt_power3[h]=int_BESSp[3]+bp3;
            Batt_power4[h]=int_BESSp[4]+bp4;

            }
            else{
                if (delta1[h]>0){
                    bp1=charEff_num[1]*delta1[h]/100;
                    if (bp1>BessLim[1]){
                        bp1=BessLim[1];
                    }
                    Batt_power1[h]=Batt_power1[h-1]+bp1;
                }
                else {
                    bp1=delta1[h]*100/discharEff_num[1];
                    if(abs(bp1)>BessLim[1]){
                        bp1=-1*BessLim[1];
                    }
                    Batt_power1[h]=Batt_power1[h-1]+bp1;
                }
                if (delta2[h]>0){
                    bp2=charEff_num[2]*delta2[h]/100;
                    if (bp2>BessLim[2]){
                        bp2=BessLim[2];
                    }
                    Batt_power2[h]=Batt_power2[h-1]+bp2;
                }
                else {
                    bp2=delta2[h]*100/discharEff_num[2];
                    if(abs(bp2)>BessLim[2]){
                        bp2=-1*BessLim[2];
                    }
                    Batt_power2[h]=Batt_power2[h-1]+bp2;
                }
                if (delta3[h]>0){
                    bp3=charEff_num[3]*delta3[h]/100;
                    if (bp3>BessLim[3]){
                        bp3=BessLim[3];
                    }
                    Batt_power3[h]=Batt_power3[h-1]+bp3;
                }
                else {
                    bp3=delta3[h]*100/discharEff_num[3];
                    if(abs(bp3)>BessLim[3]){
                        bp3=-1*BessLim[3];
                    }
                    Batt_power3[h]=Batt_power3[h-1]+bp3;
                }
                if (delta4[h]>0){
                    bp4=charEff_num[4]*delta4[h]/100;
                    if (bp4>BessLim[4]){
                        bp4=BessLim[4];
                    }
                    Batt_power4[h]=Batt_power4[h-1]+bp4;
                }
                else {
                    bp4=delta4[h]*100/discharEff_num[4];
                    if(abs(bp4)>BessLim[4]){
                        bp4=-4*BessLim[4];
                    }
                    Batt_power1[h]=Batt_power1[h-1]+bp1;
                }
                
                
            }
            if (Batt_power1[h]>BessCap[1]){
                bp1=bp1-BessCap[1]+Batt_power1[h];
                Batt_power1[h]=int_BESSp[1];
            }  
            if (Batt_power2[h]>BessCap[2]){
                bp2=bp2-BessCap[2]+Batt_power2[h];
                Batt_power2[h]=int_BESSp[2];
            }
            if (Batt_power3[h]>BessCap[3]){
                bp3=bp3-BessCap[3]+Batt_power3[h];
                Batt_power3[h]=int_BESSp[3];
            }   
            if (Batt_power4[h]>BessCap[4]){
                bp4=bp4-BessCap[4]+Batt_power1[4];
                Batt_power4[h]=int_BESSp[4];
            }            
            
        }
    }
}
