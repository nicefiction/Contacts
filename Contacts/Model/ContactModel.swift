// ContactModel.swift

// MARK: LIBRARIES

import SwiftUI



struct ContactModel: Identifiable {
   
   let id: UUID = UUID()
   var image: Image?
   var name: String = ""
}


//struct ContactModel: Identifiable,
//                     Codable {
//
//   // MARK: - NESTED TYPES
//
//   enum CodingKeys: CodingKey {
//      case id, name, image
//   }
//
//
//
//   // MARK: - PROPERTIES
//
//   let id: UUID = UUID()
//   var name: String = "Greta"
//   var image: Image?
//
//
//
//   // MARK: - INITIALIZERS
//
//   init(name: String) {
//
//      self.name = name
//   }
//
//
//   init(from decoder: Decoder)
//   throws {
//
//      let decodingContainer = try decoder.container(keyedBy: CodingKeys.self)
//
//      self.name = try decodingContainer.decode(String.self, forKey: CodingKeys.name)
//      // self.image = try decodingContainer.decode(Data.self, forKey: CodingKeys.image)
//   }
//
//
//   // MARK: METHODS
//
//   func encode(to encoder: Encoder)
//   throws {
//
//      var encodingContainer = encoder.container(keyedBy: CodingKeys.self)
//
//      try encodingContainer.encode(name, forKey: CodingKeys.name)
//      // try encodingContainer.encode(image, forKey: CodingKeys.image)
//   }
//}
