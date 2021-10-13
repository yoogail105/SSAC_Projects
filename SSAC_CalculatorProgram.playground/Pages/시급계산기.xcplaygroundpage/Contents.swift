//시급계산기

class HourlyWage {
   // 저장 프로퍼티: userName, userWeight, userHeight
    var monthlySalary: Double {
        willSet {
            print("월급이 \(monthlySalary)원에서 \(newValue)원으로 변경될 예정입니다.")
        }
        didSet {
            print("월급이 \(oldValue)원에서 \(monthlySalary)원으로 변경되었습니다.")
        }
    }
   var workingHours: Double
    var hourlyWage: Double {
        get {
            return monthlySalary / workingHours
        }
        set {
            monthlySalary = newValue * workingHours
        }
    }
   
    init(monthlySalary: Double, workingHours: Double) {
       self.monthlySalary = monthlySalary
       self.workingHours = workingHours
   }
}

var myHourlyWage = HourlyWage(monthlySalary: 400000, workingHours: 40)

myHourlyWage.hourlyWage
myHourlyWage.hourlyWage = 12000
myHourlyWage.monthlySalary
