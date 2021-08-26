// ContactViewModel.swift

// MARK: - LIBRARIES -

import SwiftUI



class ContactViewModel: Identifiable,
                        ObservableObject {
   
   let id: UUID = UUID()
   @Published var image: Image?
   @Published var name: String = ""
}
