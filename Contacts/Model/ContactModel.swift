// ContactModel.swift
// MARK: SOURCE
// https://www.hackingwithswift.com/example-code/media/how-to-save-a-uiimage-to-a-file-using-jpegdata-and-pngdata

// MARK: LIBRARIES

import SwiftUI



struct ContactModel: Identifiable,
                     Codable {
   
   // MARK: - NESTED TYPES
   
   enum CodingKeys: CodingKey {
      case id, name, image
   }
   
   
   
   // MARK: - PROPERTIES
   
   let id: UUID = UUID()
   var name: String = "Greta"
   var image: Image?
   
   
   
   // MARK: - COMPUTED PROPERTIES
   
//   var image: Image? {
//
//      if let _uiImage = self.uiImage {
//         return Image(uiImage: _uiImage)
//      } else {
//         return nil
//      }
//   }
//
   
   
   // MARK: - INITIALIZERS
   
   init(name: String) {
      
      self.name = name
   }
   
   
   init(from decoder: Decoder)
   throws {
      
      let decodingContainer = try decoder.container(keyedBy: CodingKeys.self)
      
      self.name = try decodingContainer.decode(String.self, forKey: CodingKeys.name)
      // self.image = try decodingContainer.decode(Data.self, forKey: CodingKeys.image)
   }
   /*
    if let image = UIImage(named: "example.jpg") {
        if let data = image.jpegData(compressionQuality: 0.8) {
            let filename = getDocumentsDirectory().appendingPathComponent("copy.png")
            try? data.write(to: filename)
        }
    }
    */
   
   // MARK: METHODS
   
   func encode(to encoder: Encoder)
   throws {
      
      var encodingContainer = encoder.container(keyedBy: CodingKeys.self)
      
      try encodingContainer.encode(name, forKey: CodingKeys.name)
      // try encodingContainer.encode(image, forKey: CodingKeys.image)
   }
   
   
//   func loadImage() {
//      
//      guard let _uiImage = self.uiImage
//      else { return }
//      
//      Image(uiImage: _uiImage)
//   }
}
