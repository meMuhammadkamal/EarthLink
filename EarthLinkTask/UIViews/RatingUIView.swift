//
//  RatingUIView.swift
//  EarthLinkTask
//
//  Created by Muhammad Kamal on 20/08/2023.
//

import SwiftUI

struct RatingUIView: View {
    @Binding var rating: Int

    var label = ""

    var maximumRating = 5

    var offImage: Image = Image( "star")
    var onImage = Image("star_fill")

    var offColor = Color.white
    var onColor = Color.gray
    var body: some View {
        HStack {
            if label.isEmpty == false {
                Text(label)
            }

            ForEach(1..<maximumRating + 1, id: \.self) { number in
                image(for: number)
                    .foregroundColor(number > rating ? offColor : onColor)
                    .onTapGesture {
                        rating = number
                    }
            }
        }
    }
    func image(for number: Int) -> Image {
        if number > rating {
            return offImage ?? onImage
        } else {
            return onImage
        }
    }
}


struct RatingUIView_Previews: PreviewProvider {
    static var previews: some View {
        RatingUIView(rating: .constant(4))
    }
}
