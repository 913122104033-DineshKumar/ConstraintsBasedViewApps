import UIKit

class ResultPageViewController: UIViewController
{
    private var item: Item
    
    init(_ item: Item)
    {
        self.item = item
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        self.view.addSubview(resultView)
        
        NSLayoutConstraint(item: resultView, attribute: .leftMargin, relatedBy: .equal, toItem: self.view, attribute: .leftMargin, multiplier: 1, constant: 20).isActive = true
        NSLayoutConstraint(item: resultView, attribute: .topMargin, relatedBy: .equal, toItem: self.view, attribute: .topMargin, multiplier: 1, constant: 100).isActive = true
        NSLayoutConstraint(item: resultView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1, constant: 350).isActive = true
        NSLayoutConstraint(item: resultView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 100).isActive = true
        
        self.view.addSubview(image)
        
        NSLayoutConstraint(item: image, attribute: .centerX, relatedBy: .equal, toItem: resultView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: image, attribute: .topMargin, relatedBy: .equal, toItem: resultView, attribute: .topMargin, multiplier: 1, constant: 90).isActive = true
        NSLayoutConstraint(item: image, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1, constant: 500).isActive = true
        NSLayoutConstraint(item: image, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 300).isActive = true
        
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        
        if let errorMessage = item.errorMessage
        {
            resultView.textColor = .systemRed
            resultView.text = errorMessage
            image.isHidden = true
        } else
        {
            image.isHidden = false
            resultView.textColor = .systemGreen
            resultView.text = """
                Item Name: \(item.itemName!)
                Item Price: \(item.itemPrice!)
                Item Description: \(item.itemDescription ?? "")
            """
        }
        
        if !image.isHidden
        {
            let animator = UIViewPropertyAnimator(duration: 3, curve: .easeOut) {
                self.image.frame = CGRect(x: 0, y: 0, width: 500, height: 300)
            }
            
            animator.startAnimation()
        }
        
    }
    
    let resultView: UITextView =
    {
        let resultView = UITextView()
        
        resultView.translatesAutoresizingMaskIntoConstraints = false
        resultView.layer.cornerRadius = 8
        resultView.layer.borderWidth = 1
        resultView.font = .systemFont(ofSize: 20)
        
        return resultView
    } ()
    
    let image: UIImageView =
    {
        let image = UIImageView(image: UIImage(named: "resultimage"))
        
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.isHidden = true
        
        return image
    } ()
    
}
