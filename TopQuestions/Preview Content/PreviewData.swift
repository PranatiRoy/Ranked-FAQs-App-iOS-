//  PreviewData.swift
//  TopQuestions


import Foundation

extension [Question] {
	static var preview: [Question] {
		let url = Bundle.main.url(forResource: "Questions", withExtension: "json")!
		let data = try! Data(contentsOf: url)
		let wrapper = try! JSONDecoder.apiDecoder.decode(Wrapper<Question>.self, from: data)
		return wrapper.items
	}
}

extension Question {
	static var preview: Question {
		[Question].preview[0]
	}
}

extension User {
	static var preview: User {
		Question.preview.owner!
	}
}
