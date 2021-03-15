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
    var progressBarView = UIView()
        
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
        configureVStackView()
        configureHStackView()
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
        horizontalStackView.distribution = .fillEqually
        
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
        //UIProgressBar must be nested in ProgressBarView because it was being stretched to fill by the vertical stack.
        //Using ProgressBarView, that gets stretched to fill instead and UIProgress bar can have its constraint inside it.
        
        let progressBar = UIProgressView()
        progressBarView.addSubview(progressBar)
        progressBar.progress = 0.5 // Placeholder
        //progressBar.contentMode = .scaleAspectFill
        
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            progressBar.heightAnchor.constraint(equalToConstant: 10),
            progressBar.centerYAnchor.constraint(equalTo: progressBarView.centerYAnchor),
            progressBar.leadingAnchor.constraint(equalTo: progressBarView.leadingAnchor),
            progressBar.trailingAnchor.constraint(equalTo: progressBarView.trailingAnchor)
        ])
        
    }
    
    func configureVStackView() {
        view.addSubview(verticalStackView)
        
        verticalStackView.axis = .vertical
        verticalStackView.alignment = .fill
        verticalStackView.distribution = .fillEqually
        verticalStackView.backgroundColor = .systemYellow //for debug
        
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
        verticalStackView.addArrangedSubview(progressBarView)
    }
}
