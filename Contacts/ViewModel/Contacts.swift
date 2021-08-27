// Contacts.swift

// MARK: - LIBRARIES

import SwiftUI


class Contacts: ObservableObject {
   
   @Published var list = Array<ContactPerson>()
}
