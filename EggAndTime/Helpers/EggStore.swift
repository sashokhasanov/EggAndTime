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
            Doneness(name: "Всмятку", imageName: "D1", cookingTime: 180),
            Doneness(name: "В мешочек", imageName: "D2", cookingTime: 300),
            Doneness(name: "Жидкий желток", imageName: "D3", cookingTime: 360),
            Doneness(name: "Золотая середина", imageName: "D4", cookingTime: 420),
            Doneness(name: "Почти вкрутую", imageName: "D5", cookingTime: 480),
            Doneness(name: "Вкрутую", imageName: "D6", cookingTime: 540)
        ],
        
        "Гусиное" : [
            Doneness(name: "Всмятку", imageName: "D1", cookingTime: 180),
            Doneness(name: "В мешочек", imageName: "D2", cookingTime: 300),
            Doneness(name: "Жидкий желток", imageName: "D3", cookingTime: 360),
            Doneness(name: "Золотая середина", imageName: "D4", cookingTime: 420),
            Doneness(name: "Почти вкрутую", imageName: "D5", cookingTime: 480),
            Doneness(name: "Вкрутую", imageName: "D6", cookingTime: 540)
        ],
        
        "Перепелиное" : [
            Doneness(name: "Всмятку", imageName: "D1", cookingTime: 180),
            Doneness(name: "В мешочек", imageName: "D2", cookingTime: 300),
            Doneness(name: "Жидкий желток", imageName: "D3", cookingTime: 360),
            Doneness(name: "Золотая середина", imageName: "D4", cookingTime: 420),
            Doneness(name: "Почти вкрутую", imageName: "D5", cookingTime: 480),
            Doneness(name: "Вкрутую", imageName: "D6", cookingTime: 540)
        ],
        
        "Страусиное" : [
            Doneness(name: "Всмятку", imageName: "D1", cookingTime: 180),
            Doneness(name: "В мешочек", imageName: "D2", cookingTime: 300),
            Doneness(name: "Жидкий желток", imageName: "D3", cookingTime: 360),
            Doneness(name: "Золотая середина", imageName: "D4", cookingTime: 420),
            Doneness(name: "Почти вкрутую", imageName: "D5", cookingTime: 480),
            Doneness(name: "Вкрутую", imageName: "D6", cookingTime: 540)
        ]
    ]
}
