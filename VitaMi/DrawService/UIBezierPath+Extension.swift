
import UIKit

extension UIBezierPath {
    static func calculateBounds(paths: [UIBezierPath]) -> CGRect {
        let myPaths = UIBezierPath()
        for path in paths {
            myPaths.append(path)
        }
        return (myPaths.bounds)
    }
    
    static var logoPath1: UIBezierPath {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 474.6, y: 74.3))
        path.addCurve(to: CGPoint(x: 376, y: 29.8), controlPoint1: CGPoint(x: 449.4, y: 45.6), controlPoint2: CGPoint(x: 414.4, y: 29.8))
        path.addCurve(to: CGPoint(x: 268.7, y: 89.1), controlPoint1: CGPoint(x: 322.1, y: 29.8), controlPoint2: CGPoint(x: 287.9, y: 62.1))
        path.addCurve(to: CGPoint(x: 256, y: 109.8), controlPoint1: CGPoint(x: 263.8, y: 96.1), controlPoint2: CGPoint(x: 259.5, y: 103.1))
        path.addCurve(to: CGPoint(x: 243.3, y: 89.1), controlPoint1: CGPoint(x: 252.5, y: 103.1), controlPoint2: CGPoint(x: 248.2, y: 96.1))
        path.addCurve(to: CGPoint(x: 136, y: 29.8), controlPoint1: CGPoint(x: 224.1, y: 62.1), controlPoint2: CGPoint(x: 189.9, y: 29.8))
        path.addCurve(to: CGPoint(x: 37.4, y: 74.3), controlPoint1: CGPoint(x: 97.6, y: 29.8), controlPoint2: CGPoint(x: 62.6, y: 45.6))
        path.addCurve(to: CGPoint(x: 0, y: 177.4), controlPoint1: CGPoint(x: 13.3, y: 101.6), controlPoint2: CGPoint(x: 0, y: 138.2))
        path.addCurve(to: CGPoint(x: 52.3, y: 302.1), controlPoint1: CGPoint(x: 0, y: 220), controlPoint2: CGPoint(x: 16.6, y: 259.6))
        path.addCurve(to: CGPoint(x: 183.4, y: 424.4), controlPoint1: CGPoint(x: 84.3, y: 340), controlPoint2: CGPoint(x: 130.2, y: 379.1))
        path.addCurve(to: CGPoint(x: 245.5, y: 477.9), controlPoint1: CGPoint(x: 203.2, y: 441.3), controlPoint2: CGPoint(x: 223.7, y: 458.8))
        path.addLine(to: CGPoint(x: 246.1, y: 478.5))
        path.addCurve(to: CGPoint(x: 256, y: 482.2), controlPoint1: CGPoint(x: 248.9, y: 480.9), controlPoint2: CGPoint(x: 252.5, y: 482.2))
        path.addCurve(to: CGPoint(x: 265.9, y: 478.5), controlPoint1: CGPoint(x: 259.5, y: 482.2), controlPoint2: CGPoint(x: 263.1, y: 480.9))
        path.addLine(to: CGPoint(x: 266.5, y: 477.9))
        path.addCurve(to: CGPoint(x: 328.7, y: 424.4), controlPoint1: CGPoint(x: 288.3, y: 458.8), controlPoint2: CGPoint(x: 308.8, y: 441.3))
        path.addCurve(to: CGPoint(x: 459.7, y: 302.1), controlPoint1: CGPoint(x: 381.8, y: 379.1), controlPoint2: CGPoint(x: 427.7, y: 340))
        path.addCurve(to: CGPoint(x: 512, y: 177.4), controlPoint1: CGPoint(x: 495.4, y: 259.6), controlPoint2: CGPoint(x: 512, y: 220))
        path.addCurve(to: CGPoint(x: 474.6, y: 74.3), controlPoint1: CGPoint(x: 512, y: 138.2), controlPoint2: CGPoint(x: 498.7, y: 101.6))
        path.close()
        path.move(to: CGPoint(x: 309.2, y: 401.6))
        path.addCurve(to: CGPoint(x: 256, y: 447.3), controlPoint1: CGPoint(x: 292.1, y: 416.2), controlPoint2: CGPoint(x: 274.5, y: 431.1))
        path.addCurve(to: CGPoint(x: 202.8, y: 401.6), controlPoint1: CGPoint(x: 237.5, y: 431.1), controlPoint2: CGPoint(x: 219.9, y: 416.2))
        path.addCurve(to: CGPoint(x: 30, y: 177.4), controlPoint1: CGPoint(x: 98.7, y: 312.9), controlPoint2: CGPoint(x: 30, y: 254.4))
        path.addCurve(to: CGPoint(x: 59.9, y: 94.1), controlPoint1: CGPoint(x: 30, y: 145.5), controlPoint2: CGPoint(x: 40.6, y: 116))
        path.addCurve(to: CGPoint(x: 136, y: 59.8), controlPoint1: CGPoint(x: 79.3, y: 72), controlPoint2: CGPoint(x: 106.4, y: 59.8))
        path.addCurve(to: CGPoint(x: 218.8, y: 106.4), controlPoint1: CGPoint(x: 177.1, y: 59.8), controlPoint2: CGPoint(x: 203.7, y: 85.2))
        path.addCurve(to: CGPoint(x: 241.7, y: 152.1), controlPoint1: CGPoint(x: 232.3, y: 125.5), controlPoint2: CGPoint(x: 239.3, y: 144.7))
        path.addCurve(to: CGPoint(x: 256, y: 162.4), controlPoint1: CGPoint(x: 243.7, y: 158.3), controlPoint2: CGPoint(x: 249.5, y: 162.4))
        path.addCurve(to: CGPoint(x: 270.3, y: 152.1), controlPoint1: CGPoint(x: 262.5, y: 162.4), controlPoint2: CGPoint(x: 268.3, y: 158.3))
        path.addCurve(to: CGPoint(x: 293.2, y: 106.4), controlPoint1: CGPoint(x: 272.7, y: 144.7), controlPoint2: CGPoint(x: 279.7, y: 125.5))
        path.addCurve(to: CGPoint(x: 376, y: 59.8), controlPoint1: CGPoint(x: 308.3, y: 85.2), controlPoint2: CGPoint(x: 334.9, y: 59.8))
        path.addCurve(to: CGPoint(x: 452.1, y: 94.1), controlPoint1: CGPoint(x: 405.6, y: 59.8), controlPoint2: CGPoint(x: 432.7, y: 72))
        path.addCurve(to: CGPoint(x: 482, y: 177.4), controlPoint1: CGPoint(x: 471.4, y: 116), controlPoint2: CGPoint(x: 482, y: 145.5))
        path.addCurve(to: CGPoint(x: 309.2, y: 401.6), controlPoint1: CGPoint(x: 482, y: 254.4), controlPoint2: CGPoint(x: 413.3, y: 312.9))
        path.close()

        return path
    }
}
