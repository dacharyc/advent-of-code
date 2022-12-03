//
//  Helpers.swift
//  AoC-Tests-2022
//
//  Created by Dachary Carey on 12/2/22.
//

import Foundation

let baseInputPath: String = "/Users/dachary/workspace/advent-of-code/2022/AoC-2022/AoC-Tests-2022/Inputs/"

func loadInputAsStrings(fileName: String, debugPrint: Bool = false) -> [String] {
    let filePath = baseInputPath + fileName
    do {
        let data = try String(contentsOfFile: filePath, encoding: .utf8)
        let lines = data.components(separatedBy: .newlines)
        if debugPrint { print(lines) }
        return lines
    } catch {
        print(error)
        return []
    }
}
