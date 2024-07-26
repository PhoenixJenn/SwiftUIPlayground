//
//  PackageDependencies.swift
//  HotProspects
//
//  Created by Jennifer Lee on 7/26/24.
//
/*:
 The reason this is possible is because most developers have agreed a system of semantic versioning (SemVer) for their code. If you look at a version like 1.5.3, then the 1 is considered the major number, the 5 is considered the minor number, and the 3 is considered the patch number. If developers follow SemVer correctly, then they should:

 Change the patch number when fixing a bug as long as it doesn’t break any APIs or add features.
 Change the minor number when they added features that don’t break any APIs.
 Change the major number when they do break APIs.
 This is why “Up to Next Major” works so well, because it should mean you get new bug fixes and features over time, but won’t accidentally switch to a version that breaks your code.
 
 */

import SwiftUI
import SamplePackage

// This adds a small extension to Swift’s Sequence type (which Array, Set, Dictionary, and even ranges all conform to) that pulls out a number of random items at the same time.

struct PackageDependencies: View {
    let possibleNumbers = 1...60
    var results: String {
        let selected = possibleNumbers.random(7).sorted()
        let strings = selected.map(String.init)
        return strings.formatted()
    }
    
    var body: some View {
        Text(results)
    }
}

#Preview {
    PackageDependencies()
}
