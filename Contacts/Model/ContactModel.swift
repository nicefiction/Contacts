// ContactModel.swift

// MARK: LIBRARIES

import SwiftUI
/*
 public struct ImageWrapper: Codable {
   public let image: Image

   public enum CodingKeys: String, CodingKey {
     case image
   }

   // Image is a standard UI/NSImage conditional typealias
   public init(image: Image) {
     self.image = image
   }

   public init(from decoder: Decoder) throws {
     let container = try decoder.container(keyedBy: CodingKeys.self)
     let data = try container.decode(Data.self, forKey: CodingKeys.image)
     guard let image = Image(data: data) else {
       throw StorageError.decodingFailed
     }

     self.image = image
   }

   // cache_toData() wraps UIImagePNG/JPEGRepresentation around some conditional logic with some whipped cream and sprinkles.
   public func encode(to encoder: Encoder) throws {
     var container = encoder.container(keyedBy: CodingKeys.self)
     guard let data = image.cache_toData() else {
         throw StorageError.encodingFailed
     }

     try container.encode(data, forKey: CodingKeys.image)
   }
 }
 */

struct ContactModel: Identifiable,
                     Codable {
   
   // MARK: - NESTED TYPES
   
   enum CodingKeys: CodingKey {
      case id, name, image
   }
   
   
   
   // MARK: - PROPERTIES
   
   let id: UUID = UUID()
   var name: String
   var image: Image = Image("greta")
   
   
   
   // MARK: - INITIALIZERS
   
   init(name: String) {
      
      self.name = name
   }
   
   
   init(from decoder: Decoder)
   throws {
      
      let decodingContainer = try decoder.container(keyedBy: CodingKeys.self)
      
      self.name = try decodingContainer.decode(String.self, forKey: CodingKeys.name)
//      let imageData = try decodingContainer.decode(Data.self, forKey: CodingKeys.image)
//      guard let _image = Image(data: imageData)
//      else {
//        throw StorageError.decodingFailed
//      }
   }
   
   
   // MARK: METHODS
   
   func encode(to encoder: Encoder)
   throws {
      
      var encodingContainer = encoder.container(keyedBy: CodingKeys.self)
      
      try encodingContainer.encode(name, forKey: CodingKeys.name)
      //try encodingContainer.encode(image, forKey: CodingKeys.image)
   }
}
