//환율 계산기
import UIKit

struct ExchangeRate {
    var currencyRate: Double {
        willSet {
            print("willSet - 환율 변동 예정: \(currencyRate) -> \(newValue)")
        }
        didSet {
            print("currentRate didSet - 환율 변동 완료: \(oldValue) -> \(currencyRate)")
        }

    }
    var USD: Double {
        willSet {
            print("USD willSet - 환전 금액: \(USD)달러로 환전될 예정")
        }
        didSet {
            print("USD didSet - KRW: \(KRW)원 -> \(USD)달러로 환전되었음")
        }
    }
    var KRW: Double {
        get {
            return USD * currencyRate
        }
        set {
            USD = newValue / currencyRate
        }
    }
    
}

var rate = ExchangeRate(currencyRate: 1100, USD: 1)
rate.KRW = 500000
rate.currencyRate = 1350
rate.KRW = 500000
