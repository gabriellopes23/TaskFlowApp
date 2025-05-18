
import UIKit

class PageOnboarding1: UIViewController {

    let imageView = UIImageView()
    let titleLabel = UILabel()
    let descriptionLabel = UILabel()
    let buttonStart = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
    }
}

extension PageOnboarding1 {
    private func style() {
        view.backgroundColor = UIColor(named: "background")
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "imageOnboarding")
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 42, weight: .bold)
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.numberOfLines = 0
        titleLabel.text = "Organize seu dia, conquiste seus objetivos"
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.textAlignment = .center
        descriptionLabel.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        descriptionLabel.adjustsFontForContentSizeCategory = true
        descriptionLabel.numberOfLines = 0
        descriptionLabel.text = "Simplifique suas tarefas e alcance suas metas com TaskFlow."
        
        buttonStart.translatesAutoresizingMaskIntoConstraints = false
        buttonStart.setTitle("Começar", for: .normal)
        buttonStart.setTitleColor(UIColor(named: "background"), for: .normal)
        buttonStart.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        buttonStart.backgroundColor = UIColor(named: "primaryAccentColor")
        buttonStart.layer.cornerRadius = 20
        buttonStart.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
    }
    
    private func layout() {
        view.addSubview(imageView)
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(buttonStart)
        
        NSLayoutConstraint.activate([
            // ImageView
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            imageView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: imageView.trailingAnchor, multiplier: 2),
            imageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4),
            
            // TitleLabel
            titleLabel.topAnchor.constraint(equalToSystemSpacingBelow: imageView.bottomAnchor, multiplier: 2),
            titleLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            
            // DescriptionLabel
            descriptionLabel.topAnchor.constraint(equalToSystemSpacingBelow: titleLabel.bottomAnchor, multiplier: 3),
            descriptionLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 3),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: descriptionLabel.trailingAnchor, multiplier: 3),
            
            // ButtonStart
            buttonStart.topAnchor.constraint(equalToSystemSpacingBelow: descriptionLabel.bottomAnchor, multiplier: 5),
            buttonStart.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            buttonStart.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            buttonStart.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor),
            buttonStart.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
}

// MARK: - Actions
extension PageOnboarding1 {
    @objc func startButtonTapped() {
        let nextPage = PageOnboarding2()
        
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            nextPage.delegate = appDelegate
        }
        
        nextPage.modalPresentationStyle = .fullScreen
        present(nextPage, animated: true)
    }
}
