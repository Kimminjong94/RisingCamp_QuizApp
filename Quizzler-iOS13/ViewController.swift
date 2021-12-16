//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var backGroundLabel: UIImageView!
    
    var quizBrain = QuizBrain()
    
    let urlString = "https://upload.wikimedia.org/wikipedia/commons/b/b3/Sanfran-night.jpg"
    
//    private let imageView: UIImageView = {
//       let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
//        imageView.contentMode = .scaleAspectFill
//        return imageView
//    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        view.addSubview(imageView)
//        imageView.center = view.center
        updateUI()
        fetchImage({ (data) in
            print(data)
        })
        
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        
        let userGotItRight = quizBrain.checkAnswer(userAnswer: userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
    }
    
    
    private func fetchImage(_ completion: @escaping (Result<(Data, URLResponse), Error>) -> Void) {

        let getDataTask = URLSession.shared.dataTask(with: URL(string: urlString)!) {data, response, error in
            if let error = error {
              completion(.failure(error))
            } else if let data = data, let response = response {
              completion(.success((data, response)))
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                let image = UIImage(data: data!)
                self.backGroundLabel.image = image
            }
        }
        getDataTask.resume()
    }

}


























