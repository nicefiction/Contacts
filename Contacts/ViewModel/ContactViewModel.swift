// ContactViewModel.swift

// MARK: - LIBRARIES -

import SwiftUI



class ContactViewModel: ObservableObject {
   
   @Published var contacts = Array<ContactModel>()
}
