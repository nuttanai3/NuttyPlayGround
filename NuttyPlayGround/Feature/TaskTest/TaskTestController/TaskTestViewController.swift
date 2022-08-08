//
//  TaskTestViewController.swift
//  NuttyPlayGround
//
//  Created by Nuttanai on 8/8/2565 BE.
//  Copyright (c) 2565 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class TaskTestViewController: UIViewController {
    var interactor: TaskTestBusinessLogic?
    var router: (TaskTestRoutingLogic & TaskTestDataPassing)?
    
    // MARK: @IBOutlet
    
    // MARK: Data
    struct NewsItem: Decodable {
        let id: Int
        let title: String
        let url: URL
    }
    
    struct HighScore: Decodable {
        let name: String
        let score: Int
    }
    
    struct Message: Decodable, Identifiable {
        let id: Int
        let from: String
        let text: String
    }
    
    var messages = [Message]()
    
    // MARK: View lifecycle
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        doSomething()
    }
    
    private func setupView() {
        // set view something
    }
    
    // MARK: Do something
    func doSomething() {
        let request = TaskTest.Something.Request()
        interactor?.doSomething(request: request)
    }
    
    func fetchUpdates() async {
        let newsTask = Task { () -> [NewsItem] in
            let url = URL(string: "https://hws.dev/headlines.json")!
            let (data, _) = try await URLSession.shared.data(from: url)
            return try JSONDecoder().decode([NewsItem].self, from: data)
        }
        
        let highScoreTask = Task { () -> [HighScore] in
            let url = URL(string: "https://hws.dev/scores.json")!
            let (data, _) = try await URLSession.shared.data(from: url)
            return try JSONDecoder().decode([HighScore].self, from: data)
        }
        
        do {
            let news = try await newsTask.value
            let highScores = try await highScoreTask.value
            print("Latest news loaded with \(news.count) items.")
            
            if let topScore = highScores.first {
                print("\(topScore.name) has the highest score with \(topScore.score), out of \(highScores.count) total results.")
            }
        } catch {
            print("There was an error loading user data.")
        }
    }
    
    func loadMessages() async {
        do {
            let url = URL(string: "https://hws.dev/messages.json")!
            let (data, _) = try await URLSession.shared.data(from: url)
            messages = try JSONDecoder().decode([Message].self, from: data)
        } catch {
            messages = [
                Message(id: 0, from: "Failed to load inbox.", text: "Please try again later.")
            ]
        }
    }
    
    @IBAction func closeAction(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func clickMeAction(_ sender: UIButton) {
        Task{
            await fetchUpdates()
        }
        if messages.isEmpty {
            print("message null")
            Task{
                await loadMessages()
            }
        } else {
            for (index, messageTemp) in messages.enumerated() {
                print("message(\(index)): \(messageTemp.text)")
            }
        }
    }
}

extension TaskTestViewController : TaskTestDisplayLogic {
    func displaySomethingOnSuccess(viewModel: TaskTest.Something.ViewModel) {
        
    }
    
    func displayErrorMessage(errorMessage: String) {
        
    }
}

// MARK: Setup & Configuration
extension TaskTestViewController {
    private func configure() {
        TaskTestConfiguration.shared.configure(self)
    }
}
