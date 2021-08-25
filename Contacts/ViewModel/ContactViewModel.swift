// ContactViewModel.swift

// MARK: - LIBRARIES -

import SwiftUI



class ContactViewModel: Identifiable,
                        ObservableObject {
   
   @Published var contact = ContactModel()
}
