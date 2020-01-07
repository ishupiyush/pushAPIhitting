
import UIKit
@IBDesignable
class ViewController: UIViewController {

    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var emailLabel: UITextField!
    @IBOutlet weak var phoneLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    @IBOutlet weak var cnfpasslabel: UITextField!
    
//    func apiCall() {
//        var param = ["registerTYpe" : "EMAIL"]
//        param["name"] : String
//        param["email"] : String
//        param["phone"] : Int
//        param["password"] : String
//        param["confirmpassword"] : String
//
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let name = UIImage(named: "manlogo")
        addLeftImage(txtField: nameLabel, img: name!)
        let email = UIImage(named: "emailpng")
        addLeftImage(txtField: emailLabel, img: email!)
        let phonenumber = UIImage(named: "phonelogo")
        addLeftImage(txtField: phoneLabel, img: phonenumber!)
        let pass = UIImage(named: "passwordlogo")
        addLeftImage(txtField: passwordLabel, img: pass!)
        let cnfpass = UIImage(named: "passwordlogo")
        addLeftImage(txtField: cnfpasslabel, img: cnfpass!)
        
        
        let bottomline = CALayer()
        bottomline.frame = CGRect(x: 0, y: nameLabel.frame.height - 2, width: nameLabel.frame.width, height: 2)
        bottomline.backgroundColor = UIColor.init(white: 173/255, alpha: 1).cgColor
        nameLabel.borderStyle = .none
        nameLabel.layer.addSublayer(bottomline)
        
        let line2 = CALayer()
        line2.frame = CGRect(x: 0, y: emailLabel.frame.height - 2, width: emailLabel.frame.width, height: 2)
        line2.backgroundColor = UIColor.init(white: 173/255, alpha: 1).cgColor
        emailLabel.borderStyle = .none
        emailLabel.layer.addSublayer(line2)
        
        let line3 = CALayer()
        line3.frame = CGRect(x: 0, y: phoneLabel.frame.height - 2, width: phoneLabel.frame.width, height: 2)
        line3.backgroundColor = UIColor.init(white: 173/255, alpha: 1).cgColor
        phoneLabel.borderStyle = .none
        phoneLabel.layer.addSublayer(line3)
        
        let line4 = CALayer()
        line4.frame = CGRect(x: 0, y: passwordLabel.frame.height - 2, width: passwordLabel.frame.width, height: 2)
        line4.backgroundColor = UIColor.init(white: 173/255, alpha: 1).cgColor
        passwordLabel.borderStyle = .none
        passwordLabel.layer.addSublayer(line4)
        
        let line5 = CALayer()
        line5.frame = CGRect(x: 0, y: cnfpasslabel.frame.height - 2, width: cnfpasslabel.frame.width, height: 2)
        line5.backgroundColor = UIColor.init(white: 173/255, alpha: 1).cgColor
        cnfpasslabel.borderStyle = .none
        cnfpasslabel.layer.addSublayer(line5)
        
    }
    func addLeftImage(txtField:UITextField,img:UIImage){
        let leftImage = UIImageView(frame: CGRect(x: 5, y: 5, width: 23, height: 23))
        leftImage.image = img
        txtField.leftView = leftImage
        txtField.leftViewMode = .always
    }
    @IBAction func saveClick(_ sender: UIButton ) {
        if (emailLabel.text?.emailValid)!{
            print("Email is valid")
        } else{
            print("Email INVALID")
        }
        
        if(passwordLabel.text?.passwordValid)!{
            print("password valid")
        } else {
            print("password INVALID")
        }
        if(cnfpasslabel.text?.passwordValid)!{
            print("password valid")
        } else {
            print("password INVALID")
        }
        
        if(phoneLabel.text?.isPhoneValid)!{
            print("Phone number is valid")
        }
        else{
            print("Phone Invalid")
        }
        
    
    
    private func bodyForMultipartRequest(params: [String: Any]) -> Data {
        let boundary:NSString = "----WebKitFormBoundarycC4YiaUFwM44F6rT"
        let body: NSMutableData = NSMutableData()
        
        let paramsArray = params.keys
        print(paramsArray)
        for key in paramsArray {
            body.append(("--\(boundary)\r\n" as String).data(using: String.Encoding.utf8, allowLossyConversion: true)!)
            body.append("Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n" .data(using: String.Encoding.utf8, allowLossyConversion: true)!)
            body.append("\(params[key]! )\r\n".data(using: String.Encoding.utf8, allowLossyConversion: true)!)
        }
        
        body.append("--\(boundary)--\r\n".data(using: String.Encoding.utf8, allowLossyConversion: true)!)
        return body as Data
    }

}

