//
//  GameViewModel.swift
//  BrainStress
//
//  Created by Robert Sandru on 07/10/2020.
//

import Foundation
import Combine

enum GameState {
    case warmUp
    case playing
    case paused
    case feedback(correct: Bool)
    case end(win: Bool)
}

class GameModel: ObservableObject {
    
    // Quiz
    
    @Published var quiz: Quiz
    @Published var quizItem: QuizItem?
    
    // Current Game State
    
    @Published var gameState: GameState = .warmUp
    
    // Timer Configurations
    
    @Published var timeRemainingQuizItem: Int = 5
    @Published var timeRemainingFeedback: Int = 2
    @Published var timeRemainingFoWarmUp: Int = 0
    
    let timer = Timer.publish(every: 1, on: .main, in: .default).autoconnect()
    var timerCancellables: Set<AnyCancellable> = Set()
    
    init(quiz: Quiz) {
        self.quiz = quiz
        
        timerConfig()
    }
    
}

// MARK: Configs

extension GameModel {
    
    /// This function is the placeholder for all the time-based operations.
    func timerConfig() {
        timer
            .handleEvents(receiveOutput: { [weak self] _ in
                guard let self = self else { return }
                switch self.gameState {
                case .warmUp: self.timerRanWarmup()
                case .playing: self.timerRanPlaying()
                case .paused: self.timerRanPaused()
                case .feedback(_): self.timerRanFeedback()
                default: break
                }
            })
            .sink { _ in }
            .store(in: &timerCancellables)
    }
    
    func timerRanWarmup() {
        guard timeRemainingFoWarmUp > 0 else {
            // Out of warmup, play..
            quizStart()
            return
        }
        timeRemainingFoWarmUp -= 1
    }
    
    func timerRanPlaying() {
        guard timeRemainingQuizItem > 0 else {
            itemRemove()
            itemLoad()
            return
        }
        timeRemainingQuizItem -= 1
    }
    
    func timerRanPaused() {}
    
    func timerRanFeedback() {}
}

// MARK: Quiz Functionalities

extension GameModel {
    
    func quizStart() {
        itemLoad()
        gameState = .playing
    }
    
    func quizEnd() {
        gameState = .end(win: true)
    }
    
    func quizPause() {
        gameState = .paused
    }
    
    func itemLoad() {
        guard let firstItem = quiz.items.first else {
            // No first item, quiz end..
            quizEnd()
            return
        }
        quizItem = firstItem
        timeRemainingQuizItem = Int(quizItem?.time.time[quiz.difficulty] ?? 5)
    }
    
    func itemRemove() {
        guard quiz.items.first != nil else { return }
        quiz.items.removeFirst()
    }
    
    func itemCheck() {}
}
