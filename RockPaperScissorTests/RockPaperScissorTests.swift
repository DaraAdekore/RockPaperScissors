//
//  RockPaperScissorTests.swift
//  RockPaperScissorTests
//
//  Created by Dara Adekore on 2023-04-22.
//

import XCTest
@testable import RockPaperScissor
import SwiftUI

final class RockPaperScissorTests: XCTestCase {

    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testScoreIncreasesWhenUserWins() {
            // Given
            let game = ContentView()
            game.gameStart = true
            game.userChoice = .rock
            
            // When
        print("User choice : \(game.userChoice)")
            game.winOrLose(choice: 1)
            
            // Then
            XCTAssertEqual(game.score, 1)
        }

        func testScoreDoesNotIncreaseWhenUserLoses() {
            // Given
            let game = ContentView()
            game.gameStart = true
            game.userChoice = .scissors
            game.correctAnswer = .rock
            
            // When
            game.winOrLose(choice: 1)
            
            // Then
            XCTAssertEqual(game.score, 0)
        }
        func testTimerStartsWhenGameStarts() {
            // Given
            let game = ContentView()
            
            // When
            game.startTimer()
            
            // Then
            XCTAssertNotNil(game.timer)
        }

        func testTimerStopsWhenGameEnds() {
            // Given
            let game = ContentView()
            game.gameStart = true
            game.remainingSeconds = 0
            
            // Then
            XCTAssertNil(game.timer)
        }
}
