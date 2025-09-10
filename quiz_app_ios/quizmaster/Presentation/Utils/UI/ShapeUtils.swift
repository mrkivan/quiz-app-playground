import SwiftUI

// MARK: - Card Defaults Equivalent
enum AppCardDefaults {
    static let shape: CGFloat = 8
    static let elevation: CGFloat = 4
    static let colors: Color = Color(.systemBackground)
}

// MARK: - Spacer Helpers
struct SpacerSmallHeight: View {
    var body: some View { Spacer().frame(height: 4) }
}

struct SpacerMediumHeight: View {
    var body: some View { Spacer().frame(height: 8) }
}

struct SpacerLargeHeight: View {
    var body: some View { Spacer().frame(height: 16) }
}

struct SpacerMediumWidth: View {
    var body: some View { Spacer().frame(width: 8) }
}

struct SpacerLargeWidth: View {
    var body: some View { Spacer().frame(width: 16) }
}

// MARK: - Circle with Number
struct CircleWithNumber: View {
    let number: Int

    var body: some View {
        ZStack {
            Circle()
                .fill(Color.blue)
                .frame(width: 40, height: 40)
            Text("\(number)")
                .foregroundColor(.white)
                .font(.system(size: 18, weight: .bold))
        }
    }
}

// MARK: - Quiz Progress with Shape
struct QuizProgressWithShape: View {
    let currentQuestion: Int
    let totalQuestions: Int

    var body: some View {
        Text("\(currentQuestion) / \(totalQuestions)")
            .font(.title3)
            .foregroundColor(.white)
            .padding(.horizontal, 8)
            .padding(.vertical, 8)
            .background(
                RoundedCornerShape(
                    topLeft: 16,
                    topRight: 0,
                    bottomLeft: 0,
                    bottomRight: 16
                )
                .fill(Color.blue)
            )
    }
}

// Custom rounded corner shape
struct RoundedCornerShape: Shape {
    var topLeft: CGFloat = 0
    var topRight: CGFloat = 0
    var bottomLeft: CGFloat = 0
    var bottomRight: CGFloat = 0

    func path(in rect: CGRect) -> Path {
        var path = Path()

        let w = rect.size.width
        let h = rect.size.height

        let tr = min(min(topRight, h / 2), w / 2)
        let tl = min(min(topLeft, h / 2), w / 2)
        let bl = min(min(bottomLeft, h / 2), w / 2)
        let br = min(min(bottomRight, h / 2), w / 2)

        path.move(to: CGPoint(x: w / 2.0, y: 0))
        path.addLine(to: CGPoint(x: w - tr, y: 0))
        path.addArc(
            center: CGPoint(x: w - tr, y: tr),
            radius: tr,
            startAngle: Angle(degrees: -90),
            endAngle: Angle(degrees: 0),
            clockwise: false
        )

        path.addLine(to: CGPoint(x: w, y: h - br))
        path.addArc(
            center: CGPoint(x: w - br, y: h - br),
            radius: br,
            startAngle: Angle(degrees: 0),
            endAngle: Angle(degrees: 90),
            clockwise: false
        )

        path.addLine(to: CGPoint(x: bl, y: h))
        path.addArc(
            center: CGPoint(x: bl, y: h - bl),
            radius: bl,
            startAngle: Angle(degrees: 90),
            endAngle: Angle(degrees: 180),
            clockwise: false
        )

        path.addLine(to: CGPoint(x: 0, y: tl))
        path.addArc(
            center: CGPoint(x: tl, y: tl),
            radius: tl,
            startAngle: Angle(degrees: 180),
            endAngle: Angle(degrees: 270),
            clockwise: false
        )

        path.closeSubpath()
        return path
    }
}

// MARK: - Circular Percentage Progress
struct CircularPercentageProgress: View {
    let progress: Double  // 0.0..1.0
    let size: CGFloat
    let strokeWidth: CGFloat
    let progressColor: Color
    let backgroundColor: Color
    let percentageTextStyle: Font

    var body: some View {
        ZStack {
            // Background circle
            Circle()
                .stroke(lineWidth: strokeWidth)
                .foregroundColor(backgroundColor)

            // Progress arc
            Circle()
                .trim(from: 0, to: progress)
                .stroke(
                    progressColor,
                    style: StrokeStyle(lineWidth: strokeWidth, lineCap: .round)
                )
                .rotationEffect(.degrees(-90))

            // Percentage text
            Text("\(Int(progress * 100))%")
                .font(percentageTextStyle)
                .fontWeight(.bold)
                .foregroundColor(.black)
        }
        .frame(width: size, height: size)
    }
}

struct ComposeToSwiftUIPreviews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20) {
            CircleWithNumber(number: 20)

            QuizProgressWithShape(currentQuestion: 22, totalQuestions: 30)

            CircularPercentageProgress(
                progress: 0.7,
                size: 120,
                strokeWidth: 12,
                progressColor: .orange,
                backgroundColor: .gray.opacity(0.3),
                percentageTextStyle: .system(size: 20)
            )
        }
        .padding()
    }
}
