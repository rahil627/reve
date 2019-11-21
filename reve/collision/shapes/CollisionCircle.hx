package reve.collision.shapes;

import reve.math.Circle;
import reve.math.Rectangle;
import reve.math.Vector;

class CollisionCircle implements ICollisionShape {

    public final circle: Circle;
    public final ownerID: CollisionShapeOwnerID;

    public var bounds(get, never): Rectangle;
    public var shapeType(get, never): ShapeType;

    public function new(circ: Circle, ?ownerID: CollisionShapeOwnerID) {
        circle = circ;
        this.ownerID = ownerID == null 
            ? CollisionShapeOwnerID.iota()
            : ownerID;
    }

    public static function from(center: Vector, radius: Float, ?ownerID: CollisionShapeOwnerID): CollisionCircle {
        return new CollisionCircle(new Circle(center, radius), ownerID);
    } 

    public inline function getPenetration(other: ICollisionShape): Vector {
        return PenetrationAlgorithms.getPenetration(this, other);
    }

    private inline function get_bounds(): Rectangle {
        return circle.bounds;
    }

    private inline function get_shapeType(): ShapeType {
        return ShapeType.circle(this);
    }
}