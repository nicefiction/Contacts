//// ImageSaver.swift
//// MARK: SOURCE
//// https://www.hackingwithswift.com/books/ios-swiftui/saving-the-filtered-image-using-uiimagewritetosavedphotosalbum
//
//// MARK: - LIBRARIES -
//
//import UIKit
//
//
//class ImageSaver: NSObject {
//   
//   // MARK: - PROPERTIES
//   
//   var succesHandler: (() -> Void)?
//   var errorHandler: ((Error) -> Void)?
//   
//   
//   
//   // MARK: - METHODS
//   
//   func writeToPhotoAlbum(image: UIImage) {
//      
//      UIImageWriteToSavedPhotosAlbum(image,
//                                     self,
//                                     #selector(saveError),
//                                     nil)
//   }
//   
//   
//   @objc
//   func saveError(_ image: UIImage,
//                  didFinishSavingWithError error: Error?,
//                  contextInfo: UnsafeRawPointer) {
//      
//      if let _error = error {
//         errorHandler?(_error)
//      } else {
//         succesHandler?()
//      }
//   }
//}
//
//
///*
// func getDocumentsDirectory()
// -> URL {
//    
//    let paths = FileManager.default.urls(for: .documentDirectory,
//                                         in: .userDomainMask)
//    return paths[0]
// }
// 
// 
// func saveData() {
//    
//    if let _jpegData = uiImage?.jpegData(compressionQuality: 0.8) {
//       try? _jpegData.write(to: getDocumentsDirectory(),
//                            options: [.atomicWrite, .completeFileProtection])
//    }
//    
////      do {
////         let filename = getDocumentsDirectory().appendingPathComponent("SavedContacts")
////         let data = try JSONEncoder().encode(self.contact)
////         try data.write(to: filename,
////                        options: [.atomicWrite, .completeFileProtection])
////         /// `NOTE`:
////         /// All it takes to ensure that the file is stored with strong encryption is
////         /// to add `.completeFileProtection` to the `data` writing options.
////      } catch {
////         print("Unable to save data.")
////      }
// }
// */
