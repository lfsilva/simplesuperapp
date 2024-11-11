#if DEBUG
import Foundation

enum MockData: String {
    case searchByTitle = "search-by-title"
}

struct MockFileLoader {
    static func loadMockData<T: Decodable>(mockData: MockData, type: T.Type) -> T? {
        guard let url = Bundle.main.url(forResource: mockData.rawValue, withExtension: "json") else {
            print("File \(mockData.rawValue).json not found.")
            return nil
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let decodedData = try decoder.decode(T.self, from: data)
            return decodedData
        } catch {
            print("Decode error for file \(mockData.rawValue).json: \(error)")
            return nil
        }
    }
}
#endif
