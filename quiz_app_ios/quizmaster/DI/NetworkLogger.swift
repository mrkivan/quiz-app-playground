import Alamofire
import Foundation

final class NetworkLogger: EventMonitor {
    let queue = DispatchQueue(label: "networklogger")

    // Request start
    func requestDidResume(_ request: Request) {
        print(
            "➡️ Request Started: \(request.request?.httpMethod ?? "") \(request.request?.url?.absoluteString ?? "")"
        )
        if let headers = request.request?.allHTTPHeaderFields, !headers.isEmpty
        {
            print("Headers: \(headers)")
        }
        if let body = request.request?.httpBody,
            let bodyString = String(data: body, encoding: .utf8)
        {
            print("Body: \(bodyString)")
        }
    }

    // Request finished and response received
    func request<Value>(
        _ request: DataRequest,
        didParseResponse response: DataResponse<Value, AFError>
    ) {
        print(
            "✅ Response for: \(request.request?.url?.absoluteString ?? "Unknown URL")"
        )
        print("Status code: \(response.response?.statusCode ?? 0)")

        // Capture raw data safely (even if decoded)
        /*
        if let data = response.data, !data.isEmpty {
            if let jsonObject = try? JSONSerialization.jsonObject(with: data),
               let prettyData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted),
               let prettyString = String(data: prettyData, encoding: .utf8) {
                print("Body: \(prettyString)")
            } else if let bodyString = String(data: data, encoding: .utf8) {
                print("Body: \(bodyString)")
            }
        } else {
            print("Body: <empty>")
        }
        */

        // Log decoding result
        switch response.result {
        case .success(let value):
            print("✅ Decoded: \(value)")
        case .failure(let error):
            print("❌ Error: \(error)")
        }
    }
}
