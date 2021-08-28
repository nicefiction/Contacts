// AddContactView.swift

// MARK: - LIBRARIES -

import SwiftUI



struct AddContactPersonView: View {
   
   // MARK: - PROPERTY WRAPPERS
   
   @Environment(\.presentationMode) var presentationMode
   @State private var name: String = ""
   @ObservedObject var contacts: Contacts
   
   
   
   // MARK: - COMPUTED PROPERTIES
   
   var body: some View {
      
      return NavigationView {
         Form {
            TextField("Name", text: $name)
               .textFieldStyle(RoundedBorderTextFieldStyle())
               .padding()
         }
         .navigationBarItems(
            trailing:
               Button("Done",
                      action: {
                        var newContact = ContactPerson()
                        newContact.name = name
                        contacts.list.append(newContact)
                        presentationMode.wrappedValue.dismiss()
                   }))
      }
   }
}





// MARK: - PREVIEWS -

struct AddContactView_Previews: PreviewProvider {

   static var previews: some View {

      AddContactPersonView(contacts: Contacts())
   }
}
