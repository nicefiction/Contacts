// ContentView.swift

// MARK: - LIBRARIES -

import SwiftUI


struct ContactsView: View {
   
   // MARK: - PROPERTY WRAPPERS
   
   @ObservedObject var contacts = ContactsViewModel()
   @State private var isShowingAddContactSheet: Bool = false
   
   
   
   // MARK: - COMPUTED PROPERTIES
   
   var body: some View {
      
      return NavigationView {
         List {
            ForEach(contacts.list) { (contactViewModel: ContactViewModel) in
               NavigationLink(destination: ContactDetailView(contactViewModel: contactViewModel)) {
                  HStack {
                     if let _image = contactViewModel.image {
                        _image
                           .resizable()
                           .frame(width: 70, height: 70)
                           .clipShape(RoundedRectangle(cornerRadius: 10))
                     } else {
                        RoundedRectangle(cornerRadius: 10.0)
                           .frame(width: 70, height: 70)
                           .foregroundColor(.gray)
                     }
                     Text(contactViewModel.name)
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
                  AddContactView(contactsViewModel: contacts)
         })
      }
   }
   
   
   
 
}

/*
  if let jpegData = yourUIImage.jpegData(compressionQuality: 0.8) {
      try? jpegData.write(to: yourURL, options: [.atomicWrite, .completeFileProtection])
  }
 */
/*
 // Obtaining the Location of the Documents Directory
 let documents = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]

 // Create URL
 let url = documents.appendingPathComponent("image.png")

 // Convert to Data
 if let data = image.pngData() {
     do {
         try data.write(to: url)
     } catch {
         print("Unable to Write Image Data to Disk")
     }
 }
 */
/*
 func saveData() {
    
    do {
       let filename = getDocumentsDirectory().appendingPathComponent("SavedPlaces")
       let data = try JSONEncoder().encode(self.locations)
       try data.write(to: filename,
                      options: [.atomicWrite, .completeFileProtection])
    } catch {
       print("Unable to save data.")
    }
 }
 */
/*
 func getDocumentsDirectory()
 -> URL {
    
    let paths = FileManager.default.urls(for: .documentDirectory,
                                         in: .userDomainMask)
    return paths[0]
 }
 */




// MARK: - PREVIEWS -

struct ContentView_Previews: PreviewProvider {
   
   static var previews: some View {
      
      ContactsView()
   }
}
