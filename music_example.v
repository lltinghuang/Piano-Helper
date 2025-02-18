`define silence   32'd50000000
`define c2  32'd66   // C2
`define f2  32'd88   // F2
`define g2  32'd98   // G2
`define a2  32'd110  // A2
`define b2  32'd124   // B2

`define c4  32'd262   // C4
`define d4  32'd294   // D4
`define e4  32'd330   // E4
`define f4  32'd350   // F4
`define g4  32'd392   // G4
`define a4  32'd440   // A4
`define b4  32'd494   // B4

`define c3  `c4/2   
`define d3  `d4/2
`define e3  `e4/2
`define f3  `f4/2
`define g3  `g4/2
`define a3  `a4/2
`define b3  `b4/2

`define c5 `c4*2
`define d5 `d4*2
`define e5 `e4*2
`define f5 `f4*2
`define g5 `g4*2
`define a5 `a4*2
`define b5 `b4*2

module music_example (
	input [11:0] ibeatNum,
	input en,
    input game,
	output reg [31:0] toneL,
    output reg [31:0] toneR
);

    //toneR : melody part
    always @* begin
            if (en || game) begin
                case(ibeatNum)
                    // -1
                    12'd0: toneR  = `silence;    12'd1: toneR  = `silence;
                    12'd2: toneR  = `silence;    12'd3: toneR  = `silence;
                    12'd4: toneR  = `silence;    12'd5: toneR  = `silence;
                    12'd6: toneR  = `silence;    12'd7: toneR  = `silence;
                    12'd8: toneR  = `silence;    12'd9: toneR  = `silence;
                    12'd10: toneR = `silence;    12'd11: toneR = `silence;
                    12'd12: toneR = `silence;    12'd13: toneR = `silence;
                    12'd14: toneR = `silence;    12'd15: toneR = `silence;
                    
                    12'd16: toneR = `e4;    12'd17: toneR = `e4;
                    12'd18: toneR = `e4;    12'd19: toneR = `e4;
                    12'd20: toneR = `e4;    12'd21: toneR = `e4;
                    12'd22: toneR = `e4;    12'd23: toneR = `e4;
                    12'd24: toneR = `e4;    12'd25: toneR = `e4;
                    12'd26: toneR = `e4;    12'd27: toneR = `e4;
                    12'd28: toneR = `e4;    12'd29: toneR = `e4;
                    12'd30: toneR = `e4;    12'd31: toneR = `silence;
                    
                    12'd32: toneR = `e4;    12'd33: toneR = `e4;
                    12'd34: toneR = `e4;    12'd35: toneR = `e4;
                    12'd36: toneR = `e4;    12'd37: toneR = `e4;
                    12'd38: toneR = `e4;    12'd39: toneR = `e4;
                    12'd40: toneR = `e4;    12'd41: toneR = `e4;
                    12'd42: toneR = `e4;    12'd43: toneR = `e4;
                    12'd44: toneR = `e4;    12'd45: toneR = `e4;
                    12'd46: toneR = `e4;    12'd47: toneR = `silence;
                    
                    12'd48: toneR = `c4;    12'd49: toneR = `c4;
                    12'd50: toneR = `c4;    12'd51: toneR = `c4;
                    12'd52: toneR = `c4;    12'd53: toneR = `c4;
                    12'd54: toneR = `c4;    12'd55: toneR = `c4;
                    12'd56: toneR = `c4;    12'd57: toneR = `c4;
                    12'd58: toneR = `c4;    12'd59: toneR = `c4;
                    12'd60: toneR = `c4;    12'd61: toneR = `c4;
                    12'd62: toneR = `c4;    12'd63: toneR = `c4;
                    // -2
                    12'd64: toneR = `e4;    12'd65: toneR = `e4;
                    12'd66: toneR = `e4;    12'd67: toneR = `e4;
                    12'd68: toneR = `e4;    12'd69: toneR = `e4;
                    12'd70: toneR = `e4;    12'd71: toneR = `e4;
                    12'd72: toneR = `e4;    12'd73: toneR = `e4;
                    12'd74: toneR = `e4;    12'd75: toneR = `e4;
                    12'd76: toneR = `e4;    12'd77: toneR = `e4;
                    12'd78: toneR = `e4;    12'd79: toneR = `e4;
                    
                    12'd80: toneR = `a4;    12'd81: toneR = `a4;
                    12'd82: toneR = `a4;    12'd83: toneR = `a4;
                    12'd84: toneR = `a4;    12'd85: toneR = `a4;
                    12'd86: toneR = `a4;    12'd87: toneR = `a4;
                    12'd88: toneR = `a4;    12'd89: toneR = `a4;
                    12'd90: toneR = `a4;    12'd91: toneR = `a4;
                    12'd92: toneR = `a4;    12'd93: toneR = `a4;
                    12'd94: toneR = `a4;    12'd95: toneR = `a4;
                    
                    12'd96: toneR  = `g4;    12'd97: toneR  = `g4;
                    12'd98: toneR  = `g4;    12'd99: toneR  = `g4;
                    12'd100: toneR = `g4;    12'd101: toneR = `g4;
                    12'd102: toneR = `g4;    12'd103: toneR = `g4;
                    12'd104: toneR = `g4;    12'd105: toneR = `g4;
                    12'd106: toneR = `g4;    12'd107: toneR = `g4;
                    12'd108: toneR = `g4;    12'd109: toneR = `g4;
                    12'd110: toneR = `g4;    12'd111: toneR = `g4;
                    
                    12'd112: toneR = `g4;    12'd113: toneR = `g4;
                    12'd114: toneR = `g4;    12'd115: toneR = `g4;
                    12'd116: toneR = `g4;    12'd117: toneR = `g4;
                    12'd118: toneR = `g4;    12'd119: toneR = `g4;
                    12'd120: toneR = `g4;    12'd121: toneR = `g4;
                    12'd122: toneR = `g4;    12'd123: toneR = `g4;
                    12'd124: toneR = `g4;    12'd125: toneR = `g4;
                    12'd126: toneR = `g4;    12'd127: toneR = `g4;
                    // -3
                    12'd128: toneR = `silence;    12'd129: toneR = `silence;
                    12'd130: toneR = `silence;    12'd131: toneR = `silence;
                    12'd132: toneR = `silence;    12'd133: toneR = `silence;
                    12'd134: toneR = `silence;    12'd135: toneR = `silence;
                    12'd136: toneR = `f4;    12'd137: toneR = `f4;
                    12'd138: toneR = `f4;    12'd139: toneR = `f4;
                    12'd140: toneR = `f4;    12'd141: toneR = `f4;
                    12'd142: toneR = `f4;    12'd143: toneR = `f4;
                    
                    12'd144: toneR = `f4;    12'd145: toneR = `f4;
                    12'd146: toneR = `f4;    12'd147: toneR = `f4;
                    12'd148: toneR = `f4;    12'd149: toneR = `f4;
                    12'd150: toneR = `f4;    12'd151: toneR = `f4;
                    12'd152: toneR = `f4;    12'd153: toneR = `f4;
                    12'd154: toneR = `f4;    12'd155: toneR = `f4;
                    12'd156: toneR = `f4;    12'd157: toneR = `f4;
                    12'd158: toneR = `f4;    12'd159: toneR = `silence;
                    
                    12'd160: toneR = `f4;    12'd161: toneR = `f4;
                    12'd162: toneR = `f4;    12'd163: toneR = `f4;
                    12'd164: toneR = `f4;    12'd165: toneR = `f4;
                    12'd166: toneR = `f4;    12'd167: toneR = `f4;
                    12'd168: toneR = `f4;    12'd169: toneR = `f4;
                    12'd170: toneR = `f4;    12'd171: toneR = `f4;
                    12'd172: toneR = `f4;    12'd173: toneR = `f4;
                    12'd174: toneR = `f4;    12'd175: toneR = `f4;
                    
                    12'd176: toneR = `d4;    12'd177: toneR = `d4;
                    12'd178: toneR = `d4;    12'd179: toneR = `d4;
                    12'd180: toneR = `d4;    12'd181: toneR = `d4;
                    12'd182: toneR = `d4;    12'd183: toneR = `d4;
                    12'd184: toneR = `d4;    12'd185: toneR = `d4;
                    12'd186: toneR = `d4;    12'd187: toneR = `d4;
                    12'd188: toneR = `d4;    12'd189: toneR = `d4;
                    12'd190: toneR = `d4;    12'd191: toneR = `d4;
                    // - 4
                    12'd192: toneR = `c4;    12'd193: toneR = `c4;
                    12'd194: toneR = `c4;    12'd195: toneR = `c4;
                    12'd196: toneR = `c4;    12'd197: toneR = `c4;
                    12'd198: toneR = `c4;    12'd199: toneR = `c4;
                    12'd200: toneR = `c4;    12'd201: toneR = `c4;
                    12'd202: toneR = `c4;    12'd203: toneR = `c4;
                    12'd204: toneR = `c4;    12'd205: toneR = `c4;
                    12'd206: toneR = `c4;    12'd207: toneR = `c4;
                    
                    12'd208: toneR = `e4;    12'd209: toneR = `e4;
                    12'd210: toneR = `e4;    12'd211: toneR = `e4;
                    12'd212: toneR = `e4;    12'd213: toneR = `e4;
                    12'd214: toneR = `e4;    12'd215: toneR = `e4;
                    12'd216: toneR = `e4;    12'd217: toneR = `e4;
                    12'd218: toneR = `e4;    12'd219: toneR = `e4;
                    12'd220: toneR = `e4;    12'd221: toneR = `e4;
                    12'd222: toneR = `e4;    12'd223: toneR = `e4;
                    
                    12'd224: toneR = `g3;    12'd225: toneR = `g3;
                    12'd226: toneR = `g3;    12'd227: toneR = `g3;
                    12'd228: toneR = `g3;    12'd229: toneR = `g3;
                    12'd230: toneR = `g3;    12'd231: toneR = `g3;
                    12'd232: toneR = `g3;    12'd233: toneR = `g3;
                    12'd234: toneR = `g3;    12'd235: toneR = `g3;
                    12'd236: toneR = `g3;    12'd237: toneR = `g3;
                    12'd238: toneR = `g3;    12'd239: toneR = `g3;
                    
                    12'd240: toneR = `g3;    12'd241: toneR = `g3;
                    12'd242: toneR = `g3;    12'd243: toneR = `g3;
                    12'd244: toneR = `g3;    12'd245: toneR = `g3;
                    12'd246: toneR = `g3;    12'd247: toneR = `g3;
                    12'd248: toneR = `g3;    12'd249: toneR = `g3;
                    12'd250: toneR = `g3;    12'd251: toneR = `g3;
                    12'd252: toneR = `g3;    12'd253: toneR = `g3;
                    12'd254: toneR = `g3;    12'd255: toneR = `g3;
                    // -5
                    12'd256: toneR = `silence;    12'd257: toneR = `silence;
                    12'd258: toneR = `silence;    12'd259: toneR = `silence;
                    12'd260: toneR = `silence;    12'd261: toneR = `silence;
                    12'd262: toneR = `silence;    12'd263: toneR = `silence;
                    12'd264: toneR = `silence;    12'd265: toneR = `silence;
                    12'd266: toneR = `silence;    12'd267: toneR = `silence;
                    12'd268: toneR = `silence;    12'd269: toneR = `silence;
                    12'd270: toneR = `silence;    12'd271: toneR = `silence;
                    
                    12'd272: toneR = `e4;    12'd273: toneR = `e4;
                    12'd274: toneR = `e4;    12'd275: toneR = `e4;
                    12'd276: toneR = `e4;    12'd277: toneR = `e4;
                    12'd278: toneR = `e4;    12'd279: toneR = `e4;
                    12'd280: toneR = `e4;    12'd281: toneR = `e4;
                    12'd282: toneR = `e4;    12'd283: toneR = `e4;
                    12'd284: toneR = `e4;    12'd285: toneR = `e4;
                    12'd286: toneR = `e4;    12'd287: toneR = `silence;
                    
                    12'd288: toneR = `e4;    12'd289: toneR = `e4;
                    12'd290: toneR = `e4;    12'd291: toneR = `e4;
                    12'd292: toneR = `e4;    12'd293: toneR = `e4;
                    12'd294: toneR = `e4;    12'd295: toneR = `e4;
                    12'd296: toneR = `e4;    12'd297: toneR = `e4;
                    12'd298: toneR = `e4;    12'd299: toneR = `e4;
                    12'd300: toneR = `e4;    12'd301: toneR = `e4;
                    12'd302: toneR = `e4;    12'd303: toneR = `e4;
                    
                    12'd304: toneR = `c4;    12'd305: toneR = `c4;
                    12'd306: toneR = `c4;    12'd307: toneR = `c4;
                    12'd308: toneR = `c4;    12'd309: toneR = `c4;
                    12'd310: toneR = `c4;    12'd311: toneR = `c4;
                    12'd312: toneR = `c4;    12'd313: toneR = `c4;
                    12'd314: toneR = `c4;    12'd315: toneR = `c4;
                    12'd316: toneR = `c4;    12'd317: toneR = `c4;
                    12'd318: toneR = `c4;    12'd319: toneR = `c4;
                    // -6
                    12'd320: toneR = `e4;    12'd321: toneR = `e4;
                    12'd322: toneR = `e4;    12'd323: toneR = `e4;
                    12'd324: toneR = `e4;    12'd325: toneR = `e4;
                    12'd326: toneR = `e4;    12'd327: toneR = `e4;
                    12'd328: toneR = `e4;    12'd329: toneR = `e4;
                    12'd330: toneR = `e4;    12'd331: toneR = `e4;
                    12'd332: toneR = `e4;    12'd333: toneR = `e4;
                    12'd334: toneR = `e4;    12'd335: toneR = `e4;
                    
                    12'd336: toneR = `a4;    12'd337: toneR = `a4;
                    12'd338: toneR = `a4;    12'd339: toneR = `a4;
                    12'd340: toneR = `a4;    12'd341: toneR = `a4;
                    12'd342: toneR = `a4;    12'd343: toneR = `a4;
                    12'd344: toneR = `a4;    12'd345: toneR = `a4;
                    12'd346: toneR = `a4;    12'd347: toneR = `a4;
                    12'd348: toneR = `a4;    12'd349: toneR = `a4;
                    12'd350: toneR = `a4;    12'd351: toneR = `a4;
                    
                    12'd352: toneR = `g4;    12'd353: toneR = `g4;
                    12'd354: toneR = `g4;    12'd355: toneR = `g4;
                    12'd356: toneR = `g4;    12'd357: toneR = `g4;
                    12'd358: toneR = `g4;    12'd359: toneR = `g4;
                    12'd360: toneR = `g4;    12'd361: toneR = `g4;
                    12'd362: toneR = `g4;    12'd363: toneR = `g4;
                    12'd364: toneR = `g4;    12'd365: toneR = `g4;
                    12'd366: toneR = `g4;    12'd367: toneR = `g4;
                    
                    12'd368: toneR = `g4;    12'd369: toneR = `g4;
                    12'd370: toneR = `g4;    12'd371: toneR = `g4;
                    12'd372: toneR = `g4;    12'd373: toneR = `g4;
                    12'd374: toneR = `g4;    12'd375: toneR = `g4;
                    12'd376: toneR = `g4;    12'd377: toneR = `g4;
                    12'd378: toneR = `g4;    12'd379: toneR = `g4;
                    12'd380: toneR = `g4;    12'd381: toneR = `g4;
                    12'd382: toneR = `g4;    12'd383: toneR = `g4;
                    // -7
                    12'd384: toneR = `silence;    12'd385: toneR = `silence;
                    12'd386: toneR = `silence;    12'd387: toneR = `silence;
                    12'd388: toneR = `silence;    12'd389: toneR = `silence;
                    12'd390: toneR = `silence;    12'd391: toneR = `silence;
                    12'd392: toneR = `silence;    12'd393: toneR = `silence;
                    12'd394: toneR = `silence;    12'd395: toneR = `silence;
                    12'd396: toneR = `silence;    12'd397: toneR = `silence;
                    12'd398: toneR = `silence;    12'd399: toneR = `silence;
                    
                    12'd400: toneR = `f4;    12'd401: toneR = `f4;
                    12'd402: toneR = `f4;    12'd403: toneR = `f4;
                    12'd404: toneR = `f4;    12'd405: toneR = `f4;
                    12'd406: toneR = `f4;    12'd407: toneR = `f4;
                    12'd408: toneR = `f4;    12'd409: toneR = `f4;
                    12'd410: toneR = `f4;    12'd411: toneR = `f4;
                    12'd412: toneR = `f4;    12'd413: toneR = `f4;
                    12'd414: toneR = `f4;    12'd415: toneR = `f4;
                    
                    12'd416: toneR = `g4;    12'd417: toneR = `g4;
                    12'd418: toneR = `g4;    12'd419: toneR = `g4;
                    12'd420: toneR = `g4;    12'd421: toneR = `g4;
                    12'd422: toneR = `g4;    12'd423: toneR = `g4;
                    12'd424: toneR = `g4;    12'd425: toneR = `g4;
                    12'd426: toneR = `g4;    12'd427: toneR = `g4;
                    12'd428: toneR = `g4;    12'd429: toneR = `g4;
                    12'd430: toneR = `g4;    12'd431: toneR = `g4;
                    
                    12'd432: toneR = `b4;    12'd433: toneR = `b4;
                    12'd434: toneR = `b4;    12'd435: toneR = `b4;
                    12'd436: toneR = `b4;    12'd437: toneR = `b4;
                    12'd438: toneR = `b4;    12'd439: toneR = `b4;
                    12'd440: toneR = `b4;    12'd441: toneR = `b4;
                    12'd442: toneR = `b4;    12'd443: toneR = `b4;
                    12'd444: toneR = `b4;    12'd445: toneR = `b4;
                    12'd446: toneR = `b4;    12'd447: toneR = `b4;
                    // -8
                    12'd448: toneR = `c5;    12'd449: toneR = `c5;
                    12'd450: toneR = `c5;    12'd451: toneR = `c5;
                    12'd452: toneR = `c5;    12'd453: toneR = `c5;
                    12'd454: toneR = `c5;    12'd455: toneR = `c5;
                    12'd456: toneR = `c5;    12'd457: toneR = `c5;
                    12'd458: toneR = `c5;    12'd459: toneR = `c5;
                    12'd460: toneR = `c5;    12'd461: toneR = `c5;
                    12'd462: toneR = `c5;    12'd463: toneR = `c5;
                    
                    12'd464: toneR = `c5;    12'd465: toneR = `c5;
                    12'd466: toneR = `c5;    12'd467: toneR = `c5;
                    12'd468: toneR = `c5;    12'd469: toneR = `c5;
                    12'd470: toneR = `c5;    12'd471: toneR = `c5;
                    12'd472: toneR = `c5;    12'd473: toneR = `c5;
                    12'd474: toneR = `c5;    12'd475: toneR = `c5;
                    12'd476: toneR = `c5;    12'd477: toneR = `c5;
                    12'd478: toneR = `c5;    12'd479: toneR = `c5;
                    
                    12'd480: toneR = `c5;    12'd481: toneR = `c5;
                    12'd482: toneR = `c5;    12'd483: toneR = `c5;
                    12'd484: toneR = `c5;    12'd485: toneR = `c5;
                    12'd486: toneR = `c5;    12'd487: toneR = `c5;
                    12'd488: toneR = `c5;    12'd489: toneR = `c5;
                    12'd490: toneR = `c5;    12'd491: toneR = `c5;
                    12'd492: toneR = `c5;    12'd493: toneR = `c5;
                    12'd494: toneR = `c5;    12'd495: toneR = `c5;
                    
                    12'd496: toneR = `c5;    12'd497: toneR = `c5;
                    12'd498: toneR = `c5;    12'd499: toneR = `c5;
                    12'd500: toneR = `c5;    12'd501: toneR = `c5;
                    12'd502: toneR = `c5;    12'd503: toneR = `c5;
                    12'd504: toneR = `c5;    12'd505: toneR = `c5;
                    12'd506: toneR = `c5;    12'd507: toneR = `c5;
                    12'd508: toneR = `c5;    12'd509: toneR = `c5;
                    12'd510: toneR = `c5;    12'd511: toneR = `c5;
                    
                    default: toneR = `silence;
                endcase
                end else begin
                toneR = `silence;
            end
        end
        
        //toneL : accompaniment part
        always @(*) begin
            if (en == 1)begin
                case(ibeatNum)
                    12'd0: toneL  = `c3;    12'd1: toneL  = `c3;
                    12'd2: toneL  = `c3;    12'd3: toneL  = `c3;
                    12'd4: toneL  = `c3;    12'd5: toneL  = `c3;
                    12'd6: toneL  = `c3;    12'd7: toneL  = `c3;
                    12'd8: toneL  = `c3;    12'd9: toneL  = `c3;
                    12'd10: toneL = `c3;    12'd11: toneL = `c3;
                    12'd12: toneL = `c3;    12'd13: toneL = `c3;
                    12'd14: toneL = `c3;    12'd15: toneL = `c3;
                    
                    12'd16: toneL = `g3;    12'd17: toneL = `g3;
                    12'd18: toneL = `g3;    12'd19: toneL = `g3;
                    12'd20: toneL = `g3;    12'd21: toneL = `g3;
                    12'd22: toneL = `g3;    12'd23: toneL = `g3;
                    12'd24: toneL = `g3;    12'd25: toneL = `g3;
                    12'd26: toneL = `g3;    12'd27: toneL = `g3;
                    12'd28: toneL = `g3;    12'd29: toneL = `g3;
                    12'd30: toneL = `g3;    12'd31: toneL = `g3;
                    
                    12'd32: toneL = `g2;    12'd33: toneL = `g2;
                    12'd34: toneL = `g2;    12'd35: toneL = `g2;
                    12'd36: toneL = `g2;    12'd37: toneL = `g2;
                    12'd38: toneL = `g2;    12'd39: toneL = `g2;
                    12'd40: toneL = `g2;    12'd41: toneL = `g2;
                    12'd42: toneL = `g2;    12'd43: toneL = `g2;
                    12'd44: toneL = `g2;    12'd45: toneL = `g2;
                    12'd46: toneL = `g2;    12'd47: toneL = `g2;
                    
                    12'd48: toneL = `g3;    12'd49: toneL = `g3;
                    12'd50: toneL = `g3;    12'd51: toneL = `g3;
                    12'd52: toneL = `g3;    12'd53: toneL = `g3;
                    12'd54: toneL = `g3;    12'd55: toneL = `g3;
                    12'd56: toneL = `g3;    12'd57: toneL = `g3;
                    12'd58: toneL = `g3;    12'd59: toneL = `g3;
                    12'd60: toneL = `g3;    12'd61: toneL = `g3;
                    12'd62: toneL = `g3;    12'd63: toneL = `g3;
                    
                    12'd64: toneL = `c3;    12'd65: toneL = `c3;
                    12'd66: toneL = `c3;    12'd67: toneL = `c3;
                    12'd68: toneL = `c3;    12'd69: toneL = `c3;
                    12'd70: toneL = `c3;    12'd71: toneL = `c3;
                    12'd72: toneL = `c3;    12'd73: toneL = `c3;
                    12'd74: toneL = `c3;    12'd75: toneL = `c3;
                    12'd76: toneL = `c3;    12'd77: toneL = `c3;
                    12'd78: toneL = `c3;    12'd79: toneL = `c3;
                    
                    12'd80: toneL = `g3;    12'd81: toneL = `g3;
                    12'd82: toneL = `g3;    12'd83: toneL = `g3;
                    12'd84: toneL = `g3;    12'd85: toneL = `g3;
                    12'd86: toneL = `g3;    12'd87: toneL = `g3;
                    12'd88: toneL = `g3;    12'd89: toneL = `g3;
                    12'd90: toneL = `g3;    12'd91: toneL = `g3;
                    12'd92: toneL = `g3;    12'd93: toneL = `g3;
                    12'd94: toneL = `g3;    12'd95: toneL = `g3;
                    
                    12'd96: toneL  = `g2;    12'd97: toneL  = `g2;
                    12'd98: toneL  = `g2;    12'd99: toneL  = `g2;
                    12'd100: toneL = `g2;    12'd101: toneL = `g2;
                    12'd102: toneL = `g2;    12'd103: toneL = `g2;
                    12'd104: toneL = `g2;    12'd105: toneL = `g2;
                    12'd106: toneL = `g2;    12'd107: toneL = `g2;
                    12'd108: toneL = `g2;    12'd109: toneL = `g2;
                    12'd110: toneL = `g2;    12'd111: toneL = `g2;
                    
                    12'd112: toneL = `g3;    12'd113: toneL = `g3;
                    12'd114: toneL = `g3;    12'd115: toneL = `g3;
                    12'd116: toneL = `g3;    12'd117: toneL = `g3;
                    12'd118: toneL = `g3;    12'd119: toneL = `g3;
                    12'd120: toneL = `g3;    12'd121: toneL = `g3;
                    12'd122: toneL = `g3;    12'd123: toneL = `g3;
                    12'd124: toneL = `g3;    12'd125: toneL = `g3;
                    12'd126: toneL = `g3;    12'd127: toneL = `g3;
                    
                    12'd128: toneL = `f2;    12'd129: toneL = `f2;
                    12'd130: toneL = `f2;    12'd131: toneL = `f2;
                    12'd132: toneL = `f2;    12'd133: toneL = `f2;
                    12'd134: toneL = `f2;    12'd135: toneL = `f2;
                    12'd136: toneL = `f2;    12'd137: toneL = `f2;
                    12'd138: toneL = `f2;    12'd139: toneL = `f2;
                    12'd140: toneL = `f2;    12'd141: toneL = `f2;
                    12'd142: toneL = `f2;    12'd143: toneL = `f2;
                    
                    12'd144: toneL = `f3;    12'd145: toneL = `f3;
                    12'd146: toneL = `f3;    12'd147: toneL = `f3;
                    12'd148: toneL = `f3;    12'd149: toneL = `f3;
                    12'd150: toneL = `f3;    12'd151: toneL = `f3;
                    12'd152: toneL = `f3;    12'd153: toneL = `f3;
                    12'd154: toneL = `f3;    12'd155: toneL = `f3;
                    12'd156: toneL = `f3;    12'd157: toneL = `f3;
                    12'd158: toneL = `f3;    12'd159: toneL = `f3;
                    
                    12'd160: toneL = `f2;    12'd161: toneL = `f2;
                    12'd162: toneL = `f2;    12'd163: toneL = `f2;
                    12'd164: toneL = `f2;    12'd165: toneL = `f2;
                    12'd166: toneL = `f2;    12'd167: toneL = `f2;
                    12'd168: toneL = `f2;    12'd169: toneL = `f2;
                    12'd170: toneL = `f2;    12'd171: toneL = `f2;
                    12'd172: toneL = `f2;    12'd173: toneL = `f2;
                    12'd174: toneL = `f2;    12'd175: toneL = `f2;
                    
                    12'd176: toneL = `f3;    12'd177: toneL = `f3;
                    12'd178: toneL = `f3;    12'd179: toneL = `f3;
                    12'd180: toneL = `f3;    12'd181: toneL = `f3;
                    12'd182: toneL = `f3;    12'd183: toneL = `f3;
                    12'd184: toneL = `f3;    12'd185: toneL = `f3;
                    12'd186: toneL = `f3;    12'd187: toneL = `f3;
                    12'd188: toneL = `f3;    12'd189: toneL = `f3;
                    12'd190: toneL = `f3;    12'd191: toneL = `f3;
                    
                    12'd192: toneL = `c3;    12'd193: toneL = `c3;
                    12'd194: toneL = `c3;    12'd195: toneL = `c3;
                    12'd196: toneL = `c3;    12'd197: toneL = `c3;
                    12'd198: toneL = `c3;    12'd199: toneL = `c3;
                    12'd200: toneL = `c3;    12'd201: toneL = `c3;
                    12'd202: toneL = `c3;    12'd203: toneL = `c3;
                    12'd204: toneL = `c3;    12'd205: toneL = `c3;
                    12'd206: toneL = `c3;    12'd207: toneL = `c3;
                    
                    12'd208: toneL = `g2;    12'd209: toneL = `g2;
                    12'd210: toneL = `g2;    12'd211: toneL = `g2;
                    12'd212: toneL = `g2;    12'd213: toneL = `g2;
                    12'd214: toneL = `g2;    12'd215: toneL = `g2;
                    12'd216: toneL = `g2;    12'd217: toneL = `g2;
                    12'd218: toneL = `g2;    12'd219: toneL = `g2;
                    12'd220: toneL = `g2;    12'd221: toneL = `g2;
                    12'd222: toneL = `g2;    12'd223: toneL = `g2;
                    
                    12'd224: toneL = `a2;    12'd225: toneL = `a2;
                    12'd226: toneL = `a2;    12'd227: toneL = `a2;
                    12'd228: toneL = `a2;    12'd229: toneL = `a2;
                    12'd230: toneL = `a2;    12'd231: toneL = `a2;
                    12'd232: toneL = `a2;    12'd233: toneL = `a2;
                    12'd234: toneL = `a2;    12'd235: toneL = `a2;
                    12'd236: toneL = `a2;    12'd237: toneL = `a2;
                    12'd238: toneL = `a2;    12'd239: toneL = `a2;
                    
                    12'd240: toneL = `b2;    12'd241: toneL = `b2;
                    12'd242: toneL = `b2;    12'd243: toneL = `b2;
                    12'd244: toneL = `b2;    12'd245: toneL = `b2;
                    12'd246: toneL = `b2;    12'd247: toneL = `b2;
                    12'd248: toneL = `b2;    12'd249: toneL = `b2;
                    12'd250: toneL = `b2;    12'd251: toneL = `b2;
                    12'd252: toneL = `b2;    12'd253: toneL = `b2;
                    12'd254: toneL = `b2;    12'd255: toneL = `b2;
                    
                    12'd256: toneL = `c3;    12'd257: toneL = `c3;
                    12'd258: toneL = `c3;    12'd259: toneL = `c3;
                    12'd260: toneL = `c3;    12'd261: toneL = `c3;
                    12'd262: toneL = `c3;    12'd263: toneL = `c3;
                    12'd264: toneL = `c3;    12'd265: toneL = `c3;
                    12'd266: toneL = `c3;    12'd267: toneL = `c3;
                    12'd268: toneL = `c3;    12'd269: toneL = `c3;
                    12'd270: toneL = `c3;    12'd271: toneL = `c3;
                    
                    12'd272: toneL = `g3;    12'd273: toneL = `g3;
                    12'd274: toneL = `g3;    12'd275: toneL = `g3;
                    12'd276: toneL = `g3;    12'd277: toneL = `g3;
                    12'd278: toneL = `g3;    12'd279: toneL = `g3;
                    12'd280: toneL = `g3;    12'd281: toneL = `g3;
                    12'd282: toneL = `g3;    12'd283: toneL = `g3;
                    12'd284: toneL = `g3;    12'd285: toneL = `g3;
                    12'd286: toneL = `g3;    12'd287: toneL = `g3;
                    
                    12'd288: toneL = `g2;    12'd289: toneL = `g2;
                    12'd290: toneL = `g2;    12'd291: toneL = `g2;
                    12'd292: toneL = `g2;    12'd293: toneL = `g2;
                    12'd294: toneL = `g2;    12'd295: toneL = `g2;
                    12'd296: toneL = `g2;    12'd297: toneL = `g2;
                    12'd298: toneL = `g2;    12'd299: toneL = `g2;
                    12'd300: toneL = `g2;    12'd301: toneL = `g2;
                    12'd302: toneL = `g2;    12'd303: toneL = `g2;
                    
                    12'd304: toneL = `g3;    12'd305: toneL = `g3;
                    12'd306: toneL = `g3;    12'd307: toneL = `g3;
                    12'd308: toneL = `g3;    12'd309: toneL = `g3;
                    12'd310: toneL = `g3;    12'd311: toneL = `g3;
                    12'd312: toneL = `g3;    12'd313: toneL = `g3;
                    12'd314: toneL = `g3;    12'd315: toneL = `g3;
                    12'd316: toneL = `g3;    12'd317: toneL = `g3;
                    12'd318: toneL = `g3;    12'd319: toneL = `g3;
                    
                    12'd320: toneL = `c3;    12'd321: toneL = `c3;
                    12'd322: toneL = `c3;    12'd323: toneL = `c3;
                    12'd324: toneL = `c3;    12'd325: toneL = `c3;
                    12'd326: toneL = `c3;    12'd327: toneL = `c3;
                    12'd328: toneL = `c3;    12'd329: toneL = `c3;
                    12'd330: toneL = `c3;    12'd331: toneL = `c3;
                    12'd332: toneL = `c3;    12'd333: toneL = `c3;
                    12'd334: toneL = `c3;    12'd335: toneL = `c3;
                    
                    12'd336: toneL = `g3;    12'd337: toneL = `g3;
                    12'd338: toneL = `g3;    12'd339: toneL = `g3;
                    12'd340: toneL = `g3;    12'd341: toneL = `g3;
                    12'd342: toneL = `g3;    12'd343: toneL = `g3;
                    12'd344: toneL = `g3;    12'd345: toneL = `g3;
                    12'd346: toneL = `g3;    12'd347: toneL = `g3;
                    12'd348: toneL = `g3;    12'd349: toneL = `g3;
                    12'd350: toneL = `g3;    12'd351: toneL = `g3;
                    
                    12'd352: toneL = `g2;    12'd353: toneL = `g2;
                    12'd354: toneL = `g2;    12'd355: toneL = `g2;
                    12'd356: toneL = `g2;    12'd357: toneL = `g2;
                    12'd358: toneL = `g2;    12'd359: toneL = `g2;
                    12'd360: toneL = `g2;    12'd361: toneL = `g2;
                    12'd362: toneL = `g2;    12'd363: toneL = `g2;
                    12'd364: toneL = `g2;    12'd365: toneL = `g2;
                    12'd366: toneL = `g2;    12'd367: toneL = `g2;
                    
                    12'd368: toneL = `g3;    12'd369: toneL = `g3;
                    12'd370: toneL = `g3;    12'd371: toneL = `g3;
                    12'd372: toneL = `g3;    12'd373: toneL = `g3;
                    12'd374: toneL = `g3;    12'd375: toneL = `g3;
                    12'd376: toneL = `g3;    12'd377: toneL = `g3;
                    12'd378: toneL = `g3;    12'd379: toneL = `g3;
                    12'd380: toneL = `g3;    12'd381: toneL = `g3;
                    12'd382: toneL = `g3;    12'd383: toneL = `g3;
                    
                    12'd384: toneL = `f2;    12'd385: toneL = `f2;
                    12'd386: toneL = `f2;    12'd387: toneL = `f2;
                    12'd388: toneL = `f2;    12'd389: toneL = `f2;
                    12'd390: toneL = `f2;    12'd391: toneL = `f2;
                    12'd392: toneL = `f2;    12'd393: toneL = `f2;
                    12'd394: toneL = `f2;    12'd395: toneL = `f2;
                    12'd396: toneL = `f2;    12'd397: toneL = `f2;
                    12'd398: toneL = `f2;    12'd399: toneL = `f2;
                    
                    12'd400: toneL = `f3;    12'd401: toneL = `f3;
                    12'd402: toneL = `f3;    12'd403: toneL = `f3;
                    12'd404: toneL = `f3;    12'd405: toneL = `f3;
                    12'd406: toneL = `f3;    12'd407: toneL = `f3;
                    12'd408: toneL = `f3;    12'd409: toneL = `f3;
                    12'd410: toneL = `f3;    12'd411: toneL = `f3;
                    12'd412: toneL = `f3;    12'd413: toneL = `f3;
                    12'd414: toneL = `f3;    12'd415: toneL = `f3;
                    
                    12'd416: toneL = `g2;    12'd417: toneL = `g2;
                    12'd418: toneL = `g2;    12'd419: toneL = `g2;
                    12'd420: toneL = `g2;    12'd421: toneL = `g2;
                    12'd422: toneL = `g2;    12'd423: toneL = `g2;
                    12'd424: toneL = `g2;    12'd425: toneL = `g2;
                    12'd426: toneL = `g2;    12'd427: toneL = `g2;
                    12'd428: toneL = `g2;    12'd429: toneL = `g2;
                    12'd430: toneL = `g2;    12'd431: toneL = `g2;
                    
                    12'd432: toneL = `g3;    12'd433: toneL = `g3;
                    12'd434: toneL = `g3;    12'd435: toneL = `g3;
                    12'd436: toneL = `g3;    12'd437: toneL = `g3;
                    12'd438: toneL = `g3;    12'd439: toneL = `g3;
                    12'd440: toneL = `g3;    12'd441: toneL = `g3;
                    12'd442: toneL = `g3;    12'd443: toneL = `g3;
                    12'd444: toneL = `g3;    12'd445: toneL = `g3;
                    12'd446: toneL = `g3;    12'd447: toneL = `g3;
                    
                    12'd448: toneL = `c3;    12'd449: toneL = `c3;
                    12'd450: toneL = `c3;    12'd451: toneL = `c3;
                    12'd452: toneL = `c3;    12'd453: toneL = `c3;
                    12'd454: toneL = `c3;    12'd455: toneL = `c3;
                    12'd456: toneL = `c3;    12'd457: toneL = `c3;
                    12'd458: toneL = `c3;    12'd459: toneL = `c3;
                    12'd460: toneL = `c3;    12'd461: toneL = `c3;
                    12'd462: toneL = `c3;    12'd463: toneL = `c3;
                    
                    12'd464: toneL = `g2;    12'd465: toneL = `g2;
                    12'd466: toneL = `g2;    12'd467: toneL = `g2;
                    12'd468: toneL = `g2;    12'd469: toneL = `g2;
                    12'd470: toneL = `g2;    12'd471: toneL = `g2;
                    12'd472: toneL = `g2;    12'd473: toneL = `g2;
                    12'd474: toneL = `g2;    12'd475: toneL = `g2;
                    12'd476: toneL = `g2;    12'd477: toneL = `g2;
                    12'd478: toneL = `g2;    12'd479: toneL = `g2;
                    
                    12'd480: toneL = `c2;    12'd481: toneL = `c2;
                    12'd482: toneL = `c2;    12'd483: toneL = `c2;
                    12'd484: toneL = `c2;    12'd485: toneL = `c2;
                    12'd486: toneL = `c2;    12'd487: toneL = `c2;
                    12'd488: toneL = `c2;    12'd489: toneL = `c2;
                    12'd490: toneL = `c2;    12'd491: toneL = `c2;
                    12'd492: toneL = `c2;    12'd493: toneL = `c2;
                    12'd494: toneL = `c2;    12'd495: toneL = `c2;
                    
                    12'd496: toneL = `c2;    12'd497: toneL = `c2;
                    12'd498: toneL = `c2;    12'd499: toneL = `c2;
                    12'd500: toneL = `c2;    12'd501: toneL = `c2;
                    12'd502: toneL = `c2;    12'd503: toneL = `c2;
                    12'd504: toneL = `c2;    12'd505: toneL = `c2;
                    12'd506: toneL = `c2;    12'd507: toneL = `c2;
                    12'd508: toneL = `c2;    12'd509: toneL = `c2;
                    12'd510: toneL = `c2;    12'd511: toneL = `c2;
                    
                    
                    default : toneL = `silence;
                endcase
            end
            else begin
                toneL = `silence;
            end
        end
endmodule