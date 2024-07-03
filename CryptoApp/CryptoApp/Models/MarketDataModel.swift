//
//  MarketDataModel.swift
//  CryptoApp
//
//  Created by Muhammed Nadeem on 23/05/24.
//

import Foundation

/*
 
https://api.coingecko.com/api/v3/global
 
 JSON RESPONSE
 
 {
   "data": {
     "active_cryptocurrencies": 14400,
     "upcoming_icos": 0,
     "ongoing_icos": 49,
     "ended_icos": 3376,
     "markets": 1101,
     "total_market_cap": {
       "btc": 39347546.1345138,
       "eth": 708195579.326112,
       "ltc": 31247647435.5425,
       "bch": 5502116607.17889,
       "bnb": 4504521619.13171,
       "eos": 3251410015385.7,
       "xrp": 5009776389690.39,
       "xlm": 24634175104179.5,
       "link": 168009255360.867,
       "dot": 370860406110.505,
       "yfi": 384008463.157739,
       "usd": 2670750179056.94,
       "aed": 9809705468928.83,
       "ars": 2377591386357496,
       "aud": 4030407729213.4,
       "bdt": 313277270698764,
       "bhd": 1006840768502.32,
       "bmd": 2670750179056.94,
       "brl": 13763711047770,
       "cad": 3658065093000.18,
       "chf": 2440104193593.58,
       "clp": 2.42712434772337e+15,
       "cny": 18979953222486.1,
       "czk": 61026865934466,
       "dkk": 18410231465039.8,
       "eur": 2467081441152.24,
       "gbp": 2100991031108.19,
       "gel": 7264440487034.88,
       "hkd": 20857495939863.5,
       "huf": 955490254809590,
       "idr": 42928597549425850,
       "ils": 9811550957302.55,
       "inr": 222485064946720,
       "jpy": 419295759736134,
       "krw": 3.64948082920191e+15,
       "kwd": 819973719974.063,
       "lkr": 801527847347884,
       "mmk": 5608750579902064,
       "mxn": 44696606696625.4,
       "myr": 12564544217373.4,
       "ngn": 3.85656325855823e+15,
       "nok": 28457524199147.4,
       "nzd": 4368487311379.51,
       "php": 155580542884943,
       "pkr": 743293726119151,
       "pln": 10515352385988,
       "rub": 241369247738535,
       "sar": 10016854194316.8,
       "sek": 28653995265319.5,
       "sgd": 3608592116683.33,
       "thb": 97788182431080.6,
       "try": 86025541637969.5,
       "twd": 86106588222903.3,
       "uah": 106691355166732,
       "vef": 267422215428.972,
       "vnd": 68027258763021460,
       "zar": 49290913947894.5,
       "xdr": 2017671637772.15,
       "xag": 88375310377.5069,
       "xau": 1138834583.85167,
       "bits": 39347546134513.8,
       "sats": 3934754613451382
     },
     "total_volume": {
       "btc": 1734031.65787215,
       "eth": 31209914.5984459,
       "ltc": 1377072148.33735,
       "bch": 242476223.283045,
       "bnb": 198512584.862121,
       "eos": 143288424648.569,
       "xrp": 220778973837.041,
       "xlm": 1085618893492.94,
       "link": 7404105115.35622,
       "dot": 16343679543.5346,
       "yfi": 16923109.5054812,
       "usd": 117698962596.557,
       "aed": 432310055101.593,
       "ars": 104779564126661,
       "aud": 177618562862.764,
       "bdt": 13806012279046.3,
       "bhd": 44371096511.351,
       "bmd": 117698962596.557,
       "brl": 606561603741.358,
       "cad": 161209561992.365,
       "chf": 107534480186.718,
       "clp": 106962463228499,
       "cny": 836439447588.693,
       "czk": 2689431182044.18,
       "dkk": 811332022586.558,
       "eur": 108723357407.906,
       "gbp": 92589889808.9459,
       "gel": 320141178262.635,
       "hkd": 919182053691.999,
       "huf": 42108098557506.8,
       "idr": 1.89184725584354e+15,
       "ils": 432391385084.747,
       "inr": 9804833691597.12,
       "jpy": 18478207482327.8,
       "krw": 160831256693863,
       "kwd": 36135935496.395,
       "lkr": 35323032781152.6,
       "mmk": 247175542622415,
       "mxn": 1969762758430.94,
       "myr": 553714769535.504,
       "ngn": 169957301989429,
       "nok": 1254112459701.78,
       "nzd": 192517603742.012,
       "php": 6856376399919.58,
       "pkr": 32756676814918.4,
       "pln": 463407651106.118,
       "rub": 10637052572086.1,
       "sar": 441439022038.507,
       "sek": 1262770866186.23,
       "sgd": 159029306409.226,
       "thb": 4309488665991.65,
       "try": 3791113480771.6,
       "twd": 3794685173490.57,
       "uah": 4701848162219.09,
       "vef": 11785197124.7933,
       "vnd": 2.99793587864605e+15,
       "zar": 2172232162557.37,
       "xdr": 88918035272.8211,
       "xag": 3894666911.24747,
       "xau": 50188014.6407979,
       "bits": 1734031657872.15,
       "sats": 173403165787215
     },
     "market_cap_percentage": {
       "btc": 50.0719280890582,
       "eth": 16.9635924499022,
       "usdt": 4.1885936519502,
       "bnb": 3.41488930562876,
       "sol": 2.8752845277451,
       "steth": 1.31297271136116,
       "usdc": 1.2343576435148,
       "xrp": 1.10293888513556,
       "doge": 0.854222673929376,
       "ton": 0.818001104799342
     },
     "market_cap_change_percentage_24h_usd": -2.13192654027373,
     "updated_at": 1716476680
   }
 }
 
*/

struct GlobalData: Codable {
    let data: MarketDataModel?
}

struct MarketDataModel: Codable {
    let totalMarketCap, totalVolume, marketCapPercentage: [String: Double]
    let marketCapChangePercentage24HUsd: Double

    enum CodingKeys: String, CodingKey {
        case totalMarketCap = "total_market_cap"
        case totalVolume = "total_volume"
        case marketCapPercentage = "market_cap_percentage"
        case marketCapChangePercentage24HUsd = "market_cap_change_percentage_24h_usd"
    }
    
    var marketCap: String {
        if let item = totalMarketCap.first(where: { $0.key == "inr" }){
            return "$" + item.value.formattedWithAbbreviations()
        }
        return ""
    }
    
    var volume: String{
        if let item = totalVolume.first(where: { $0.key == "inr" }){
            return "$" + item.value.formattedWithAbbreviations()
        }
        return ""
    }
    
    var btcMarketPercentage: String{
        if let item = marketCapPercentage.first(where: { $0.key == "btc" }){
            return item.value.asPercentageString()
        }
        return ""
    }
    
}
