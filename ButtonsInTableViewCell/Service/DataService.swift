//
//  DataService.swift
//  ButtonsInTableViewCell
//
//  Created by Apple on 28/03/18.
//  Copyright © 2018 Vignesh. All rights reserved.
//

import Foundation
class DataService {
    
    static let instance = DataService()
    private init() {}
    var instas = [Insta]()
    
    func getQuotes(_ completion: @escaping(Bool)-> Void){
        let q1 = Insta(quote: "We may encounter many defeats but we must not be defeated.-Maya Angelou")
        let q2 = Insta(quote: "Nothing will work unless you do.- Maya Angelou")
        let q3 = Insta(quote: "The secret of your future is hidden in your daily routine.- Mike Murdouch")
        let q4 = Insta(quote: "Only through dedicated work does a man fulfill himself. - William Carlson")
        let q5 = Insta(quote: "The secret of success is constancy to purpose.- Benjamin Disraeli")
        
        self.instas.append(q1)
        self.instas.append(q2)
        self.instas.append(q3)
        self.instas.append(q4)
        self.instas.append(q5)
        
    }
    
    
}
