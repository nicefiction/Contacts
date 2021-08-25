//
//  ContactsViewModel.swift
//  Contacts
//
//  Created by Olivier Van hamme on 25/08/2021.
//

import SwiftUI


class ContactsViewModel: ObservableObject {
   
   @Published var contacts = Array<ContactViewModel>()
}
