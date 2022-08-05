//
//  EDCViewController.swift
//  NuttyPlayGround
//
//  Created by Nuttanai on 9/8/2564 BE.
//  Copyright (c) 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import SwiftSocket
import GMEllipticCurveCrypto
//import CryptoKit
import CryptoSwift
import CoreFoundation
//import EDCDevice

class EDCViewController: UIViewController {
    // MARK: @IBOutlet
    
    var interactor: EDCBusinessLogic?
    var router: (NSObjectProtocol & EDCRoutingLogic & EDCDataPassing)?
    let host = "192.168.2.34"
    let port: Int32 = 4001
    var client: TCPClient?
    var timer = Timer()
    var edchFoodStoryKey: GMEllipticCurveCrypto?
    var a = ""
    // MARK: Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    // MARK: View lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        client = TCPClient(address: host, port: port)
        doSomething()
    }
    
//    public typealias FoundDevice = FoundDeviceMo<Character,Character>
//
//    class FoundDeviceMo<In, Out> {
//
//    }
//    func FoundDevice(tid: Optional<UnsafePointer<Int8>>, mid: Optional<UnsafePointer<Int8>>, ip: Optional<UnsafePointer<Int8>>) {
//        
//    }
    
    // MARK: Do something
    
    func doSomething() {
        let request = EDC.Something.Request()
        interactor?.doSomething(request: request)
//        let alice = GMEllipticCurveCrypto.generateKeyPair(for: GMEllipticCurveSecp256r1)
//        let bob = GMEllipticCurveCrypto.generateKeyPair(for: GMEllipticCurveSecp256r1)
//        let aliceSharedSecret = alice?.sharedSecret(forPublicKeyBase64: bob?.publicKeyBase64)
//        let bobSharedSecret = bob?.sharedSecret(forPublicKeyBase64: alice?.publicKeyBase64)
//        print("aliceSharedSecret: \(aliceSharedSecret?.base64EncodedString() ?? "???")")
//        print("bobSharedSecret: \(aliceSharedSecret?.base64EncodedString() ?? "???")")
//        print(aliceSharedSecret == bobSharedSecret ? "Share: Yes" : "Share: No")
        
//        let base64 = "bwx0EB1HnVvLv9oX2MXud4BcIlmmOy9+83v1F190DlY="
//        let decodedData = Data(base64Encoded: base64)!
//        let key: [UInt8] = [UInt8](decodedData)
//        print("secretKeyDecodedDataHex: \(decodedData.hexadecimal)")
//        //ivCal
//        var dataTemp = Data()
//        for (index, dataS) in decodedData.enumerated() {
//            let overByte = Int(dataS) + ((2^index)+1) < 256 ? 0 : 256
//            let bytee: UInt8 = UInt8(Int(dataS) + ((2^index)+1) - overByte)
//            dataTemp.append(bytee)
//        }
//        let iv = [UInt8](dataTemp)
//        print("ivHex: \(dataTemp.hexadecimal)")
//        var dataArray = Data()
//        dataArray.append(Data([0x02]))
//        dataArray.append(Data([0x00]))
//        dataArray.append(Data("560000000001020000".utf8))
//        dataArray.append(Data([0x1c]))
//        dataArray.append(Data("40".utf8))
//        dataArray.append(Data([0x00]))
//        dataArray.append(Data([0x12]))
//        dataArray.append(Data("000000000100".utf8))
//        dataArray.append(Data([0x1c]))
//        dataArray.append(Data([0x03]))
//        dataArray.append(Data([0x14]))
//        print("SaleCommHEX: \(dataArray.hexadecimal)")
//        let message: [UInt8] = [UInt8](dataArray)
//        var dataResult = Data()
//        do {
//            let gcm = GCM(iv: iv, mode: .detached)
//            let aes = try! AES(key: key, blockMode: gcm , padding: .noPadding)
//            let encrypted = try aes.encrypt(message)
//            dataResult.append(Data(encrypted))
//            dataResult.append(Data(gcm.authenticationTag ?? [UInt8]()))
//        } catch {
//
//        }
//        print("noPadding: \(dataResult.hexadecimal)")
//        let base64Endcode = dataResult.bytes.toBase64()
//        print(base64Endcode ?? "???")
    }
    
    @IBAction func backAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
//
//    public func startDiscoveryEDCDevice(completion:@escaping (Bool) -> Void) {
//        StartPOSProcessCCallBack { data in
//            completion(false)
//        }
//    }
    
    func aaaaaa(dataString: String) {
        print(dataString)
    }
    
//    func bridge<T : AnyObject>(obj : T) -> UnsafeRawPointer {
//        return UnsafePointer<Any>(Unmanaged.passUnretained(obj).toOpaque())
////         return unsafeAddressOf(obj) // ***
//    }

//    func bridge<T : AnyObject>(ptr : UnsafePointer<Void>) -> T {
////        return Unmanaged<T>.fromOpaque(COpaquePointer(ptr)).takeUnretainedValue()
//         return unsafeBitCast(ptr, T.self) // ***
//    }
    
    @IBAction func doneAction(_ sender: Any) {
        print("StartPOSProcessCCallBack")
//        StartPOSProcessCCallBack({ (data) in
//            if let dataString = String(cString: data){
//                print("data: \(dataString)")
////                let view = Unmanaged<EDCViewController>.fromOpaque(delegateToClass).takeUnretainedValue()
////                view.aaaaaa(dataString: dataString)
//            }
//        })
        
        let gmellipticCurveCryptoService = GMEllipticCurveCryptoService()
        gmellipticCurveCryptoService.delegate = self
        gmellipticCurveCryptoService.startDiscoveryEDC()
        
//        let edc = EDCDeviceService()
//        edc.aaa()
//        edchFoodStoryKey = GMEllipticCurveCrypto.generateKeyPair(for: GMEllipticCurveSecp256r1)
//        print("publicKey: \(edchFoodStoryKey?.publicKeyBase64 ?? "")")
//        var dataArray = Data()
//        dataArray.append(Data([0x00]))
//        dataArray.append(Data("g600000000010K1000".utf8))
//        dataArray.append(Data([0x1c]))
//        dataArray.append(Data("K1".utf8))
//        dataArray.append(Data([0x00]))
//        dataArray.append(Data("D".utf8))
//        dataArray.append(Data(edchFoodStoryKey?.publicKeyBase64.utf8 ?? "".utf8))
//        dataArray.append(Data([0x1c]))
//        dataArray.append(Data([0x03]))
//        var rlc = UInt8()
//        for (index,data) in dataArray.enumerated(){
//            if index != 0 {
//                rlc = rlc ^ data
//            } else {
//                rlc = data
//            }
//        }
//        dataArray.append(rlc)
//        dataArray.insert(contentsOf: Data([0x02]), at: 0)
//        print("POSKeyExchangeHex: \(dataArray.map{ String(format:"%02x", $0) }.joined())")
//        guard let client = client else { return }
//
//        switch client.connect(timeout: 10) {
//        case .success:
//            appendToTextField(string: "Connected to host \(client.address)")
//            if sendRequest(data: dataArray, using: client) {
//                readResponseCheckMessege()
//            }
//        case .failure(let error):
//            appendToTextField(string: "error: \(String(describing: error))")
//        }
    }
    
    func readResponseCheckMessege() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: { [weak self] in
            guard let strongSelf = self, let client = strongSelf.client else { return }
            
            if ((strongSelf.readResponse(from: client)?.contains("\n{06}")) != nil) {
                print("Send messege Complete")
                strongSelf.readResponseCheckTransaction()
            } else {
                print("Send messege Fail")
            }
        })
    }
    
    func readResponseCheckTransaction() {
        startTimer()
        DispatchQueue.main.asyncAfter(deadline: .now() + 60, execute: { [weak self] in
            guard let strongSelf = self else { return }
            
            strongSelf.timer.invalidate()
            print("non messege")
        })
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(UpdateTimer), userInfo: nil, repeats: true)
    }

    @objc func UpdateTimer() {
        if let client = client,
            let response = readResponse(from: client) {
            convertResponse(response: response)
            timer.invalidate()
        } else {
            print("Waiting...")
        }
    }
    
    func convertResponse(response: String){
        let res = response.replacingOccurrences(of: " ", with: "")
        let edcPublicKey = res.substring(with: 25..<69)
        print("EDCKeyExchangeBase64: \(edcPublicKey)")
        let secretKey = edchFoodStoryKey?.sharedSecret(forPublicKeyBase64: edcPublicKey)
        print("shareSecretKeyBase64: \(secretKey?.base64EncodedString() ?? "???")")
        let base64 = secretKey?.base64EncodedString() ?? ""
        let decodedData = Data(base64Encoded: base64)!
        let key = [UInt8](decodedData)
        print("shareSecretKeyDecodedHex: \(decodedData.hexadecimal)")
        //ivCal
        var dataTemp = Data()
        for (index, dataS) in decodedData.enumerated() {
            let overByte = Int(dataS) + ((2^index)+1) < 256 ? 0 : 256
            let bytee: UInt8 = UInt8(Int(dataS) + ((2^index)+1) - overByte)
            dataTemp.append(bytee)
        }
        let iv = [UInt8](dataTemp)
        print("ivHex: \(dataTemp.hexadecimal)")
        var dataArray = Data()
        dataArray.append(Data([0x02]))
        dataArray.append(Data([0x00]))
        dataArray.append(Data("560000000001020000".utf8))
        dataArray.append(Data([0x1c]))
        dataArray.append(Data("40".utf8))
        dataArray.append(Data([0x00]))
        dataArray.append(Data([0x12]))
        dataArray.append(Data("000000000100".utf8))
        dataArray.append(Data([0x1c]))
        dataArray.append(Data([0x03]))
        dataArray.append(Data([0x14]))
        print("saleCommandHEX: \(dataArray.hexadecimal)")
        let message: [UInt8] = [UInt8](dataArray)
        var dataResult = Data()
        do {
            let gcm = GCM(iv: iv, mode: .detached)
            let aes = try! AES(key: key, blockMode: gcm , padding: .noPadding)
            let encrypted = try aes.encrypt(message)
            dataResult.append(Data(encrypted))
            dataResult.append(Data(gcm.authenticationTag ?? [UInt8]()))
        } catch {

        }
        print("AESEncryptHex: \(dataResult.hexadecimal)")
        let base64Endcode = dataResult.bytes.toBase64()
        print("AESEncryptEncodeBase64: \(base64Endcode ?? "???")")
        let base64EndcodeData = Data(base64Endcode?.utf8 ?? "".utf8)
        print("AESEncryptEncodeHEX: \(base64EndcodeData.hexadecimal)")
        guard let client = client else { return }
        switch client.connect(timeout: 10) {
        case .success:
            appendToTextField(string: "Connected to host \(client.address)")
            if sendRequest(data: base64EndcodeData, using: client) {
                readResponseCheckMessege()
            }
        case .failure(let error):
            appendToTextField(string: "error: \(String(describing: error))")
        }
    }
    
    private func sendRequest(data: Data, using client: TCPClient) -> Bool {
        
        switch client.send(data: data) {
        case .success:
            appendToTextField(string: "Send Success")
            return true
        case .failure(let error):
            appendToTextField(string: "error: \(String(describing: error))")
            return false
        }
    }
    
    private func readResponse(from client: TCPClient) -> String? {
        guard let response = client.read(1024*10) else { return nil }
        
        return String(bytes: response, encoding: .utf8)
    }
    
    private func appendToTextField(string: String) {
        print(string)
    }
}

//MARK: Setup & Configuration
extension EDCViewController {
    private func setup() {
        
    }
    
    private func configure() {
        EDCConfiguration.shared.configure(self)
    }
}

extension EDCViewController : EDCDisplayLogic {
    func displaySomething(viewModel: EDC.Something.ViewModel) {
        
    }
}

extension StringProtocol {
    var hexa2Bytes: [UInt8] {
        let hexa = Array(self)
        return stride(from: 0, to: count, by: 2).compactMap { UInt8(String(hexa[$0..<$0.advanced(by: 2)]), radix: 16) }
    }}

extension String {
    func index(from: Int) -> Index {
        return self.index(startIndex, offsetBy: from)
    }

    func substring(from: Int) -> String {
        let fromIndex = index(from: from)
        return String(self[fromIndex...])
    }

    func substring(to: Int) -> String {
        let toIndex = index(from: to)
        return String(self[..<toIndex])
    }

    func substring(with r: Range<Int>) -> String {
        let startIndex = index(from: r.lowerBound)
        let endIndex = index(from: r.upperBound)
        return String(self[startIndex..<endIndex])
    }
}

extension Data {
    init?(hexString: String) {
      let len = hexString.count / 2
      var data = Data(capacity: len)
      var i = hexString.startIndex
      for _ in 0..<len {
        let j = hexString.index(i, offsetBy: 2)
        let bytes = hexString[i..<j]
        if var num = UInt8(bytes, radix: 16) {
          data.append(&num, count: 1)
        } else {
          return nil
        }
        i = j
      }
      self = data
    }
    /// Hexadecimal string representation of `Data` object.
    var hexadecimal: String {
        return map { String(format: "%02x", $0) }
            .joined()
    }
}

extension String {
    init?(cString: UnsafePointer<CChar>?) {
        guard let cString = cString else { return nil }
        self.init(cString: cString)
    }
}

extension EDCViewController: GMEllipticCurveCryptoServiceProtocal {
    func discoveryEDCDidFinish(_ data: String?) {
        print(data ?? "???")
    }
}
