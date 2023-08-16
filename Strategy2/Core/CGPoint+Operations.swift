import CoreGraphics

func +(left: CGPoint, right: CGPoint)
-> CGPoint
{
    return CGPoint(x: left.x + right.x, y: left.y + right.y)
}

func *(left: CGPoint, right: Double)
-> CGPoint
{
    return CGPoint(x: left.x * right, y: left.y * right)
}
