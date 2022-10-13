//
//  ManagerClass.swift
//  1-to-n-using-delegates
//
//  Created by Samet Koyuncu on 13.10.2022.
//

import Foundation

protocol ManagerClassProtocol: AnyObject {
    func didRun()
}

class ManagerClass {
    
    static let shared = ManagerClass()
    
    // burada weak kullanamıyorum, array olduğu için patlıyor
    // VC'lerde weak kullan
    private var delegates: [ManagerClassProtocol] = [ManagerClassProtocol]()
 
    private init() { }
    
    // direkt delegates dizisine self ekleyince,
    // açılıp kapanan ekranlar birden fazla kez ekleniyor.
    // onu engellemek için, diziye eklenmek istenen VC önceden eklenmiş mi
    // kontrol edip ona göre ekleme yapıyoruz.
    func addDelegate(_ vc: ManagerClassProtocol) {
        if !isSame(vc: vc) {
            delegates.append(vc)
        }
    }
    // VC'nin delegates dizisindeki instance'ını silebilmek
    // için method, buna gerek var gibi..
    // artık manager'a ihtiyaç kalmadığında
    // dizinde silinmesi gerek gibi
    func removeDelegate(_ vc: ManagerClassProtocol) {
        delegates = delegates.filter {
            !($0 >!< vc)
        }
    }
    
    func didLoad() {
        delegates.forEach { delegate in
            delegate.didRun()
        }
        print("-------------------------")
    }
}


private extension ManagerClass {
    // class, delegates dizinsinde var mı, yok mu kontrolü
    func isSame(vc: ManagerClassProtocol) -> Bool {
        var result = false
        delegates.forEach { delegate in
            if delegate >!< vc {
                result = true
            }
        }
        return result
    }
}

// MARK: - How to check two instances are the same class/type in swift
// https://stackoverflow.com/questions/24161622/how-to-check-two-instances-are-the-same-class-type-in-swift

infix operator >!<
func >!< (object1: AnyObject!, object2: AnyObject!) -> Bool {
    return (object_getClassName(object1) == object_getClassName(object2))
}
