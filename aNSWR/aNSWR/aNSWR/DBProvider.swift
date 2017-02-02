//
//  DBProvider.swift
//  aNSWR
//
//  Created by Hui Jun on 1/31/17.
//  Copyright © 2017 aNSWR. All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseStorage

class DBProvider {
    private static let _instance = DBProvider();
    
    private let USERS = "users"
    private let USERNAME = "username"
    private let EMAIL = "email"
    private let PASSWORD = "password"
    private let DATA = "data"
    private let QUESTIONS = "questions"
    private let QUESTIONTEXT = "questionText"
    private let USERID = "userID"
    private let ANSWERS = "answers"
    private let ANSWERTEXT = "answerText"
    private let QUESTIONID = "questionID"
    
    static var instance: DBProvider {
        return _instance
    }
    
    var dbRef: FIRDatabaseReference {
        return FIRDatabase.database().reference()
    }
    
    var usersRef: FIRDatabaseReference {
        return dbRef.child(USERS)
    }
    
    var questionRef: FIRDatabaseReference {
        return dbRef.child(QUESTIONS).childByAutoId()
    }
    
    var answerRef: FIRDatabaseReference {
        return dbRef.child(ANSWERS).childByAutoId()
    }
  
    func saveUser(withID: String, email: String, username: String, password: String) {
        let data: Dictionary<String, String> = [EMAIL: email, USERNAME: username, PASSWORD: password]
        usersRef.child(withID).setValue(data)
    }
    
    func saveQuestion(questionText: String, userID: String) {
        let data: Dictionary<String, String> = [QUESTIONTEXT: questionText, USERID: userID]
        questionRef.setValue(data)
        
        
        let q = questionRef.queryOrderedByKey().queryLimited(toLast: 1).observeSingleEvent(of: .value, with: { snapshot in
            
            
    }
    
    func saveAnswer(answerText: String, userID: String, questionID: String) {
        let data: Dictionary<String, String> = [ANSWERTEXT: answerText, USERID: userID, QUESTIONID: questionID]
        answerRef.setValue(data)
        
    }
}



