//
//  ContentView.swift
//  QR code Scan
//
//  Created by Arina on 17.06.2023.
//

import SwiftUI
import CodeScanner

struct ContentView: View {
    
    @State var isPresentingScanner = false
    @State var scannedCode: String = "Scan a QR code to start"
    
    var scannerSheet: some View {
        CodeScannerView(
            // какой код будем сканировать
            codeTypes: [.qr],
            // что случится, когда мы отсканируем код
            completion: { result in
                if case let .success(code) = result {
                    self.scannedCode = code.string
                    self.isPresentingScanner = false
                }
            }
        )
    }
     
    var body: some View {
        VStack(spacing: 10) {
            Text(scannedCode)
            
            Button("Scan OR Code") {
                self.isPresentingScanner = true
            }
            .sheet(isPresented: $isPresentingScanner) {
                self.scannerSheet
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
