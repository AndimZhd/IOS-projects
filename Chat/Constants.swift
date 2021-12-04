//
//  Constants.swift
//  Chat
//
//  Created by AZHD on 21.08.21.
//
import Firebase

struct Constants
{
    struct refs
    {
        static let databaseRoot = Database.database().reference()
        static let databaseChats = databaseRoot.child("chats")
    }
}
