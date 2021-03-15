//
//  TimerVC.swift
//  EggTimer-Programmatic2
//
//  Created by Lorenzo Zemp on 12/03/21.
//

import UIKit

class TimerVC: UIViewController {

    var titleLabel = UILabel()
    var horizontalStackView = UIStackView()
    var verticalStackView = UIStackView()
    var progressBar = UIProgressView()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    func configureUI() {
        view.backgroundColor = .systemBackground
        
        //confige views
        configureTitleLabel()
        configureProgressView()
        
        //config stack views
        configureHStackView()
        configureVStackView()
    }
    
    func configureTitleLabel(){
        titleLabel.text = "How would you like your eggs?"
        titleLabel.font = .systemFont(ofSize: 25, weight: .semibold)
        titleLabel.textAlignment = .center
        titleLabel.lineBreakMode = .byWordWrapping
    }
    
    func configureHStackView() {
        horizontalStackView.axis = .horizontal
        horizontalStackView.spacing = 5
        horizontalStackView.backgroundColor = .systemTeal
        horizontalStackView.distribution = .fillEqually
        
//        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            horizontalStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            horizontalStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            horizontalStackView.widthAnchor.constraint(equalToConstant: view.frame.width),
//            horizontalStackView.heightAnchor.constraint(equalToConstant: 300)
//        ])
        
        let softEggIV = UIImageView(image: #imageLiteral(resourceName: "soft_egg"))
        softEggIV.contentMode = .scaleAspectFit
        
        let mediumEggIV = UIImageView(image: #imageLiteral(resourceName: "medium_egg"))
        mediumEggIV.contentMode = .scaleAspectFit
        
        let hardEggIV = UIImageView(image: #imageLiteral(resourceName: "hard_egg"))
        hardEggIV.contentMode = .scaleAspectFit
        
        //ADD ARRANGED SUBVIEW FOR ADDING TO STACK VIEWS.
        horizontalStackView.addArrangedSubview(softEggIV)
        horizontalStackView.addArrangedSubview(mediumEggIV)
        horizontalStackView.addArrangedSubview(hardEggIV)
    }
    
    func configureProgressView() {
        progressBar.progress = 0.5
    }
    
    func configureVStackView() {
        view.addSubview(verticalStackView)
        
        verticalStackView.axis = .vertical
        verticalStackView.distribution = .fillEqually
        verticalStackView.backgroundColor = .systemYellow
        
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            verticalStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            verticalStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            verticalStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
        
        verticalStackView.addArrangedSubview(titleLabel)
        verticalStackView.addArrangedSubview(horizontalStackView)
        //add progress bar
        verticalStackView.addArrangedSubview(progressBar)
    }
}
