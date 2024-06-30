//
//  DataController.swift
//  CoinMatrix
//
//  Created by Xcaret Mora on 29/06/24.
//
import CoreData
import Foundation

class DataController: ObservableObject {
    
    static let shared = DataController()
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "CoinMatrix")
        
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
    }
    
    func saveContext() {
        let context = container.viewContext
        
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func fecthCryptos() -> [Crypto] {
        let request: NSFetchRequest<Crypto> = Crypto.fetchRequest()
        
        do {
            return try container.viewContext.fetch(request)
        } catch {
            print("Error fetching cryptos: \(error)")
            return []
        }
    }
    
    func deleteAllCryptos() {
        let request: NSFetchRequest<NSFetchRequestResult> = Crypto.fetchRequest()
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: request)
        
        do {
            try container.viewContext.execute(deleteRequest)
        } catch {
            print("Error deleting cryptos: \(error)")
        }
    }
    func addCrypto(from cryptoData: CryptoData) {
        let context = container.viewContext
        let crypto = Crypto(context: context)

        crypto.id = cryptoData.id
        crypto.symbol = cryptoData.symbol
        crypto.name = cryptoData.name
        crypto.supply = cryptoData.supply
        crypto.priceUsd = cryptoData.priceUsd
        crypto.changePercent24Hr = cryptoData.changePercent24Hr
        saveContext()
    }
    
}
