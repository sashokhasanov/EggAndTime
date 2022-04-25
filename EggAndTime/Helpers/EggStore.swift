//
//  EggService.swift
//  EggAndTime
//
//  Created by Сашок on 22.04.2022.
//

class EggStore {
    static let eggs = [
        Egg(name: "Куриное", imageName: "Chicken"),
        Egg(name: "Утиное", imageName: "Duck"),
        Egg(name: "Гусиное", imageName: "Goose"),
        Egg(name: "Перепелиное", imageName: "Quail"),
        Egg(name: "Страусиное", imageName: "Ostrich")
    ]
    
    static let doneness = [
        "Куриное" : [
            Doneness(name: "Всмятку", imageName: "D1", cookingTime: 180),
            Doneness(name: "В мешочек", imageName: "D2", cookingTime: 300),
            Doneness(name: "Жидкий желток", imageName: "D3", cookingTime: 360),
            Doneness(name: "Золотая середина", imageName: "D4", cookingTime: 420),
            Doneness(name: "Почти вкрутую", imageName: "D5", cookingTime: 480),
            Doneness(name: "Вкрутую", imageName: "D6", cookingTime: 540)
        ],
        
        "Утиное" : [
            Doneness(name: "Всмятку", imageName: "D1", cookingTime: 360),
            Doneness(name: "В мешочек", imageName: "D2", cookingTime: 420),
            Doneness(name: "Жидкий желток", imageName: "D3", cookingTime: 480),
            Doneness(name: "Золотая середина", imageName: "D4", cookingTime: 510),
            Doneness(name: "Почти вкрутую", imageName: "D5", cookingTime: 560),
            Doneness(name: "Вкрутую", imageName: "D6", cookingTime: 720)
        ],
        
        "Гусиное" : [
            Doneness(name: "Всмятку", imageName: "D1", cookingTime: 300),
            Doneness(name: "В мешочек", imageName: "D2", cookingTime: 600),
            Doneness(name: "Жидкий желток", imageName: "D3", cookingTime: 840),
            Doneness(name: "Золотая середина", imageName: "D4", cookingTime: 1020),
            Doneness(name: "Почти вкрутую", imageName: "D5", cookingTime: 1200),
            Doneness(name: "Вкрутую", imageName: "D6", cookingTime: 1500)
        ],
        
        "Перепелиное" : [
            Doneness(name: "Всмятку", imageName: "D1", cookingTime: 60),
            Doneness(name: "В мешочек", imageName: "D2", cookingTime: 120),
            Doneness(name: "Жидкий желток", imageName: "D3", cookingTime: 180),
            Doneness(name: "Золотая середина", imageName: "D4", cookingTime: 210),
            Doneness(name: "Почти вкрутую", imageName: "D5", cookingTime: 240),
            Doneness(name: "Вкрутую", imageName: "D6", cookingTime: 300)
        ],
        
        "Страусиное" : [
            Doneness(name: "Всмятку", imageName: "D1", cookingTime: 2700),
            Doneness(name: "В мешочек", imageName: "D2", cookingTime: 3240),
            Doneness(name: "Жидкий желток", imageName: "D3", cookingTime: 3780),
            Doneness(name: "Золотая середина", imageName: "D4", cookingTime: 4320),
            Doneness(name: "Почти вкрутую", imageName: "D5", cookingTime: 4860),
            Doneness(name: "Вкрутую", imageName: "D6", cookingTime: 5400)
        ]
    ]
}
