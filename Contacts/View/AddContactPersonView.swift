// AddContactView.swift

// MARK: - LIBRARIES -

import SwiftUI



struct AddContactPersonView: View {
   
   // MARK: - PROPERTY WRAPPERS
   
   @Environment(\.presentationMode) var presentationMode
   @State private var name: String = ""
   @State private var uiImage: UIImage?
   
   
   
   // MARK: - PROPERTIES
   
   var contacts: Contacts
   
   
   
   // MARK: - COMPUTED PROPERTIES
   
   var body: some View {
      
      return NavigationView {
         Form {
            TextField("Name", text: $name)
               .textFieldStyle(RoundedBorderTextFieldStyle())
               .padding()
            ImagePicker(uiImage: $uiImage)
         }
         .navigationBarItems(
            trailing:
               Button("Done",
                      action: {
                        let newContact = ContactPerson()
                        newContact.name = name
                        newContact.profileImage = Image("greta")
                        contacts.list.append(newContact)
                        
                        loadImage(from: newContact)
                        presentationMode.wrappedValue.dismiss()
                   }))
      }
   }
   
   
   
   func loadImage(from contactPerson: ContactPerson) {
      
      guard let _uiImage = uiImage
      else { return }
      
      contactPerson.profileImage = Image(uiImage: _uiImage)
      print("Printing \(contactPerson)")
   }
   
}





// MARK: - PREVIEWS -

struct AddContactView_Previews: PreviewProvider {

   static var previews: some View {

      AddContactPersonView(contacts: Contacts())
   }
}
