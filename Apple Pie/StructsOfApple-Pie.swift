//
//  StructsOfApple-Pie.swift
//  Apple Pie
//
//  Created by Mikhail Chibrin on 23.08.2021.
//

struct Game {
    var word : String
    var incorrectMovesRemaining : Int
    fileprivate var listOfCharacters = Array<Character>()
    
    init(word: String, incorrectMovesRemaining: Int) {
        self.word = word
        self.incorrectMovesRemaining = incorrectMovesRemaining
    }
    
    var guessedWord: String {
        var wordToShow: String = ""
        for letter in word {
            if listOfCharacters.contains(Character(letter.lowercased())) {
                wordToShow += String(letter)
            } else {
                wordToShow += "_"
            }
        }
        return wordToShow
    }
    
    mutating func letterGuees(letter:Character) {
        let lowercasedLetter = letter.lowercased()
        listOfCharacters += lowercasedLetter
        if !word.lowercased().contains(lowercasedLetter) {
            incorrectMovesRemaining -= 1
        }
    }
}
