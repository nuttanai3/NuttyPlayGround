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
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var taskTable: UITableView!
    
    // MARK: Data
    enum ButtonAction {
        case scoreAction
        case messageAction
        case printMessageTaskGroupAction
        case newsStoryAction
        case none
    }
    
    var dataArray = [String]()
    var buttonAction: ButtonAction = .none
    
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
    
    struct NewsStory: Identifiable, Decodable {
        let id: Int
        let title: String
        let strap: String
        let url: URL
    }
    
    var stories = [NewsStory]()
    
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
        taskTable.register(UINib(nibName: "TaskDetailTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "TaskDetailTableViewCell")
    }
    
    @IBAction func closeAction(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func scoreAction(_ sender: UIButton) {
        Task{
            await fetchUpdates()
        }
    }
    
    @IBAction func messageAction(_ sender: UIButton) {
        if messages.isEmpty {
            print("message null")
            Task{
                await loadMessages()
            }
        } else {
            var dataTemp = [String]()
            for (index, messageTemp) in messages.enumerated() {
                print("message(\(index)): \(messageTemp.text)")
                dataTemp.append(messageTemp.text)
            }
            dataArray = dataTemp
            headerLabel.text = dataArray.first ?? ""
            taskTable.reloadData()
        }
    }
    
    @IBAction func printMessageTaskGroupAction(_ sender: UIButton) {
        Task{
            await printMessage()
        }
    }
    
    @IBAction func newsStoryAction(_ sender: UIButton) {
        Task {
            stories = await loadStories() ?? [NewsStory]()
            var dataTemp = [String]()
            for (index, storie) in stories.enumerated() {
                print("storie(\(index)): \(storie.title)")
                dataTemp.append(storie.title)
            }
            dataArray = dataTemp
            headerLabel.text = dataArray.first ?? ""
            taskTable.reloadData()
        }
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
            var dataTemp = [String]()
            for newsItem in news {
                dataTemp.append(newsItem.title)
            }
            dataArray = dataTemp
            if let topScore = highScores.first {
                print("\(topScore.name) has the highest score with \(topScore.score), out of \(highScores.count) total results.")
                headerLabel.text = "\(topScore.name) has the highest score with \(topScore.score), out of \(highScores.count) total results."
            }
            taskTable.reloadData()
        } catch {
            print("There was an error loading user data.")
        }
    }
    
    func loadMessages() async {
        do {
            let url = URL(string: "https://hws.dev/messages.json")!
            let (data, _) = try await URLSession.shared.data(from: url)
            messages = try JSONDecoder().decode([Message].self, from: data)
            messageAction(UIButton())
        } catch {
            messages = [
                Message(id: 0, from: "Failed to load inbox.", text: "Please try again later.")
            ]
        }
    }
    
    func printMessage() async {
        let string = await withTaskGroup(of: String.self) { group -> String in
            group.addTask { "Hello" }
            group.addTask { "From" }
            group.addTask { "A" }
            group.addTask { "Task" }
            group.addTask { "Group" }
            
            var collected = [String]()
            
            for await value in group {
                collected.append(value)
            }
            
            return collected.joined(separator: " ")
        }
        dataArray = [string]
        headerLabel.text = string
        taskTable.reloadData()
        print(string)
    }
    
    func loadStories() async -> [NewsStory]? {
        do {
            return try await withThrowingTaskGroup(of: [NewsStory].self) { group -> [NewsStory] in
                for i in 1...5 {
                    group.addTask {
                        let url = URL(string: "https://hws.dev/news-\(i).json")!
                        let (data, _) = try await URLSession.shared.data(from: url)
                        return try JSONDecoder().decode([NewsStory].self, from: data)
                    }
                }
                
                let allStories = try await group.reduce(into: [NewsStory]()) { $0 += $1 }
                return allStories.sorted { $0.id > $1.id }
            }
        } catch {
            print("Failed to load stories")
            return nil
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

extension TaskTestViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TaskDetailTableViewCell") as? TaskDetailTableViewCell , dataArray.count > indexPath.row{
            cell.setCell(text1: dataArray[indexPath.row], text2: "")
            return cell
        }
        return UITableViewCell()
    }
    
    
}
