

import SwiftUI

struct QuestionView: View {
	@State private var model: Model

	init(question: Question) {
		let model = Model(question: question)
		self._model = .init(initialValue: model)
	}

	var body: some View {
		ScrollView(.vertical) {
			LazyVStack(alignment: .leading, spacing: 24.0) {
				Details(question: model.question)
				if model.isLoading {
					ProgressView()
						.frame(maxWidth: .infinity, alignment: .center)
				} else {
					if let body = model.question.body {
						Text(try! AttributedString(markdown: body))
					}
					if let owner = model.question.owner {
						Owner(user: owner)
							.frame(maxWidth: .infinity, alignment: .trailing)
					}
				}
			}
			.padding(.horizontal, 20.0)
		}
		.navigationTitle("Question")
		.task { try? await model.loadQuestion() }
	}
}

struct Owner: View {
	let user: User

	var body: some View {
		HStack(spacing: 16.0) {
			AsyncImage(url: user.profileImageURL) { image in
				image
					.resizable()
					.frame(width: 48.0, height: 48.0)
					.cornerRadius(8.0)
					.foregroundColor(.secondary)
			} placeholder: {
				ProgressView()
			}
			VStack(alignment: .leading, spacing: 4.0) {
				Text(user.name)
					.font(.headline)
				Text("\(user.reputation)")
					.font(.caption)
					.foregroundColor(.secondary)
			}
		}
		.padding(.vertical, 8.0)
	}
}

#Preview {
	NavigationStack {
		QuestionView(question: .preview)
	}
}
