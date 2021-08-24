// ImagePicker.swift

// MARK: - LIBRARIES -

import SwiftUI


struct ImagePicker: UIViewControllerRepresentable {
   
   // MARK: - NESTED TYPES
   
   class Coordinator: NSObject,
                      UIImagePickerControllerDelegate,
                      UINavigationControllerDelegate {
      
      // MARK: PROPERTIES
      
      let parent: ImagePicker
      
      
      // MARK: INITIALIZER METHODS
      
      init(_ parent: ImagePicker) { self.parent = parent }
      
      
      // MARK: METHODS
      
      func imagePickerController(_ picker: UIImagePickerController,
                                 didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
         
         if let _uiImage = info[.originalImage] as? UIImage {
            parent.uiImage = _uiImage
         }
         
         parent.presentationMode.wrappedValue.dismiss()
      }
   }
   
   
   
   // MARK: - PROPERTY WRAPPERS
   
   @Environment(\.presentationMode) var presentationMode
   @Binding var uiImage: UIImage?
   
   
   
   // MARK: - PROTOCOL METHODS
   
   func makeUIViewController(context: Context)
   -> some UIViewController {
      
      let uiImagePickerController = UIImagePickerController()
      uiImagePickerController.delegate = context.coordinator
      
      return uiImagePickerController
   }
   
   
   func makeCoordinator()
   -> Coordinator { Coordinator(self) }
   
   
   func updateUIViewController(_ uiViewController: UIViewControllerType,
                               context: Context) {}
}
