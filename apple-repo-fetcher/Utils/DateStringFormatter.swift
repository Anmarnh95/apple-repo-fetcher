import Foundation


/// A class that formates Dates from iso8601 to a desired format. To use, Call DataStringFormatter.fomrat(inputDateString,outputStringFormat ), where inputDateString is the date as string in iso8601 format and outputStringFormat is the desired output format. This returns a String of the formatted date.

class DateStringFormatter{
    
    static public func format(inputDateString: String, outputStringFormat: String = "dd/MM/yyyy") throws -> String {
        
        let formatter = DateFormatter()
        let unformattedDate = try Date(inputDateString, strategy: .iso8601)
        formatter.dateFormat = outputStringFormat
        return formatter.string(from: unformattedDate)

    }
}

