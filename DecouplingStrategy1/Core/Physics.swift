struct Vector2
{
    var x: Double
    var y: Double
}

func +(left: Vector2, right: Vector2)
-> Vector2
{
    return Vector2(x: left.x + right.x, y: left.y + right.y)
}

func *(left: Vector2, right: Double)
-> Vector2
{
    return Vector2(x: left.x * right, y: left.y * right)
}
