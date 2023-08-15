import CoreGraphics

extension CGPoint
{
    static
    func from(_ vector: Vector2)
    -> CGPoint
    {
        return CGPoint(x: vector.x, y: vector.y)
    }
}
