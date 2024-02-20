import UIKit

class CalculateViewController: UIViewController {
    
    //var bmiValue : String?
    var calculatorBrain = CalculatorBrain()

    @IBOutlet weak var heightLabel: UILabel!
   // @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSilder: UISlider!
    @IBOutlet weak var weightSilder: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
   
    @IBAction func heightSilderChanged1(_ sender: UISlider) {
        
       let height
        = String(format: "%.2f" , sender.value)
        
        heightLabel.text = "\(height)m"
    }
   
    
    
    @IBAction func weightSilderChanged(_ sender: UISlider) {
        let weight = String(format: "%.0f" , sender.value)
        weightLabel.text = "\(weight)kg"
    }
    

    @IBAction func calculatePressed(_ sender: Any) {
        let height = heightSilder.value
        let weight = weightSilder.value
        //let bmi = weight / (height*height)
        calculatorBrain.calculateBMI(height: height,weight : weight)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculatorBrain.getBMIvalue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
        }
    }
    
}

