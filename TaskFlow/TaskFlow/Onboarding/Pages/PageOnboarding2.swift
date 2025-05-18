
import UIKit

protocol OnboardingViewControllerDelegate: AnyObject {
    func didFinishOnboarding()
}

class PageOnboarding2: UIViewController {
    
    let titleLabel = UILabel()
    let labelAboveTextField = UILabel()
    let nameTextField = UITextField()
    let themeOptionsLabel = UILabel()
    let buttonContinue = UIButton(type: .system)
    let buttonSkip = UIButton(type: .system)
    
    weak var delegate: OnboardingViewControllerDelegate?
    
    private let lightButton = ThemeButton(title: "Claro", imageName: "sun.max.fill", isSelected: true)
    private let darkButton = ThemeButton(title: "Escuro", imageName: "moon.fill", isSelected: false)
    private let autoButton = ThemeButton(title: "Automático", imageName: "gear", isSelected: false)
    lazy var stackButtonsView: UIStackView = {
        let divider1 = createVerticalDivider()
        let divider2 = createVerticalDivider()
        
        let stack = UIStackView(arrangedSubviews: [lightButton, divider1, darkButton, divider2, autoButton])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
//        stack.distribution = .fillEqually
        stack.layer.borderColor = UIColor.systemGray4.cgColor
        stack.layer.borderWidth = 1
        stack.layer.cornerRadius = 12
        
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lightButton.addTarget(self, action: #selector(lightSelected), for: .touchUpInside)
        darkButton.addTarget(self, action: #selector(darkSelected), for: .touchUpInside)
        autoButton.addTarget(self, action: #selector(autoSelected), for: .touchUpInside)
        
        style()
        layout()
    }
}

extension PageOnboarding2 {
    private func style() {
        view.backgroundColor = UIColor(named: "background")
        
        // TittleLabel
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 42, weight: .bold)
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.numberOfLines = 0
        titleLabel.text = "Só mais alguns detalhes..."
        
        // LabelAboveTextField
        labelAboveTextField.translatesAutoresizingMaskIntoConstraints = false
        labelAboveTextField.textAlignment = .left
        labelAboveTextField.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        labelAboveTextField.adjustsFontForContentSizeCategory = true
        labelAboveTextField.numberOfLines = 0
        labelAboveTextField.text = "Como podemos te chamar?"
        
        // NameTextField
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.placeholder = "Seu nome"
        nameTextField.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        nameTextField.textColor = UIColor(named: "mainText")
        nameTextField.borderStyle = .none
        nameTextField.layer.borderColor = UIColor.systemGray4.cgColor
        nameTextField.layer.borderWidth = 1.0
        nameTextField.layer.cornerRadius = 10
        nameTextField.layer.masksToBounds = true
        nameTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: nameTextField.frame.height))
        nameTextField.leftViewMode = .always
        nameTextField.backgroundColor = UIColor(named: "background")
        
        // LabelAboveTextField
        themeOptionsLabel.translatesAutoresizingMaskIntoConstraints = false
        themeOptionsLabel.textAlignment = .left
        themeOptionsLabel.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        themeOptionsLabel.adjustsFontForContentSizeCategory = true
        themeOptionsLabel.numberOfLines = 0
        themeOptionsLabel.text = "Escolha seu tema preferido:"
        
        // ButtonContinue
        buttonContinue.translatesAutoresizingMaskIntoConstraints = false
        buttonContinue.setTitle("Continuar", for: .normal)
        buttonContinue.setTitleColor(UIColor(named: "background"), for: .normal)
        buttonContinue.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        buttonContinue.backgroundColor = UIColor(named: "primaryAccentColor")
        buttonContinue.layer.cornerRadius = 20
        buttonContinue.addTarget(self, action: #selector(continueButtonTapped), for: .touchUpInside)
        
        // ButtonSkip
        buttonSkip.translatesAutoresizingMaskIntoConstraints = false
        buttonSkip.setTitle("Pular por agora", for: .normal)
        buttonSkip.setTitleColor(UIColor.systemGray4, for: .normal)
        buttonSkip.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        buttonSkip.addTarget(self, action: #selector(skipButtonTapped), for: .touchUpInside)
    }
    
    private func layout() {
        view.addSubview(titleLabel)
        view.addSubview(labelAboveTextField)
        view.addSubview(nameTextField)
        view.addSubview(themeOptionsLabel)
        view.addSubview(stackButtonsView)
        view.addSubview(buttonContinue)
        view.addSubview(buttonSkip)
        
        NSLayoutConstraint.activate([
            // TitleLabel
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: titleLabel.trailingAnchor, multiplier: 2),
            
            // LabelAboveTextField
            labelAboveTextField.topAnchor.constraint(equalToSystemSpacingBelow: titleLabel.bottomAnchor, multiplier: 8),
            labelAboveTextField.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 4),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: labelAboveTextField.trailingAnchor, multiplier: 4),
            
            // NameTextField
            nameTextField.topAnchor.constraint(equalToSystemSpacingBelow: labelAboveTextField.bottomAnchor, multiplier: 1),
            nameTextField.leadingAnchor.constraint(equalTo: labelAboveTextField.leadingAnchor),
            nameTextField.trailingAnchor.constraint(equalTo: labelAboveTextField.trailingAnchor),
            nameTextField.heightAnchor.constraint(equalToConstant: 70),
            
            // ThemeOptionsLabel
            themeOptionsLabel.topAnchor.constraint(equalToSystemSpacingBelow: nameTextField.bottomAnchor, multiplier: 6),
            themeOptionsLabel.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
            themeOptionsLabel.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor),
            
            // StackButtonsView
            stackButtonsView.topAnchor.constraint(equalToSystemSpacingBelow: themeOptionsLabel.bottomAnchor, multiplier: 1),
            stackButtonsView.leadingAnchor.constraint(equalTo: themeOptionsLabel.leadingAnchor),
            stackButtonsView.trailingAnchor.constraint(equalTo: themeOptionsLabel.trailingAnchor),
            stackButtonsView.heightAnchor.constraint(equalToConstant: 120),
            
            // ButtonContinue
            buttonContinue.topAnchor.constraint(equalToSystemSpacingBelow: stackButtonsView.bottomAnchor, multiplier: 8),
            buttonContinue.leadingAnchor.constraint(equalTo: stackButtonsView.leadingAnchor),
            buttonContinue.trailingAnchor.constraint(equalTo: stackButtonsView.trailingAnchor),
            buttonContinue.heightAnchor.constraint(equalToConstant: 80),
            
            // ButtonSkipo
            buttonSkip.topAnchor.constraint(equalToSystemSpacingBelow: buttonContinue.bottomAnchor, multiplier: 2),
            buttonSkip.leadingAnchor.constraint(equalTo: buttonContinue.leadingAnchor),
            buttonSkip.trailingAnchor.constraint(equalTo: buttonContinue.trailingAnchor),
        ])
    }
    
    private func createVerticalDivider() -> UIView {
        let divider = UIView()
            divider.translatesAutoresizingMaskIntoConstraints = false
            divider.backgroundColor = .systemGray4

            // Criamos um container para o divider com paddings verticais
            let container = UIView()
            container.translatesAutoresizingMaskIntoConstraints = false
            container.addSubview(divider)

            NSLayoutConstraint.activate([
                divider.widthAnchor.constraint(equalToConstant: 1),
                divider.topAnchor.constraint(equalTo: container.topAnchor, constant: 20),
                divider.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -20),
                divider.centerXAnchor.constraint(equalTo: container.centerXAnchor),
                container.widthAnchor.constraint(equalToConstant: 1)
            ])

            return container
    }
}


// MARK: - Actions
extension PageOnboarding2 {
    private func selectTheme(_ selectedButton: ThemeButton) {
        let buttons = [lightButton, darkButton, autoButton]
        
        for button in buttons {
            let isSelected = (button == selectedButton)
            button.setSelected(isSelected)
        }
    }
    
    @objc func lightSelected() {
        selectTheme(lightButton)
        overrideUserInterfaceStyle = .light
    }
    @objc func darkSelected() {
        selectTheme(darkButton)
        overrideUserInterfaceStyle = .dark
    }
    @objc func autoSelected() {
        selectTheme(autoButton)
        overrideUserInterfaceStyle = .unspecified
    }
    
    @objc func continueButtonTapped() {
        
    }
    @objc func skipButtonTapped(_ sender: UIButton) {
        delegate?.didFinishOnboarding()
    }
}
