import Foundation
import SwiftUI

struct Cover: Identifiable {
    
    var id: Int
    var coverName : String
    var thumbNail: String {
        return "thumb-\(coverName)"
    }
    
}


var coverData: [Cover] = [
    
    Cover(id: 1, coverName: "cover1"),
    Cover(id: 2, coverName: "cover2"),
    Cover(id: 3, coverName: "cover3"),
    Cover(id: 4, coverName: "cover4")
        
]

