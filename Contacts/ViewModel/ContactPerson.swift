// ContactPerson.swift

// MARK: - LIBRARIES -

import SwiftUI



struct ContactPerson: Identifiable {
   
   let id: UUID = UUID()
   var profileImage: Image?
   var name: String = ""
}
