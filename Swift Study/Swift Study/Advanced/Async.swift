//
//  Async.swift
//  Swift Study
//
//  Created by Harry Xiong on 2024/6/25.
//

import Foundation

func fetchData() async throws -> String? {
    do {
        try await Task.sleep(nanoseconds: 1_000_000)
        return "Data loaded"
    } catch {
        print(error)
    }
    return nil
}

func printData() async {
    print("begin")
    do {
        print("printData pending")
        let res = try await fetchData()
        print(res ?? "Nil")
    } catch {
        print(error)
    }
    print("end")
}
