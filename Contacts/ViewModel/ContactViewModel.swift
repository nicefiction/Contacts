// ContactViewModel.swift

// MARK: LIBRARIES

import SwiftUI


class ContactViewModel: ObservableObject {
   
   // MARK: - PROPERTIES
   
   @Published var contactList = Array<ContactModel>() {
      didSet {
         let jsonEncoder = JSONEncoder()
         
         if let _encodedContacts = try? jsonEncoder.encode(contactList) {
            UserDefaults.standard.setValue(_encodedContacts,
                                           forKey: "ContactList")
         }
      }
   }
   
   
   // MARK: - INITIALIZER METHODS
   
   init() {
      /// 1. Reads whatever is in `"Contacts"` as a `Data` object :
      if let _savedContacts = UserDefaults.standard.object(forKey: "ContactList") as? Data {
         
         let jsonDecoder = JSONDecoder()
         
         /// 2. Unarchives the `Data` object into an Array of Contacts :
         if let _decodedContacts = try? jsonDecoder.decode([ContactModel].self,
                                                           from: _savedContacts) {
            self.contactList = _decodedContacts
            return
         }
         
         self.contactList = Array<ContactModel>()
      }
   }
}


/*
 if let _jpegData = image.jpegData(compressionQuality: 0.8) {
     try? _jpegData.write(to: yourURL,
                          options: [.atomicWrite, .completeFileProtection])
 }
 */
