`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:45:41 11/14/2017 
// Design Name: 
// Module Name:    obstacle 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module obstacle(
    input clk,
	 input inc,
	 input reset,
	 input [39:0] head,
	 output reg stop,
	 output reg [3999:0] obstacles
    );
	 
	 
	 
	 integer WIDTH    =  16; 
    integer HIEGHT   =  16; 
    integer X_LEFT   = 304; 
    integer Y_BOTTOM = 224;
	 
	 reg [3999:0] temp;
	 parameter [6:0] 
	 
	 L0= 7'b0000000, L1=7'b0000001,L2= 7'b0000010,L3= 7'b0000011,L4= 7'b0000100, L5=7'b0000101,L6= 7'b0000110, L7=7'b0000111,
	 L8= 7'b0001000, L9=7'b0001001,L10=7'b0001010;
	 
	 reg [6:0] CS,NS;
	 integer index;
	 integer counter = 40;
	 
	 always @(posedge clk or posedge reset) begin
	     if(head[39:0] ==  temp[3999:3960]) begin
		      stop = 1'b1;
		  end
		  temp = temp << counter;
		  counter = counter + 40;
	     if(reset == 1'b1) begin
		      CS <= L0;
		  end
		  else begin
		      CS <= NS;
		  end
	 end
	 
	 //10 states for 10 levels
	 always @(CS) begin
	     temp = obstacles;
	     case (CS)
		      L0: begin
				    if(inc == 1'b1) begin
					     NS = L1;
				    end
				end
				L1: begin
				    obstacles [3999:3990] = 16;
					 obstacles [3989:3980] = 16;
					 obstacles [3979:3970] = 16;
					 obstacles [3969:3960] = 32;
					 
					 obstacles [3959:3950] = 16;
					 obstacles [3949:3940] = 16;
					 obstacles [3939:3930] = 32;
					 obstacles [3929:3920] = 32;
					 
					 obstacles [3919:3900] = 16;
					 obstacles [3909:3900] = 16;
					 obstacles [3899:3890] = 48;
					 obstacles [3889:3880] = 32;
					 
					 obstacles [3879:3870] = 16;
					 obstacles [3869:3860] = 16;
					 obstacles [3859:3850] = 64;
					 obstacles [3849:3840] = 32;
					 
					 obstacles [3839:3830] = 16;
					 obstacles [3829:3820] = 16;
					 obstacles [3819:3810] = 80;
					 obstacles [3809:3800] = 32;
					 
					 obstacles [3799:3790] = 16;
					 obstacles [3789:3780] = 16;
					 obstacles [3779:3770] = 96;
					 obstacles [3769:3760] = 32;
					 
					 obstacles [3759:3750] = 16;
					 obstacles [3749:3740] = 16;
					 obstacles [3739:3730] = 112;
					 obstacles [3729:3720] = 32;
					 
					 obstacles [3719:3710] = 16;
					 obstacles [3709:3700] = 16;
					 obstacles [3699:3690] = 128;
					 obstacles [3689:3680] = 32;
					 
					 obstacles [3679:3670] = 16;
					 obstacles [3669:3660] = 16;
					 obstacles [3659:3650] = 144;
					 obstacles [3649:3640] = 32;
					 
					 obstacles [3639:3630] = 16;
					 obstacles [3629:3620] = 16;
					 obstacles [3619:3610] = 160;
					 obstacles [3609:3600] = 32;
				    if(inc == 1'b1) begin
					     NS = L2;
				    end
				end
				L2: begin
				    obstacles [3599:3590] = 16;
					 obstacles [3589:3580] = 16;
					 obstacles [3579:3570] = 16;
					 obstacles [3569:3560] = 48;
					 
					 obstacles [3559:3550] = 16;
					 obstacles [3549:3540] = 16;
					 obstacles [3539:3530] = 32;
					 obstacles [3529:3520] = 48;
					 
					 obstacles [3519:3510] = 16;
					 obstacles [3509:3500] = 16;
					 obstacles [3499:3490] = 48;
					 obstacles [3489:3480] = 48;
					 
					 obstacles [3479:3470] = 16;
					 obstacles [3469:3460] = 16;
					 obstacles [3459:3450] = 64;
					 obstacles [3449:3440] = 48;
					 
					 obstacles [3439:3430] = 16;
					 obstacles [3429:3420] = 16;
					 obstacles [3419:3410] = 80;
					 obstacles [3409:3400] = 48;
					 
					 obstacles [3399:3390] = 16;
					 obstacles [3389:3380] = 16;
					 obstacles [3379:3370] = 96;
					 obstacles [3369:3360] = 48;
					 
					 obstacles [3359:3350] = 16;
					 obstacles [3349:3340] = 16;
					 obstacles [3339:3330] = 112;
					 obstacles [3329:3320] = 48;
					 
					 obstacles [3319:3310] = 16;
					 obstacles [3309:3300] = 16;
					 obstacles [3299:3290] = 128;
					 obstacles [3289:3280] = 48;
					 
					 obstacles [3279:3270] = 16;
					 obstacles [3269:3260] = 16;
					 obstacles [3259:3250] = 144;
					 obstacles [3249:3240] = 48;
					 
					 obstacles [3239:3230] = 16;
					 obstacles [3229:3220] = 16;
					 obstacles [3219:3210] = 160;
					 obstacles [3209:3200] = 48;
				    if(inc == 1'b1) begin
					     NS = L3;
				    end
				end
				L3: begin
				    obstacles [3199:3190] = 16;
					 obstacles [3189:3180] = 16;
					 obstacles [3179:3170] = 16;
					 obstacles [3169:3160] = 64;
					 
					 obstacles [3159:3150] = 16;
					 obstacles [3149:3140] = 16;
					 obstacles [3139:3130] = 32;
					 obstacles [3129:3120] = 64;
					 
					 obstacles [3119:3110] = 16;
					 obstacles [3109:3100] = 16;
					 obstacles [3099:3090] = 48;
					 obstacles [3089:3080] = 64;
					 
					 obstacles [3079:3070] = 16;
					 obstacles [3069:3060] = 16;
					 obstacles [3059:3050] = 64;
					 obstacles [3049:3040] = 64;
					 
					 obstacles [3039:3030] = 16;
					 obstacles [3029:3020] = 16;
					 obstacles [3019:3010] = 80;
					 obstacles [3009:3000] = 64;
					 
					 obstacles [2999:2990] = 16;
					 obstacles [2989:2980] = 16;
					 obstacles [2979:2970] = 96;
					 obstacles [2969:2960] = 64;
					 
					 obstacles [2959:2950] = 16;
					 obstacles [2949:2940] = 16;
					 obstacles [2939:2930] = 112;
					 obstacles [2929:2920] = 64;
					 
					 obstacles [2919:2910] = 16;
					 obstacles [2909:2900] = 16;
					 obstacles [2899:2890] = 128;
					 obstacles [2889:2880] = 64;
					 
					 obstacles [2879:2870] = 16;
					 obstacles [2869:2860] = 16;
					 obstacles [2859:2850] = 144;
					 obstacles [2849:2840] = 64;
					 
					 obstacles [2839:2830] = 16;
					 obstacles [2829:2820] = 16;
					 obstacles [2819:2810] = 160;
					 obstacles [2809:2800] = 64;
				    if(inc == 1'b1) begin
					     NS = L4;
				    end
				end
				L4: begin
				    obstacles [2799:2790] = 16;
					 obstacles [2789:2780] = 16;
					 obstacles [2779:2770] = 16;
					 obstacles [2769:2760] = 80;
					 
					 obstacles [2759:2750] = 16;
					 obstacles [2749:2740] = 16;
					 obstacles [2739:2730] = 32;
					 obstacles [2729:2720] = 80;
					 
					 obstacles [2719:2710] = 16;
					 obstacles [2709:2700] = 16;
					 obstacles [2699:2690] = 48;
					 obstacles [2689:2680] = 80;
					 
					 obstacles [2679:2670] = 16;
					 obstacles [2669:2660] = 16;
					 obstacles [2659:2650] = 64;
					 obstacles [2649:2640] = 80;
					 
					 obstacles [2639:2630] = 16;
					 obstacles [2629:2620] = 16;
					 obstacles [2619:2610] = 80;
					 obstacles [2609:2600] = 80;
					 
					 obstacles [2599:2590] = 16;
					 obstacles [2589:2580] = 16;
					 obstacles [2579:2570] = 96;
					 obstacles [2569:2560] = 80;
					 
					 obstacles [2559:2550] = 16;
					 obstacles [2549:2540] = 16;
					 obstacles [2539:2530] = 112;
					 obstacles [2529:2520] = 80;
					 
					 obstacles [2519:2510] = 16;
					 obstacles [2509:2500] = 16;
					 obstacles [2499:2490] = 128;
					 obstacles [2489:2480] = 80;
					 
					 obstacles [2479:2470] = 16;
					 obstacles [2469:2460] = 16;
					 obstacles [2459:2450] = 144;
					 obstacles [2449:2440] = 80;
					 
					 obstacles [2439:2430] = 16;
					 obstacles [2429:2420] = 16;
					 obstacles [2419:2410] = 160;
					 obstacles [2409:2400] = 80;
				    if(inc == 1'b1) begin
					     NS = L5;
				    end
				end
				L5: begin
				    obstacles [2399:2390] = 16;
					 obstacles [2389:2380] = 16;
					 obstacles [2379:2370] = 16;
					 obstacles [2369:2360] = 96;
					 
					 obstacles [2359:2350] = 16;
					 obstacles [2349:2340] = 16;
					 obstacles [2339:2330] = 32;
					 obstacles [2329:2320] = 96;
					 
					 obstacles [2319:2310] = 16;
					 obstacles [2309:2300] = 16;
					 obstacles [2299:2290] = 48;
					 obstacles [2289:2280] = 96;
					 
					 obstacles [2279:2270] = 16;
					 obstacles [2269:2260] = 16;
					 obstacles [2259:2250] = 64;
					 obstacles [2249:2240] = 96;
					 
					 obstacles [2239:2230] = 16;
					 obstacles [2229:2220] = 16;
					 obstacles [2219:2210] = 80;
					 obstacles [2209:2200] = 96;
					 
					 obstacles [2199:2190] = 16;
					 obstacles [2189:2180] = 16;
					 obstacles [2179:2170] = 96;
					 obstacles [2169:2160] = 96;
					 
					 obstacles [2159:2150] = 16;
					 obstacles [2149:2140] = 16;
					 obstacles [2139:2130] = 112;
					 obstacles [2129:2120] = 96;
					 
					 obstacles [2119:2110] = 16;
					 obstacles [2109:2100] = 16;
					 obstacles [2099:2090] = 128;
					 obstacles [2089:2080] = 96;
					 
					 obstacles [2079:2070] = 16;
					 obstacles [2069:2060] = 16;
					 obstacles [2059:2050] = 144;
					 obstacles [2049:2040] = 96;
					 
					 obstacles [2049:40] = 16;
					 obstacles [2029:20] = 16;
					 obstacles [2019:2010] = 160;
					 obstacles [2009:2000] = 96;
				    if(inc == 1'b1) begin
					     NS = L6;
				    end
				end
				L6: begin
				    obstacles [1999:1990] = 16;
					 obstacles [1989:1980] = 16;
					 obstacles [1979:1970] = 16;
					 obstacles [1969:1960] = 112;
					 
					 obstacles [1959:1950] = 16;
					 obstacles [1949:1940] = 16;
					 obstacles [1939:1930] = 32;
					 obstacles [1929:1920] = 112;
					 
					 obstacles [1919:1900] = 16;
					 obstacles [1909:1900] = 16;
					 obstacles [1899:1890] = 48;
					 obstacles [1889:1880] = 112;
					 
					 obstacles [1879:1870] = 16;
					 obstacles [1869:1860] = 16;
					 obstacles [1859:1850] = 64;
					 obstacles [1849:1840] = 112;
					 
					 obstacles [1839:1830] = 16;
					 obstacles [1829:1820] = 16;
					 obstacles [1819:1810] = 80;
					 obstacles [1809:1800] = 112;
					 
					 obstacles [1799:1790] = 16;
					 obstacles [1789:1780] = 16;
					 obstacles [1779:1770] = 96;
					 obstacles [1769:1760] = 112;
					 
					 obstacles [1759:1750] = 16;
					 obstacles [1749:1740] = 16;
					 obstacles [1739:1730] = 112;
					 obstacles [1729:1720] = 112;
					 
					 obstacles [1719:1710] = 16;
					 obstacles [1709:1700] = 16;
					 obstacles [1699:1690] = 128;
					 obstacles [1689:1680] = 112;
					 
					 obstacles [1679:1670] = 16;
					 obstacles [1669:1660] = 16;
					 obstacles [1659:1650] = 144;
					 obstacles [1649:1640] = 112;
					 
					 obstacles [1639:1630] = 16;
					 obstacles [1629:1620] = 16;
					 obstacles [1619:1610] = 160;
					 obstacles [1609:1600] = 112;
				    if(inc == 1'b1) begin
					     NS = L7;
				    end
				end
				L7: begin
				    obstacles [1599:1590] = 16;
					 obstacles [1589:1580] = 16;
					 obstacles [1579:1570] = 16;
					 obstacles [1569:1560] = 128;
					 
					 obstacles [1559:1550] = 16;
					 obstacles [1549:1540] = 16;
					 obstacles [1539:1530] = 32;
					 obstacles [1529:1520] = 128;
					 
					 obstacles [1519:1510] = 16;
					 obstacles [1509:1500] = 16;
					 obstacles [1499:1490] = 48;
					 obstacles [1489:1480] = 128;
					 
					 obstacles [1479:1470] = 16;
					 obstacles [1469:1460] = 16;
					 obstacles [1459:1450] = 64;
					 obstacles [1449:1440] = 128;
					 
					 obstacles [1439:1430] = 16;
					 obstacles [1429:1420] = 16;
					 obstacles [1419:1410] = 80;
					 obstacles [1409:1400] = 128;
					 
					 obstacles [1399:1390] = 16;
					 obstacles [1389:1380] = 16;
					 obstacles [1379:1370] = 96;
					 obstacles [1369:1360] = 128;
					 
					 obstacles [1359:1350] = 16;
					 obstacles [1349:1340] = 16;
					 obstacles [1339:1330] = 112;
					 obstacles [1329:1320] = 128;
					 
					 obstacles [1319:1310] = 16;
					 obstacles [1309:1300] = 16;
					 obstacles [1299:1290] = 128;
					 obstacles [1289:1280] = 128;
					 
					 obstacles [1279:1270] = 16;
					 obstacles [1269:1260] = 16;
					 obstacles [1259:1250] = 144;
					 obstacles [1249:1240] = 128;
					 
					 obstacles [1239:1230] = 16;
					 obstacles [1229:1220] = 16;
					 obstacles [1219:1210] = 160;
					 obstacles [1209:1200] = 128;
				    if(inc == 1'b1) begin
					     NS = L8;
				    end
				end
				L8: begin
				    obstacles [1199:1190] = 16;
					 obstacles [1189:1180] = 16;
					 obstacles [1179:1170] = 16;
					 obstacles [1169:1160] = 144;
					 
					 obstacles [1159:1150] = 16;
					 obstacles [1149:1140] = 16;
					 obstacles [1139:1130] = 32;
					 obstacles [1129:1120] = 144;
					 
					 obstacles [1119:1110] = 16;
					 obstacles [1109:1100] = 16;
					 obstacles [1099:1090] = 48;
					 obstacles [1089:1080] = 144;
					 
					 obstacles [1079:1070] = 16;
					 obstacles [1069:1060] = 16;
					 obstacles [1059:1050] = 64;
					 obstacles [1049:1040] = 144;
					 
					 obstacles [1039:1030] = 16;
					 obstacles [1029:1020] = 16;
					 obstacles [1019:1010] = 80;
					 obstacles [1009:1000] = 144;
					 
					 obstacles [999:990] = 16;
					 obstacles [989:980] = 16;
					 obstacles [979:970] = 96;
					 obstacles [969:960] = 144;
					 
					 obstacles [959:950] = 16;
					 obstacles [949:940] = 16;
					 obstacles [939:930] = 112;
					 obstacles [929:920] = 144;
					 
					 obstacles [919:910] = 16;
					 obstacles [909:900] = 16;
					 obstacles [899:890] = 128;
					 obstacles [889:880] = 144;
					 
					 obstacles [879:870] = 16;
					 obstacles [869:860] = 16;
					 obstacles [859:850] = 144;
					 obstacles [849:840] = 144;
					 
					 obstacles [839:830] = 16;
					 obstacles [829:820] = 16;
					 obstacles [819:810] = 160;
					 obstacles [809:800] = 144;
				    if(inc == 1'b1) begin
					     NS = L9;
				    end
				end
				L9: begin
				    obstacles [799:790] = 16;
					 obstacles [789:780] = 16;
					 obstacles [779:770] = 16;
					 obstacles [769:760] = 160;
					 
					 obstacles [759:750] = 16;
					 obstacles [749:740] = 16;
					 obstacles [739:730] = 32;
					 obstacles [729:720] = 160;
					 
					 obstacles [719:710] = 16;
					 obstacles [709:700] = 16;
					 obstacles [699:690] = 48;
					 obstacles [689:680] = 160;
					 
					 obstacles [679:670] = 16;
					 obstacles [669:660] = 16;
					 obstacles [659:650] = 64;
					 obstacles [649:640] = 160;
					 
					 obstacles [639:630] = 16;
					 obstacles [629:620] = 16;
					 obstacles [619:610] = 80;
					 obstacles [609:600] = 160;
					 
					 obstacles [599:590] = 16;
					 obstacles [589:580] = 16;
					 obstacles [579:570] = 96;
					 obstacles [569:560] = 160;
					 
					 obstacles [559:550] = 16;
					 obstacles [549:540] = 16;
					 obstacles [539:530] = 112;
					 obstacles [529:520] = 160;
					 
					 obstacles [519:510] = 16;
					 obstacles [509:500] = 16;
					 obstacles [499:490] = 128;
					 obstacles [489:480] = 160;
					 
					 obstacles [479:470] = 16;
					 obstacles [469:460] = 16;
					 obstacles [459:450] = 144;
					 obstacles [449:440] = 160;
					 
					 obstacles [439:430] = 16;
					 obstacles [429:420] = 16;
					 obstacles [419:410] = 160;
					 obstacles [409:400] = 160;
				    if(inc == 1'b1) begin
					     NS = L10;
				    end
				end
				L10: begin
				    obstacles [399:390] = 16;
					 obstacles [389:380] = 16;
					 obstacles [379:370] = 16;
					 obstacles [369:360] = 176;
					 
					 obstacles [359:350] = 16;
					 obstacles [349:340] = 16;
					 obstacles [339:330] = 32;
					 obstacles [329:320] = 176;
					 
					 obstacles [319:310] = 16;
					 obstacles [309:300] = 16;
					 obstacles [299:290] = 48;
					 obstacles [289:280] = 176;
					 
					 obstacles [279:270] = 16;
					 obstacles [269:260] = 16;
					 obstacles [259:250] = 64;
					 obstacles [249:240] = 176;
					 
					 obstacles [239:230] = 16;
					 obstacles [229:220] = 16;
					 obstacles [219:210] = 80;
					 obstacles [209:200] = 176;
					 
					 obstacles [199:190] = 16;
					 obstacles [189:180] = 16;
					 obstacles [179:170] = 96;
					 obstacles [169:160] = 176;
					 
					 obstacles [159:150] = 16;
					 obstacles [149:140] = 16;
					 obstacles [139:130] = 112;
					 obstacles [129:120] = 176;
					 
					 obstacles [119:110] = 16;
					 obstacles [109:100] = 16;
					 obstacles [99:90] = 128;
					 obstacles [89:80] = 176;
					 
					 obstacles [79:70] = 16;
					 obstacles [69:60] = 16;
					 obstacles [59:50] = 144;
					 obstacles [49:40] = 176;
					 
					 obstacles [49:40] = 16;
					 obstacles [29:20] = 16;
					 obstacles [19:10] = 160;
					 obstacles [9:0] = 176;
				end
		  endcase
	 end


endmodule
