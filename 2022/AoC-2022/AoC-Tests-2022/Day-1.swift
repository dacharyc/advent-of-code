//
//  Day-1.swift
//  AoC-Tests-2022
//
//  Created by Dachary Carey on 12/2/22.
//

import Foundation
import RealmSwift
import XCTest

class Elf: Object {
    @Persisted var id = UUID()
    @Persisted var name = ""
    @Persisted var snacks: Map<String, Int>
    @Persisted var totalCalorieCount = 0
}

let elfNames = [
    "Link", "Snap", "Crackle", "Pop", "Elfo", "Celeborn", "Thranduil", "Aegnor", "Kreacher", "Gimbel", "Winky", "Buddy", "Dobby", "Bernard", "Hermey", "Bing", "Hoppity", "Zippity", "Arwen", "Elrond", "Legolas"
]

let snackNames = [
    "Reese's Peanut Butter Cups", "Milky Way", "Butterfinger", "100 Grand", "Ferrero Rocher", "Doritos", "Ritz Crackers", "UTZ Cheese Balls", "Chocolate Chip Coookies", "Oatmeal Cream Pies", "Nutter Butter", "Sun Chips", "Bugels", "Cashews"]

final class Day_1: XCTestCase {
    func testExample() throws {
        let identifier = "DayOneRealm"
        let config = Realm.Configuration(
            inMemoryIdentifier: identifier)
        let realm = try! Realm(configuration: config)
        
        let fileName: String = "day-1-challenge-1-input.txt"
        let input: [String] = loadInputAsStrings(fileName: fileName)
        
        var currentElf = Elf(value: ["name": elfNames.randomElement()!])
        
        for calorieCount in input {
            if calorieCount != "" {
                try! realm.write {
                    currentElf.snacks.setValue(Int(calorieCount), forKey: snackNames.randomElement()!)
                    currentElf.totalCalorieCount += Int(calorieCount)!
                }
            } else {
                try! realm.write {
                    currentElf = Elf(value: ["name": elfNames.randomElement()!])
                    realm.add(currentElf)
                }
            }
        }
        let elves = realm.objects(Elf.self)
        var highestCalorieCountElf = elves.first!
        for elf in elves {
            for snack in elf.snacks {
                print("\(elf.name) has a \(snack.key) worth \(snack.value) calories")
            }
            print("\(elf.name) is carrying \(elf.totalCalorieCount) calories worth of food")
            if elf.totalCalorieCount >= highestCalorieCountElf.totalCalorieCount {
                highestCalorieCountElf = elf
            }
            print("The Elf carrying the most calories is \(highestCalorieCountElf.name) with \(highestCalorieCountElf.totalCalorieCount)")
        }
    }
}
