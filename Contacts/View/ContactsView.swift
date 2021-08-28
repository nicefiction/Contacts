// ContentView.swift

// MARK: - LIBRARIES -

import SwiftUI


struct ContactsView: View {
   
   // MARK: - PROPERTY WRAPPERS
   
   @ObservedObject var contacts = Contacts()
   @State private var isShowingAddContactSheet: Bool = false
   
   
   
   // MARK: - COMPUTED PROPERTIES
   
   var body: some View {
      
      return NavigationView {
         List {
            ForEach(contacts.list) { (contactPerson: ContactPerson) in
               NavigationLink(destination: ContactPersonDetailView(contactPerson: contactPerson)) {
                  HStack {
                     if let _image = contactPerson.profileImage {
                        _image
                           .resizable()
                           .frame(width: 70, height: 70)
                           .clipShape(RoundedRectangle(cornerRadius: 10))
                     } else {
                        RoundedRectangle(cornerRadius: 10.0)
                           .frame(width: 70, height: 70)
                           .foregroundColor(.gray)
                     }
                     Text(contactPerson.name)
                  }
               }
            }
         }
         .navigationBarTitle("Contacts")
         .navigationBarItems(
            trailing: Button(
               action: {
                  isShowingAddContactSheet.toggle()
               },
               label: {
                  Image(systemName: "plus.circle")
                     .font(.title)
               }))
         .sheet(isPresented: $isShowingAddContactSheet,
                content: {
                  AddContactPersonView(contacts: contacts)
         })
      }
   }
}





// MARK: - PREVIEWS -

struct ContentView_Previews: PreviewProvider {
   
   static var previews: some View {
      
      ContactsView()
   }
}
