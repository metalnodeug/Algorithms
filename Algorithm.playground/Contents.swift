import UIKit
import Foundation


// Collections
// Create an array of all odd squares of 1-20 using map and filter

let oneToTen = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
var oddSquares = oneToTen.map { $0 * $0 }.filter { $0 % 2 != 0 }
print(oddSquares)


// Algorithm complexity sorting:

/*
- O (n!) - Complexité factorielle - O(n!) - Factorial Complexity
 Exemple: S'il y a 10 éléments dans le tableau, il faudra 3 628 800 étapes (10! Ou 10 * 9 * 8 * 7 * 6 * 5 * 4 * 3 * 2 * 1) pour trier le tableau.


- O (2n) - Complexité exponentielle - O(2n) - Exponential Complexity
 Exemple: S'il y a 10 éléments dans le tableau, il faudra 1024 étapes (2 ^ 10) pour trier le tableau.


- O (n2) - Complexité quadratique - O(n2) - Quadratic Complexity
 Exemple: S'il y a 10 éléments dans le tableau, il faudra 100 étapes (10 ^ 2) pour trier le tableau.


- O (n log2n) - Complexité linéarithmique - O(n log2n) - Linearithmic Complexity
 Exemple: S'il y a 10 éléments dans le tableau, il faudra ~ 33-34 étapes (10 * (log210)) pour trier le tableau.


- O (n) - Complexité linéaire - O(n) - Linear Complexity
 Exemple: S'il y a 10 éléments dans le tableau, il faudra 10 étapes pour trier le tableau. Les complexités linéaires nécessitent autant d'étapes que le nombre d'éléments.


- O (log2n) - Complexité logarithmique - O(log2n) - Logarithmic Complexity
 Exemple: S'il y a 10 éléments dans le tableau, il faudra ~ 3-4 étapes (log210) pour trier le tableau.
 */

// Bubble Sort
// О(n^2) (very slow)

func bubbleSort(_ array: [Int]) -> [Int] {
    guard array.count > 1 else { return array }

    var arr = array
    for _ in 0...arr.count {
        for value in 1...arr.count - 1 {
            if arr[value-1] > arr[value] {
                //swap(&arr[value], &arr[value-1])
                arr.swapAt(value, value-1)
            }
        }
    }
    return arr
}

bubbleSort([10,15,2,4,8,5,6])

// Insertion Sort
// О(n^2)

func insertionSort(_ array: [Int]) -> [Int] {
    guard array.count > 1 else { return array }

    var arr = array
    for number in 1..<arr.count {
        var x = number

        while x > 0 && arr[x] < arr[x-1] {
            // swap(&arr[x - 1], &arr[x])
            arr.swapAt(x - 1, x)
            x -= 1
        }
    }

    return arr
}

insertionSort([10,15,2,0,4,8,5,6])

// Selection Sort
// О(n^2)

func selectionSort(_ array: [Int]) -> [Int] {
    guard array.count > 1 else { return array }

    var arr = array
    for x in 0..<arr.count - 1 {
        var lowest = x
        for y in x + 1 ..< arr.count {
            if arr[y] < arr[lowest] {
                lowest = y
            }
        }
        if x != lowest {
            //swap(&arr[x], &arr[lowest])
            arr.swapAt(x, lowest)
        }
    }
    return arr
}

selectionSort([10,1,15,2,0,4,8,5,6])

// Merge Sort
// O(n log(n))

func mergeSort(_ array: [Int]) -> [Int] {
    guard array.count > 1 else { return array }

    let middleIndex = array.count / 2

    let leftArray = mergeSort(Array(array[0..<middleIndex]))

    let rightArray = mergeSort(Array(array[middleIndex..<array.count]))

    return merge(leftPile: leftArray, rightPile: rightArray)
}

func merge(leftPile: [Int], rightPile: [Int]) -> [Int] {
    var leftIndex = 0
    var rightIndex = 0

    var orderedPile = [Int]()
    orderedPile.reserveCapacity(leftPile.count + rightPile.count)

    while leftIndex < leftPile.count && rightIndex < rightPile.count {
        if leftPile[leftIndex] < rightPile[rightIndex] {
            orderedPile.append(leftPile[leftIndex])
            leftIndex += 1
        } else if leftPile[leftIndex] > rightPile[rightIndex] {
            orderedPile.append(rightPile[rightIndex])
            rightIndex += 1
        } else {
            orderedPile.append(leftPile[leftIndex])
            leftIndex += 1
            orderedPile.append(rightPile[rightIndex])
            rightIndex += 1
        }
    }

    while leftIndex < leftPile.count {
        orderedPile.append(leftPile[leftIndex])
        leftIndex += 1
    }

    while rightIndex < rightPile.count {
        orderedPile.append(rightPile[rightIndex])
        rightIndex += 1
    }

    return orderedPile
}

mergeSort([10,1,15,2,0,4,8,5,6])
