// Contacts.swift

// MARK: - LIBRARIES

import SwiftUI


class Contacts: ObservableObject {
   
   @Published var list = Array<ContactPerson>()
}


// MARK: TODO
/*
let paths = FileManager.default.urls(for: .documentDirectory,
                                     in: .userDomainMask)

if let _jpegData = _uiImage.jpegData(compressionQuality: 0.8) {
   try? _jpegData.write(to: paths[0],
                        options: [.atomicWrite, .completeFileProtection])


if let jpegData = yourUIImage.jpegData(compressionQuality: 0.8) {
   try? jpegData.write(to: yourURL, options: [.atomicWrite, .completeFileProtection])
}



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



func getDocumentsDirectory()
-> URL {
   
   let paths = FileManager.default.urls(for: .documentDirectory,
                                        in: .userDomainMask)
   return paths[0]
}
*/
