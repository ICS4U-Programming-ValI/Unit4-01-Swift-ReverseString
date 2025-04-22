import Foundation

/**
 * Created by Val I on 2025-04-21
 * Version 1.0
 * Copyright (c) 2025 Val I. All rights reserved.
 *
 * The ReverseString program reads a string from a file
 * and reverses the string using recursion.
 *
 */

/**
 * This function reverses a string using recursion.
 *
 * - Parameter str: The string to be reversed.
 * - Returns: The reversed string.
 */
func reverseString(_ str: String) -> String {
    if str.isEmpty || str.count <= 1 {
        return str
    }
    let firstCharacter = str.first!
    let remainingString = String(str.dropFirst())
    return reverseString(remainingString) + String(firstCharacter)
}

// File paths
let inputFilePath = "./input.txt"
let outputFilePath = "./output.txt"

// Open the input file for reading
guard let input = FileHandle(forReadingAtPath: inputFilePath) else {
    print("Error: can't find input file")
    exit(1)
}

// Open the output file for writing
guard let output = FileHandle(forWritingAtPath: outputFilePath) else {
    print("Error: can't open output file")
    exit(1)
}

// Read the contents of the input file
let inputData = input.readDataToEndOfFile()

// Convert the data to a string
guard let inputString = String(data: inputData, encoding: .utf8) else {
    print("Error: can't convert input data to string")
    exit(1)
}

// Split the string into lines
let inputLines = inputString.components(separatedBy: .newlines)

// Process each line
for line in inputLines {
    if !line.isEmpty {
        // Reverse the string
        let reversedString = reverseString(line)

        // Write the reversed string to the output file
        let message = "Reversed String: \(reversedString)\n"
        output.write(message.data(using: .utf8)!)
    }
}

// Close the input and output files
input.closeFile()
output.closeFile()