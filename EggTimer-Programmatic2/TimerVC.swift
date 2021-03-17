//
//  TimerVC.swift
//  EggTimer-Programmatic2
//
//  Created by Lorenzo Zemp on 12/03/21.
//

import UIKit
import AVFoundation

class TimerVC: UIViewController {
    
    var audioPlayer = AVAudioPlayer()

    var titleLabel = UILabel()
    var horizontalStackView = UIStackView()
    var verticalStackView = UIStackView()
    var progressBarView = UIView()
    var progressBar = UIProgressView()
        
    //Gesture Recognizers
    var gestureRecognizerSoft = UITapGestureRecognizer()
    var gestureRecognizerMed = UITapGestureRecognizer()
    var gestureRecognizerHard = UITapGestureRecognizer()
    
    var timer: Timer?
    var timeLeft = 60
    var timePassed = 0
    var progress: Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureGestureRecognizers()
        configureUI()
    }
    
    func configureUI() {
        view.backgroundColor = .systemOrange
        
        //confige views
        configureTitleLabel()
        configureProgressView()
        
        //config stack views
        configureVStackView()
        configureHStackView()
    }
    
    @objc func eggSoftTapped() {
        titleLabel.text = "Soft Boiled Egg"
        timeLeft = 15
        timePassed = 0
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1,
                                     target: self,
                                     selector: #selector(startTimer),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    @objc func eggMedTapped() {
        titleLabel.text = "Medium Boiled Egg"
        timeLeft = 30
        timePassed = 0
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1,
                                     target: self,
                                     selector: #selector(startTimer),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    @objc func eggHardTapped() {
        titleLabel.text = "Hard Boiled Egg"
        timeLeft = 60
        timePassed = 0
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1,
                                     target: self,
                                     selector: #selector(startTimer),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    @objc func startTimer() {
        progress = 0.0
        
        if (timePassed < timeLeft) {
            timePassed += 1
            
            progress = Float(timePassed) / Float(timeLeft)
            print(progress)
            progressBar.progress = progress
        } else {
            titleLabel.text = "How would you like your eggs?"
            timer?.invalidate()
            timer = nil
            progressBar.progress = 0.0
            timePassed = 0
            playAudio()
        }
    }
    
    func playAudio(){
        let dirURL = Bundle.main.url(forResource: "ding", withExtension: ".wav")
        audioPlayer = try! AVAudioPlayer.init(contentsOf: dirURL!)
        audioPlayer.play()
    }
    
    func configureGestureRecognizers() {
        gestureRecognizerSoft = UITapGestureRecognizer(target: self, action: #selector(eggSoftTapped))
        gestureRecognizerSoft.numberOfTapsRequired = 1
        
        gestureRecognizerMed = UITapGestureRecognizer(target: self, action: #selector(eggMedTapped))
        gestureRecognizerMed.numberOfTapsRequired = 1
        
        gestureRecognizerHard = UITapGestureRecognizer(target: self, action: #selector(eggHardTapped))
        gestureRecognizerHard.numberOfTapsRequired = 1
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
        softEggIV.isUserInteractionEnabled = true
        softEggIV.addGestureRecognizer(gestureRecognizerSoft)
        
        let mediumEggIV = UIImageView(image: #imageLiteral(resourceName: "medium_egg"))
        mediumEggIV.contentMode = .scaleAspectFit
        mediumEggIV.isUserInteractionEnabled = true
        mediumEggIV.addGestureRecognizer(gestureRecognizerMed)
        
        let hardEggIV = UIImageView(image: #imageLiteral(resourceName: "hard_egg"))
        hardEggIV.contentMode = .scaleAspectFit
        hardEggIV.isUserInteractionEnabled = true
        hardEggIV.addGestureRecognizer(gestureRecognizerHard)
    
        //ADD ARRANGED SUBVIEW FOR ADDING TO STACK VIEWS.
        horizontalStackView.addArrangedSubview(softEggIV)
        horizontalStackView.addArrangedSubview(mediumEggIV)
        horizontalStackView.addArrangedSubview(hardEggIV)
    }
    
    func configureProgressView() {
        //UIProgressBar must be nested in ProgressBarView because it was being stretched to fill by the vertical stack.
        //Using ProgressBarView, that gets stretched to fill instead and UIProgress bar can have its constraint inside it.
        
        progressBarView.addSubview(progressBar)
        progressBar.tintColor = .systemYellow
        
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
        
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            verticalStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            verticalStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            verticalStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
        
        //Add in order
        verticalStackView.addArrangedSubview(titleLabel)
        verticalStackView.addArrangedSubview(horizontalStackView)
        verticalStackView.addArrangedSubview(progressBarView)
    }
}
