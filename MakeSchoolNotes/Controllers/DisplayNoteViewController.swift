//
//  DisplayNoteViewController.swift
//  MakeSchoolNotes
//
//  Created by Chris Orcutt on 1/10/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit

class DisplayNoteViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "cancel" {
                print("Cancel button tapped")
            } else if identifier == "save" {
                print("Save button tapped")
                
                // 1
                let note = Note()
                // 2
                note.title = noteTitleTextField.text ?? ""
                note.content = noteContentTextView.text ?? ""
                // 3
                note.modificationTime = Date()
                
                // 1
                let listNotesTableViewController = segue.destination as! ListNotesTableViewController
                // 2
                listNotesTableViewController.notes.append(note)
            }
        }
    }
    
    
    @IBOutlet weak var noteContentTextView: UITextView!
    @IBOutlet weak var noteTitleTextField: UITextField!
    
    override func viewWillAppear(_ animated: Bool) { super.viewWillAppear(animated)
        noteTitleTextField.text = ""
        noteContentTextView.text = ""
    }
}
