import Foundation

enum BatteryKeyType: String, CaseIterable {
    case AppleRawAdapterDetails = "AppleRawAdapterDetails"
    case CurrentCapacity = "CurrentCapacity"
    case Amperage = "Amperage"
    case AppleRawCurrentCapacity = "AppleRawCurrentCapacity"
    case AbsoluteCapacity = "AbsoluteCapacity"
    case AvgTimeToFull = "AvgTimeToFull"
    case AppleRawBatteryVoltage = "AppleRawBatteryVoltage"
    case BootVoltage = "BootVoltage"
    case BatteryData = "BatteryData"
    case NominalChargeCapacity = "NominalChargeCapacity"
    case DesignCycleCount9C = "DesignCycleCount9C"
    case MaxCapacity = "MaxCapacity"
    case InstantAmperage = "InstantAmperage"
    case DesignCapacity = "DesignCapacity"
    case Voltage = "Voltage"
    case CycleCount = "CycleCount"
    case AppleRawMaxCapacity = "AppleRawMaxCapacity"
}
