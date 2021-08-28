// ContactPerson.swift

// MARK: - LIBRARIES -

import SwiftUI



class ContactPerson: Identifiable,
                     ObservableObject {
   
   let id: UUID = UUID()
   @Published var profileImage: Image?
   @Published var name: String = ""
}
