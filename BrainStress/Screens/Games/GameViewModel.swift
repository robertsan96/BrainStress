//
//  GameViewModel.swift
//  BrainStress
//
//  Created by Robert Sandru on 07/10/2020.
//

import Foundation
import Combine

class GameViewModel: ObservableObject {
    
    enum GameState: String {
        case running = "Running"
        case pause = "Pause"
        case failed = "Failed"
        case won = "Won"
        case showingCorrectAnswer = "Correct!"
        case showingFailedAnswer = "Faiiileed!"
    }
    
    @Published private(set) var quiz: Quiz
    @Published var activeQuizItem: QuizItem?
    
    @Published var gameState: GameState = .running
    
    @Published var runningTimeRemaining: Int = 2
    @Published var showingCorrectTimeRemaining: Int = 3
    @Published var showingFailedTimeRemaining: Int = 3
    
    @Published var userAnswer: String = ""
    
    @Published var quizTotalItems: Int = 0
    @Published var solvedItems: [QuizItem] = []
    @Published var failedItems: [QuizItem] = []
    
    private var cancellables: Set<AnyCancellable> = Set()
    
    let timer = Timer.publish(every: 1, on: .main, in: .default).autoconnect()
    
    init() {
        quiz = QuizData.Math.dummyLevel()
        setNextActiveItem()
        
        quizTotalItems = quiz.items.count
        
        timer
            .handleEvents(receiveOutput: { [weak self] output in
                guard let self = self else { return }
                switch self.gameState {
                case .running:
                    guard self.runningTimeRemaining > 0 else { self.eliminateFirstSetNext(); return }
                    self.runningTimeRemaining -= 1
                case .showingCorrectAnswer:
                        guard self.showingCorrectTimeRemaining > 0 else {
                            self.eliminateFirstSetNext();
                            self.gameState = .running
                            return
                        }
                        self.showingCorrectTimeRemaining -= 1
                case .showingFailedAnswer:
                        guard self.showingFailedTimeRemaining > 0 else {
                            self.eliminateFirstSetNext();
                            self.gameState = .running
                            return
                        }
                        self.showingFailedTimeRemaining -= 1
                default: break
                }
            })
            .sink { _ in }
            .store(in: &cancellables)
    }
    
    func setNextActiveItem() {
        guard let nextActiveItem = quiz.items.first else { quizEnd(); return }
        activeQuizItem = nextActiveItem
        runningTimeRemaining = Int(nextActiveItem.time.time[quiz.difficulty] ?? 0)
    }
    
    func eliminateFirstSetNext() {
        if quiz.items.first != nil {
            quiz.items.removeFirst()
            setNextActiveItem()
        } else {
            quizEnd()
        }
    }
    
    func userCommitAnswer() {
        guard let activeQuizItem = activeQuizItem else { return }
        switch activeQuizItem.answer.type {
        case .text:
            let activeQuizItemAnswer = activeQuizItem.answer.answer.first ?? ""
            if activeQuizItemAnswer == userAnswer {
                gameState = .showingCorrectAnswer
                showingCorrectTimeRemaining = 3
                solvedItems.append(activeQuizItem)
            } else {
                failedItems.append(activeQuizItem)
                gameState = .showingFailedAnswer
                showingFailedTimeRemaining = 3
            }
        default: break
        }
    }
    
    func quizEnd() {
        activeQuizItem = nil
        gameState = solvedItems.count == quizTotalItems ? .won : .failed
    }
}
