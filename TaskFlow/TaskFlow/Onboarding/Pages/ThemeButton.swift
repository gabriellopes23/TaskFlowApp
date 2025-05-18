
import UIKit

class ThemeButton: UIButton {
    
    private var title: String
    private var imageName: String
    
    init(title: String, imageName: String, isSelected: Bool) {
        self.title = title
        self.imageName = imageName
        super.init(frame: .zero)
        configure(isSelected: isSelected)
        self.layer.cornerRadius = 12
        self.layer.borderWidth = 1
        self.clipsToBounds = true
    }
    
    func setSelected(_ selected: Bool) {
        configure(isSelected: selected)
    }
    
    private func configure(isSelected: Bool) {
        var config = UIButton.Configuration.filled()
        config.image = UIImage(systemName: imageName)
        config.imagePadding = 8
        config.imagePlacement = .top
        config.title = title
        config.baseForegroundColor = UIColor(named: isSelected ? "background" : "mainText")
        config.baseBackgroundColor = UIColor(named: isSelected ? "primaryAccentColor" : "background")
        
        self.layer.borderColor = UIColor(named: isSelected ? "primaryAccentColor" : "background")?.cgColor
        self.configuration = config
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
