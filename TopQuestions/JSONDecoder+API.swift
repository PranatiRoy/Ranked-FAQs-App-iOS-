//  JSONDecoder+API.swift
//  Lifehacks


import Foundation

extension JSONDecoder {
	static var apiDecoder: JSONDecoder {
		let decoder = JSONDecoder()
		decoder.dateDecodingStrategy = .secondsSince1970
		return decoder
	}
}
