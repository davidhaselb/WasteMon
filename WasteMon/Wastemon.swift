import Foundation
import SwiftUI
import IOKit.ps

@Observable class Wastemon
{
    var currentCapacity: Int?
    var appleRawAdapterDetails: NSMutableArray?
    var designCycleCount9C: Int?
    var maxCapacity: Int?
    var cycleCount: Int?
    var rawMaxCapacity: Int?
    var rawCurrentCap: Int?
    var voltage: Int?
    var co2Waste: Float? = 0.0
    var atomicWaste: Float? = 0.0
    
    let service = IOServiceGetMatchingService(kIOMainPortDefault, IOServiceNameMatching("AppleSmartBattery"))
    
    init() {
        self.calculateCO2()
        self.calculateAtomicWaste()
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            DispatchQueue.main.async {
                self.calculateCO2()
                self.calculateAtomicWaste()
            }
        }
    }
    
    func calculateCO2() {
        currentCapacity = self.getRegistryProperty(forKey: .CurrentCapacity) as? Int
        appleRawAdapterDetails = self.getRegistryProperty(forKey: .AppleRawAdapterDetails) as? NSMutableArray
        designCycleCount9C = self.getRegistryProperty(forKey: .DesignCycleCount9C) as? Int
        maxCapacity = self.getRegistryProperty(forKey: .MaxCapacity) as? Int
        cycleCount = self.getRegistryProperty(forKey: .CycleCount) as? Int
        rawMaxCapacity = self.getRegistryProperty(forKey: .AppleRawMaxCapacity) as? Int
        rawCurrentCap = self.getRegistryProperty(forKey: .AppleRawCurrentCapacity) as? Int
        voltage = self.getRegistryProperty(forKey: .AppleRawBatteryVoltage) as? Int
        let vn = Float(Int(voltage!)) * 0.001;
        //print(vn)
        let a = (Int(cycleCount!) * Int(rawMaxCapacity!)) + (Int(rawMaxCapacity!) - Int(rawCurrentCap!))
        let kwh = (Float(a) * Float(vn))/1000000
        let co2perkwh = Float(3666.67/8)
        co2Waste = (kwh * co2perkwh) * 0.001
        print("Or you helped produce " + String(co2Waste!) + " kilograms of CO2 in our atmosphere. Cheers!")
    }
    
    func calculateAtomicWaste() {
        currentCapacity = self.getRegistryProperty(forKey: .CurrentCapacity) as? Int
        appleRawAdapterDetails = self.getRegistryProperty(forKey: .AppleRawAdapterDetails) as? NSMutableArray
        designCycleCount9C = self.getRegistryProperty(forKey: .DesignCycleCount9C) as? Int
        maxCapacity = self.getRegistryProperty(forKey: .MaxCapacity) as? Int
        cycleCount = self.getRegistryProperty(forKey: .CycleCount) as? Int
        rawMaxCapacity = self.getRegistryProperty(forKey: .AppleRawMaxCapacity) as? Int
        rawCurrentCap = self.getRegistryProperty(forKey: .AppleRawCurrentCapacity) as? Int
        voltage = self.getRegistryProperty(forKey: .AppleRawBatteryVoltage) as? Int
        let vn = Float(Int(voltage!)) * 0.001;
        //print(vn)
        let a = (Int(cycleCount!) * Int(rawMaxCapacity!)) + (Int(rawMaxCapacity!) - Int(rawCurrentCap!))
        //print(a)
        let kwh = (Float(a) * Float(vn))/1000000
        //print(kwh)
        atomicWaste = (kwh * 0.0028) * 1000
        print("You got " + String(atomicWaste!) + " milligrams of atomic waste letting your laptop running. Cheers!")
    }
    
    func getRegistryProperty(forKey key: BatteryKeyType) -> Any? {
        IORegistryEntryCreateCFProperty(service, key.rawValue as CFString?, nil, 0).takeRetainedValue()
    }
}
    

    



