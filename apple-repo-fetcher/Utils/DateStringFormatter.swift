import Foundation


class DateStringFormatter{
    static public func format(inputDateString: String, outputStringFormat: String = "dd/MM/yyyy") throws -> String {
        
        let formatter = DateFormatter()
        let unformattedDate = try Date(inputDateString, strategy: .iso8601)
        formatter.dateFormat = outputStringFormat
        return formatter.string(from: unformattedDate)

    }
}

