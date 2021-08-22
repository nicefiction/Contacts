// ContentView.swift

// MARK: - LIBRARIES -

import SwiftUI



struct ContactsView: View {
   
   // MARK: - PROPERTY WRAPPERS
   
   @ObservedObject var contacts: ContactViewModel = ContactViewModel()
   @State private var isShowingNewContactSheet: Bool = false
   @State private var image: Image?
   @State private var uiImage: UIImage?
   
   
   
   // MARK: - PROPERTIES
   
   let contactList: Array<String> = [
      "Dorothy Gale", "Ozma of Oz", "Glinda of Oz", "Taylor Swift"
   ]
   

   
   // MARK: - COMPUTED PROPERTIES
   
   var body: some View {
      
      NavigationView {
         List {
            ForEach(contactList,
                    id: \.self) { (contact: String) in
               NavigationLink(destination: ContactDetailView(contact: contact)) {
                  HStack {
                     Image("greta")
                        .resizable()
                        .frame(width: 50,
                               height: 50)
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 10.0))
                     Text(contact)
                  }
               }
            }
            ForEach(contacts.contactList) { (contact: ContactModel) in
               NavigationLink(destination: ContactDetailView(contact: contact.name)) {
                  Text(contact.name)
               }
            }
         }
         .navigationTitle("My Contacts")
         .navigationBarItems(trailing: Button(action: {
            isShowingNewContactSheet.toggle()
         }, label: {
            Image(systemName: "plus.circle")
               .font(.title)
         }))
         .sheet(isPresented: $isShowingNewContactSheet) {
            // ImagePicker(uiImage: $uiImage)
            AddContactView(contacts: contacts)
         }
      }
   }
   
   
   
   // MARK: - METHODS
   
   func getDocumentsDirectory()
   -> URL {
      
       let paths = FileManager.default.urls(for: .documentDirectory,
                                            in: .userDomainMask)
       return paths[0]
   }
   
   
   func saveData() {
      if let _jpegData = uiImage?.jpegData(compressionQuality: 0.8) {
         try? _jpegData.write(to: getDocumentsDirectory(),
                              options: [.atomicWrite, .completeFileProtection])
      }
   }
   
   
//   func loadData() {
//       let filename = getDocumentsDirectory().appendingPathComponent("SavedContacts")
//
//       do {
//           let data = try Data(contentsOf: filename)
// //           locations = try JSONDecoder().decode([CodableMKPointAnnotation].self, from: data)
//       } catch {
//           print("Unable to load saved data.")
//       }
//   }
}






// MARK: - PREVIEWS -

struct ContentView_Previews: PreviewProvider {
   
   static var previews: some View {
      
      ContactsView()
   }
}
