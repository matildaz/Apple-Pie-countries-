//
//  ViewController.swift
//  Apple Pie
//
//  Created by Mikhail Chibrin on 23.08.2021.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    //MARK: - Outlets
    
    @IBOutlet weak var treeImageView: UIImageView!
    @IBOutlet var letterButtons: [UIButton]!
    @IBOutlet weak var wordLabelView: UILabel!
    @IBOutlet weak var scoreLabelView: UILabel!
    
    
    
    //MARK: - Vars
    var currentGame: Game!
    var incorrectMovesAllowed = 7
    var listOfWords : Array<String> = ["Абхазия","Австралия","Австрия","Азербайджан","Албания","Алжир","Ангола","Андорра","Аргентина","Армения","Афганистан","Бангладеш","Барбадос","Бахрейн","Белиз","Белоруссия","Бельгия","Бенин","Болгария","Боливия","Босния и Герцеговина","Ботсвана","Бразилия","Бруней","Бурунди","Бутан","Вануату","Ватикан","Великобритания","Венгрия","Венесуэла","Восточный Тимор","Вьетнам","Габон","Гаити","Гайана","Гамбия","Гана","Гватемала","Гвинея","Германия","Гондурас","Палестина","Гренада","Греция","Грузия","Дания","Джибути","Доминика","Египет","Замбия","Зимбабве","Израиль","Индия","Индонезия","Иордания","Ирак","Иран","Ирландия","Исландия","Испания","Италия","Йемен","Казахстан","Камбоджа","Камерун","Канада","Катар","Кения","Кипр","Киргизия","Кирибати","Китай","Колумбия","Коморские Острова","Куба","Кувейт","Лаос","Латвия","Лесото","Либерия","Ливан","Ливия","Литва","Лихтенштейн","Люксембург","Маврикий","Мавритания","Мадагаскар","Малави","Малайзия","Мали","Мальдивские Острова","Мальта","Марокко","Маршалловы Острова","Мексика","Мозамбик","Молдавия","Монако","Монголия","Мьянма","Намибия","Науру","Непал","Нигер","Нигерия","Нидерланды","Никарагуа","Новая Зеландия","Норвегия","Оман","Пакистан","Палау","Панама","Парагвай","Перу","Польша","Португалия","Республика Конго","Республика Корея","Россия","Руанда","Румыния","Сальвадор","Самоа","Сенегал","Сербия","Сингапур","Сирия","Словакия","Сомали","Судан","Суринам","США","Таджикистан","Таиланд","Танзания","Того","Тонга","Тувалу","Тунис","Туркмения","Турция","Уганда","Узбекистан","Украина","Уругвай","Фиджи","Филиппины","Финляндия","Франция","Хорватия","Чад","Черногория","Чехия","Чили","Швейцария","Швеция","Эквадор","Эритрея","Эсватини","Эстония","Эфиопия","Ямайка","Япония"]
    var numberOfWonGames = 0
    var numberOfLostGames = 0
    
    //MARK: - Actions
    
    @IBAction func letterButtonGetPressed(_ sender: UIButton) {
        let letter = sender.title(for: .normal)!
        sender.isEnabled = false
        currentGame.letterGuees(letter: Character(letter))
        updateUI()
    }
    
    func newRounnd() {
        let newWord : String = listOfWords[Int.random(in: 0...165)]
        currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed)
        updateUI()
    }

    func updateUI() {
        let image = "Tree\(currentGame.incorrectMovesRemaining < 0 ? 0 : currentGame.incorrectMovesRemaining < 8 ? currentGame.incorrectMovesRemaining : 7)"
        treeImageView.image = UIImage(named: image)
        scoreLabelView.text = "Победы - \(numberOfWonGames)  Проигрыши - \(numberOfLostGames)"
        wordLabelView.text = currentGame.guessedWord
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRounnd()
    }
}

