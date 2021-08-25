// ContentView.swift

// MARK: - LIBRARIES -

import SwiftUI


struct ContactsView: View {
   
   // MARK: - PROPERTY WRAPPERS
   
   @ObservedObject var contactViewModel = ContactViewModel()
   @ObservedObject var contactsViewModel = ContactsViewModel()
   @State private var isShowingAddContactSheet: Bool = false
   
   
   
   // MARK: - COMPUTED PROPERTIES
   
   var body: some View {
      
      return NavigationView {
         List {
            ForEach(contactsViewModel.contacts) { (contactViewModel: ContactViewModel) in
               NavigationLink(destination: ContactDetailView(contactViewModel: contactViewModel)) {
                  HStack {
                     if let _image = contactViewModel.contact.image {
                        _image
                           .resizable()
                           .frame(width: 70, height: 70)
                           .clipShape(RoundedRectangle(cornerRadius: 10))
                     } else {
                        RoundedRectangle(cornerRadius: 10.0)
                           .frame(width: 70, height: 70)
                           .foregroundColor(.gray)
                     }
                     Text(contactViewModel.contact.name)
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
                  AddContactView(contactsViewModel: contactsViewModel)
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
