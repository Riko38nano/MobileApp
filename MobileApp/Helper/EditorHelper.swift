//
//  EditorHelper.swift
//  MobileApp
//
//  Created by Rogerio MENSAH on 02/04/2021.
//

import SwiftUI

class EditorHelper{
    static func getNbEditor() -> Int{
        var editors = EditorViewModel().editors
        return editors.count
    }
    
    static func getEditorByid(idEditor: String) -> Editor?{
        var editors = EditorViewModel().editors
        var edi : Editor? = nil
        for editor in editors{
            if editor._id == idEditor{
                edi = editor
                break
            }
            
        }
        return edi
    }
}
