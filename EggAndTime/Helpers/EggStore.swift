//
//  EggService.swift
//  EggAndTime
//
//  Created by Сашок on 22.04.2022.
//

import Foundation

class EggStore {
    static let eggs = [
        Egg(name: "Куриное", imageName: "EggPlaceholder"),
        Egg(name: "Утиное", imageName: "EggPlaceholder"),
        Egg(name: "Гусиное", imageName: "EggPlaceholder"),
        Egg(name: "Страусиное", imageName: "EggPlaceholder"),
        Egg(name: "Перепелиное", imageName: "EggPlaceholder")
    ]
    
    static let doneness = [
        "Куриное" : [
            Doneness(name: "Вкрутую", imageName: "EggPlaceholder", cookingTime: 10),
            Doneness(name: "Всмятку", imageName: "EggPlaceholder", cookingTime: 20),
            Doneness(name: "Пашот", imageName: "EggPlaceholder", cookingTime: 30)
        ],
        
        "Утиное" : [
            Doneness(name: "Вкрутую", imageName: "EggPlaceholder", cookingTime: 10),
            Doneness(name: "Всмятку", imageName: "EggPlaceholder", cookingTime: 20),
            Doneness(name: "Пашот", imageName: "EggPlaceholder", cookingTime: 30)
        ],
        
        "Гусиное" : [
            Doneness(name: "Вкрутую", imageName: "EggPlaceholder", cookingTime: 10),
            Doneness(name: "Всмятку", imageName: "EggPlaceholder", cookingTime: 20),
            Doneness(name: "Пашот", imageName: "EggPlaceholder", cookingTime: 30)
        ],
        
        "Страусиное" : [
            Doneness(name: "Вкрутую", imageName: "EggPlaceholder", cookingTime: 10),
            Doneness(name: "Всмятку", imageName: "EggPlaceholder", cookingTime: 20),
            Doneness(name: "Пашот", imageName: "EggPlaceholder", cookingTime: 30)
        ],
        
        "Перепелиное" : [
            Doneness(name: "Вкрутую", imageName: "EggPlaceholder", cookingTime: 10),
            Doneness(name: "Всмятку", imageName: "EggPlaceholder", cookingTime: 20),
            Doneness(name: "Пашот", imageName: "EggPlaceholder", cookingTime: 30)
        ]
    ]
}
