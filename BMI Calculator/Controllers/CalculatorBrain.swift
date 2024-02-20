
import UIKit

struct CalculatorBrain {
    var bmi : BMI?
    
    func getBMIvalue () -> String {
       // if bmi != nil {
         //   let BMITo1DecemalPlace = String(format : "%.1f", bmi! )
           // return BMITo1DecemalPlace
        //}else {
          //    return "0.0"
        //}
        let BMITo1DecemalPlace = String(format : "%.1f", bmi?.value ?? 0.0 )
        return BMITo1DecemalPlace
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "NO advice"
    }
    func getColor()-> UIColor {
        return bmi?.color ?? UIColor.white
    }
    
    
    mutating func calculateBMI (height : Float , weight : Float) {
        let  bmiValue = weight / pow(height , 2)
        // bmiValue = String(format : "%.1f", bmi )
        
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "Eat more peanuts", color: UIColor.blue)
        } else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: "Normal", color: UIColor.green)
        }else {
            bmi = BMI(value: bmiValue, advice: "Eat less", color: UIColor.red)
        }
    }
    }

